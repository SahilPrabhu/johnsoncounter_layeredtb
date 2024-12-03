module johnson_counter(
	input bit clk,reset,
    output logic [3:0] out
  );

  always @ (posedge clk) begin
    if (!reset)
         out <= 4'b0001;
      else begin
        out[3] <= ~out[0];
        for (int i = 0; i < 3; i=i+1) begin
          out[i] <= out[i+1];
        end
      end
  end
endmodule
