module fir_fil(
  input logic [7:0] din [7:0],
  input logic clk,
  input logic rst_n,
  output logic [17:0] dout
);
  
  reg [17:0] sum;
  localparam logic [7:0] h [7:0] ='{8'd8, 8'd7, 8'd6, 8'd5, 8'd4, 8'd3, 8'd2, 8'd1};
  localparam int TAB = 8; 
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      dout <= 18'b0;  
      sum <= 18'b0;
    end 
    else begin
      sum = 18'b0;
      for (int j = 0; j < TAB; j++) begin
       sum = sum + h[j] * din[TAB - 1 - j]; 
      end
      dout <= sum;
    end
  end
endmodule