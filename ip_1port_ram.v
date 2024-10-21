module ip_1port_ram (
    input clka       ,
    input rst
);
//---------------------------ram_rw------------------------// 
  wire [4 : 0] addra;
  wire [7 : 0] douta;
  wire [7 : 0] dina ;
  wire wea  ;
  wire ena  ;

 ram_rw ram_rw1(
 .   clka  (clka )     ,
 .   rst   (rst  )     ,
 .   douta (douta)     ,

 .   dina  (dina )     ,
 .   addra (addra)     ,
 .   wea   (wea  )     ,
 .   ena   (ena  )
 );
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
 BMGR BMGR1 (
   .  clka   (clka),    // input wire clka
   .  ena    (ena),      // input wire ena
   .  wea    (wea),      // input wire [0 : 0] wea
   .  addra  (addra),  // input wire [4 : 0] addra
   .  dina   (dina),    // input wire [7 : 0] dina
   .  douta  (douta)  // output wire [7 : 0] douta
 );
endmodule
