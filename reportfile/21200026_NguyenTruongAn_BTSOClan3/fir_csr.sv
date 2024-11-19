module fir_csr(
  input logic clk,
  input logic rst_n,
  input logic chipselect,
  input logic write,           
  input logic read,           
  input logic [3:0] address,   
  input logic [31:0] writedata,
  input logic [17:0] dout,
  output logic [31:0] readdata,
  output logic [7:0] store [7:0]  
);
  reg [7:0] store_internal [7:0];  
  reg [31:0] data_reg;
  reg [3:0] decode_address;
  assign readdata = data_reg;
  
  always_comb begin  
     decode_address <= address[3:0];
    for (int i = 0; i < 8; i++) begin
      store[i] = store_internal[i];
    end
  end
  
  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      for (int i = 0; i < 8; i++) begin
        store_internal[i] <= 8'b0;
      end
    end else if (chipselect & write) begin
      case (decode_address)  
        4'd0: store_internal[0] <= writedata[7:0];
        4'd1: store_internal[1] <= writedata[7:0];
        4'd2: store_internal[2] <= writedata[7:0];
        4'd3: store_internal[3] <= writedata[7:0];
        4'd4: store_internal[4] <= writedata[7:0];
        4'd5: store_internal[5] <= writedata[7:0];
        4'd6: store_internal[6] <= writedata[7:0];
        4'd7: store_internal[7] <= writedata[7:0];
        default: ;
      endcase
    end 
  end
  
  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      data_reg <= 32'h0;
    end else if (chipselect & read) begin
      case (decode_address)  
        4'd0: data_reg <= {24'b0, store_internal[0]};
        4'd1: data_reg <= {24'b0, store_internal[1]};
        4'd2: data_reg <= {24'b0, store_internal[2]};
        4'd3: data_reg <= {24'b0, store_internal[3]};
        4'd4: data_reg <= {24'b0, store_internal[4]};
        4'd5: data_reg <= {24'b0, store_internal[5]};
        4'd6: data_reg <= {24'b0, store_internal[6]};
        4'd7: data_reg <= {24'b0, store_internal[7]};
        4'd8: begin
          data_reg <= {14'b0, dout};
        end
        default: data_reg <= 32'h0;
      endcase
    end else begin
      data_reg <= data_reg;
    end
  end
endmodule