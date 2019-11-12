module counter_tb;

logic clk, rst_n;
logic sat_enable;
logic [3:0] counter_out;
always begin //generate clock
 clk = 1;
 #5ns;
 clk = 0;
 #5ns;
end

counter
my_counter
     (.clk (clk),
     .reset (rst_n),
     .satEn (sat_enable),
     .output_data (counter_out));
initial begin
//Time 0
 $display("Starting Testbench");
 sat_enable <= 0; //Set starting values
 rst_n <= 1;
 @(posedge clk); //First posedge occurred(10ns)
 rst_n <= 0;
 repeat(17) @(posedge clk);
 sat_enable <= 1;
 @(posedge clk); //And so on...
 repeat(11) @(posedge clk);
 sat_enable <= 0;
 repeat(3) @(posedge clk);
 sat_enable <= 1;
 $display("Finished");
end
endmodule
