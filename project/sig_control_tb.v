`define TRUE 1'b1
`define FALSE 1'b0
`define GREEN 2'd0
`define YELLOW 2'd1
`define RED 2'd2
module sig_control_tb;
  wire [1:0] HWY_SIG, CNTRY_SIG;//for outputs
  reg CARS_ON_CNTRY_RD;//x
  reg CLEAR, CLOCK;
  //create instance from sig_control
  sig_control sc(.hwy(HWY_SIG),.cntry(CNTRY_SIG),.x(CARS_ON_CNTRY_RD),.clock(CLOCK),.clear(CLEAR));
  //set up monitor
  initial
  $monitor("%d hwy signal = %b, cntry signal = %b, cars on cntry road = %b",$time,HWY_SIG,CNTRY_SIG,CARS_ON_CNTRY_RD);
  //set up clock
  initial 
  begin
    CLOCK = `FALSE;
    forever #5 CLOCK = ~CLOCK;
  end
  //clear signal control 
  initial 
  begin
    CLEAR = `TRUE;
    repeat (5) @(negedge CLOCK);
    CLEAR = `FALSE;
  end
  //simulus
  initial
  begin
    CARS_ON_CNTRY_RD = `FALSE;
    
    #200 CARS_ON_CNTRY_RD = `TRUE;
    #100 CARS_ON_CNTRY_RD = `FALSE;
  
    #200 CARS_ON_CNTRY_RD = `TRUE;
    #100 CARS_ON_CNTRY_RD = `FALSE;
    
    #200 CARS_ON_CNTRY_RD = `TRUE;
    #100 CARS_ON_CNTRY_RD = `FALSE;
    
    #100 $STOP;
  end
endmodule