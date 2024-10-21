`timescale 1ns/1ps
module tb_single_ram ;
 reg clka   ;
 reg rst    ;    
ip_1port_ram ip_1port_ram1(
    . clka  (clka)       ,
    . rst   (rst)
);

/*-------------clka¡¢rst------------*/
initial begin
    clka = 1'b0;
    rst = 1'b0;
    #201;
    rst = 1'b1;
    #8000;
    $stop;
end
always #10 clka = ~clka;
endmodule
