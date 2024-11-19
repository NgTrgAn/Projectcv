module fir_csr(
  input wire clk,
  input wire rst_n,
  input wire chipselect,
  input wire write,
  input wire read,
  input wire [3:0] address,
  input wire [31:0] writedata,
  input wire [17:0] dout,
  input wire status,
  output reg control,
  output reg [31:0] readdata,
  output reg [7:0] store0,
  output reg [7:0] store1,
  output reg [7:0] store2,
  output reg [7:0] store3,
  output reg [7:0] store4,
  output reg [7:0] store5,
  output reg [7:0] store6,
  output reg [7:0] store7
);

  reg [7:0] store_internal [7:0];
  reg [31:0] data_reg;
  reg [3:0] decode_address;
  integer i;  // Declare integer for loop index

  // Assign store_internal to individual store outputs
  always @(*) begin
    decode_address = address[3:0];
    store0 = store_internal[0];
    store1 = store_internal[1];
    store2 = store_internal[2];
    store3 = store_internal[3];
    store4 = store_internal[4];
    store5 = store_internal[5];
    store6 = store_internal[6];
    store7 = store_internal[7];
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (i = 0; i < 8; i = i + 1) begin
        store_internal[i] <= 8'b0;
      end
    end else if (chipselect & write & status) begin
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
    if (!rst_n) begin
      data_reg <= 32'h0;
      control <= 1'b0;
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
          control <= 1'b1;
          data_reg <= {14'b0, dout};
        end
        default: data_reg <= 32'h0;
      endcase
    end else begin
      data_reg <= data_reg;
      control <= 1'b0;
    end
  end
endmodule
