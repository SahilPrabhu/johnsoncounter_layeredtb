class johnson_counter_scoreboard;
    logic [3:0] expected_value;
    function void reset();
        expected_value = 4'b0001;
        $display("Scoreboard: Reset expected value to %b at time %t", expected_value, $time);
    endfunction
    function void check_output(logic [3:0] observed_value);
        if (observed_value !== expected_value) begin
            $error("Mismatch! Observed = %b, Expected = %b at time %t", observed_value, expected_value, $time);
        end else begin
            $display("Scoreboard: Observed = %b matches Expected = %b", observed_value, expected_value);
        end
        expected_value = {~expected_value[0], expected_value[3:1]};
        $display("Scoreboard: Updated expected value to %b at time %t", expected_value, $time);
    endfunction
endclass
