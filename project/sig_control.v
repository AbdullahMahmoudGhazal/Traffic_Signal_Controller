`define TRUE 1'b1
`define FALSE 1'b0
`define GREEN 2'd0
`define YELLOW 2'd1
`define RED 2'd2
//state definition
`define S0 3'd0
`define S1 3'd1
`define S2 3'd2
`define S3 3'd3
`define S4 3'd4
//delay definition
`define Y_TO_R_DEL 3
`define R_TO_G_DEL 2

module sig_control(hwy, cntry, x, clock, clear);
  output [1:0] hwy,cntry;
  reg [1:0] hwy, cntry;
  input x;
  input clock, clear;
  
  //internal state variables
  //each state => 3-bit
  reg [2:0] state;
  reg [2:0] next_state;
  
  initial 
  begin 
    state = `S0;//starting from s0
    next_state = `S0;
    hwy = `GREEN;
    cntry = `RED;
end
//state change at +ve edge transition of clk
always @(posedge clock)
begin
  case(state)
    `S0: 
      begin 
          hwy = `GREEN;
          cntry = `RED;
      end
     `S1:
       begin
          hwy = `YELLOW;
          cntry = `RED;
       end
       `S2:
        begin
          hwy = `RED;
          cntry = `RED;
        end
        `S3:
          begin
           hwy = `RED;
           cntry = `GREEN;
          end
         `S4:
           begin
            hwy = `RED;
            cntry = `YELLOW;
           end
   endcase
end    
 
 //state machine 
always @(state or x or clear)
begin
  if(clear)
    next_state = `S0;
else 
  case(state)
    `S0: 
     if(x)
       next_state = `S1;
    else
       next_state = `S0;
     `S1:
       begin
        repeat(`Y_TO_R_DEL) @(posedge clock);
        next_state = `S2;
       end
      `S2:
        begin
         repeat(`R_TO_G_DEL) @(posedge clock);
         next_state = `S3;
        end
       `S3:
         if(x)
           next_state = `S3;
         else
           next_state = `S4;
        `S4:
          begin
            repeat(`Y_TO_R_DEL) @(posedge clock);
            next_state = `S0;
          end
        default: next_state = `S0;
      endcase
  end
endmodule