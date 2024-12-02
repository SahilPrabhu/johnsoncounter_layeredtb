interface johnson_counter_if(input bit clk, reset);
    logic [3:0] out;
    modport driver (output reset, input clk, input out);
    modport monitor (input clk, input reset, input out);
endinterface
