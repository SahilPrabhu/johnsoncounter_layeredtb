class johnson_counter_driver;
    virtual johnson_counter_if.driver vif;

    event reset_done;

    function new(virtual johnson_counter_if.driver vif);
        this.vif = vif;
    endfunction

    task drive_reset_sequence();
        $display("Driver: Driving reset at time %t", $time);
        vif.reset <= 0;
        repeat (2) @(posedge vif.clk); 
        vif.reset <= 1; 
        $display("Driver: Reset deasserted at time %t", $time);
        -> reset_done; 
        @(posedge vif.clk); 
    endtask
endclass
