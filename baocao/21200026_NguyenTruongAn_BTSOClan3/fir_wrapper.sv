module fir_wrapper(
  input logic clk,
  input logic rst_n,
  input logic chipselect,
  input logic write,
  input logic read,
  input logic [3:0] address,
  input logic [31:0] writedata,
  output logic [31:0] readdata
);
  logic [7:0] din [7:0];  
  logic [17:0] dout;      
  logic [7:0] store [7:0];

  fir_fil u_fir_fil (
    .din(din),
    .clk(clk),
    .rst_n(rst_n),
    .dout(dout)
  );

  fir_csr u_fir_csr (
    .clk(clk),
    .rst_n(rst_n),
    .chipselect(chipselect),
    .write(write),
    .read(read),
    .address(address),
    .writedata(writedata),
    .dout(dout),
    .readdata(readdata),
    .store(store)  
  );

  always_comb begin
    for (int i = 0; i < 8; i++) begin
      din[i] = store[i];  
    end
  end
endmodule
