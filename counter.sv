module counter(
input logic clk,satEn,reset,
output logic [3:0] output_data
);
logic[3:0] sum;
assign output_data=sum;

always_ff @(posedge clk or posedge reset) begin
if(reset)
	sum<=0;
	else
		if(!satEn)
			sum<=sum+1;
	else
		if(satEn)begin
			if(sum>=11)
				sum<=11;
			else
				sum<=sum+1;

		end

end
endmodule
