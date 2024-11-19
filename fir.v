module fir(
	input CLOCK_50,
	input [0:0] KEY
);
	
    system nios_systen (
        .clk_clk       (CLOCK_50),       //   clk.clk
        .reset_reset_n (KEY)  // reset.reset_n
    );

endmodule