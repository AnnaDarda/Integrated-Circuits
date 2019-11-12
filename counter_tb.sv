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

cntr_name
 (.clk (clk),
 .reset (rst_n),
 .satEn (sat_enable),
 .output_data (counter_out));
initial begin
//Time 0
 $display("Sarting Testbench");
 sat_enable <= 0; //Set starting values
 rst_n <= 1;
 @(posedge clk); //First posedge occurred(10ns)
 rst_n <= 0;
 repeat(17) @(posedge clk); //Second posedge occurred(20ns)
 sat_enable <= 1;
 @(posedge clk); //And so on...
 repeat(10) @(posedge clk);
 sat_enable <= 0;

 repeat(6) @(posedge clk);
 
 $display("Finished");
end
endmodule
