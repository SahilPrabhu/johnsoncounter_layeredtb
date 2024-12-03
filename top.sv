`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "generator.sv"
`include "environment.sv"
module johnson_counter_tb;
    bit clk, reset;
    logic [3:0] out;
    johnson_counter_if intf(clk, reset);
    johnson_counter dut (
        .clk(intf.clk),
        .reset(intf.reset),
        .out(intf.out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    johnson_counter_env env;
    initial begin
        env = new(intf.driver, intf.monitor);
        reset = 1;
        #10 reset = 0;
        env.run();
        #200 $finish
    end
endmodule
