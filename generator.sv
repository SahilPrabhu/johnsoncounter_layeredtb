class johnson_counter_generator;
    johnson_counter_driver driver;
  
    function new(johnson_counter_driver driver);
        this.driver = driver;
    endfunction
    task run_generator();
        driver.drive_reset_sequence();
    endtask
endclass
