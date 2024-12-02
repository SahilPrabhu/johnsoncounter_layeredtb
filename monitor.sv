class johnson_counter_monitor;
    virtual johnson_counter_if.monitor vif;
    event output_change_event;
    logic [3:0] observed_out;
    function new(virtual johnson_counter_if.monitor vif);
        this.vif = vif;
    endfunction
    task monitor_signals();
        @(negedge vif.reset); 
        repeat (2) @(posedge vif.clk); 
        forever begin
            @(posedge vif.clk);
            if (observed_out !== vif.out) begin
                observed_out = vif.out;
                $display("Monitor: Observed output = %b at time %t", observed_out, $time);
                -> output_change_event; 
            end
        end
    endtask
endclass
