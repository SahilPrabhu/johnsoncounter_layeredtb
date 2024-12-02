class johnson_counter_env;
    johnson_counter_driver driver;
    johnson_counter_monitor monitor;
    johnson_counter_scoreboard scoreboard;
    johnson_counter_generator generator;

    function new(
        virtual johnson_counter_if.driver driver_if,
        virtual johnson_counter_if.monitor monitor_if
    );
        driver = new(driver_if);
        monitor = new(monitor_if);
        scoreboard = new();
        generator = new(driver);
    endfunction
    task run();
        fork
            monitor.monitor_signals();
            generator.run_generator();
            forever begin
                @(monitor.output_change_event);
                scoreboard.check_output(monitor.observed_out);
            end
        join_none

        @(driver.reset_done);
        scoreboard.reset();   
        $display("Environment: Scoreboard reset at time %t", $time);
    endtask
endclass
