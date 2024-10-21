module ram_rw (
 input                    clka             ,
 input                    rst              ,
 input          [7:0]     douta            ,

 output  reg    [7:0]     dina             ,
 output  reg    [4:0]     addra            ,
 output                   wea              ,
 output  reg              ena    
);
/*----------cnt---------------------------------------*/
 reg [5:0] cnt;
 always @(posedge clka or negedge rst) begin
    if (!rst) begin
      cnt <= 6'd0;
    end
    else if(ena) begin
      if (cnt == 6'd63) begin
        cnt <= 6'd0;
      end 
      else
        cnt <= cnt + 6'd1;
    end      
 end
/*----------ena---------------------------------------*/
 always @(posedge clka or negedge rst) begin
    if (!rst) begin
      ena <= 1'd0;
    end 
    else
      ena <= 1'd1;
 end
/*----------wea---------------------------------------*/
 assign wea = ((ena==1'b1) && (cnt <= 6'd31)) ? 1'b1 : 1'b0 ;
/*----------addra-------------------------------------*/
 always @(posedge clka or negedge rst) begin
    if (!rst) begin
      addra <= 5'd0;
    end
    else if(ena) begin
      if (cnt == 6'd31) begin
        addra <= 5'd0;
      end
      else
        addra <= addra + 5'd1;
    end
end
/*----------dina--------------------------------------*/
 always @(posedge clka or negedge rst) begin
    if (!rst) begin
      dina <= 8'd0;
    end
    else if (wea) begin
      if (cnt == 6'd31) begin
        dina <= 8'd0;
      end 
      else if (cnt >= 6'd0) begin
        dina <= dina + 8'd1;
      end
    end
    else
      dina <= dina;    
 end
endmodule
