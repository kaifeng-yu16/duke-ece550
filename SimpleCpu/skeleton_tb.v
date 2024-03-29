`timescale 1 ns / 1 ps
module skeleton_tb();

reg clock, reset,errors;
wire imem_clock, dmem_clock, processor_clock, regfile_clock;
wire [11:0] address_imem;
wire [31:0] q_imem;
wire [11:0] address_dmem;
wire [31:0] data;
wire wren;
wire [31:0] q_dmem;
wire ctrl_writeEnable;
wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
wire [31:0] data_writeReg;
wire [31:0] data_readRegA, data_readRegB;
wire [31:0] alu_data_result;

skeleton skeleton_test(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock,
					 address_imem,q_imem,address_dmem,data,wren,q_dmem,ctrl_writeEnable,
					 ctrl_writeReg, ctrl_readRegA, ctrl_readRegB,data_writeReg,data_readRegA, data_readRegB, alu_data_result);
					 
			
initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;

        reset = 1'b1;    // assert reset
        @(negedge clock);    // wait until next negative edge of clock
        @(negedge clock);    // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
        @(negedge clock);    // wait until next negative edge of clock

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        
end
			
always
	#10     clock = ~clock;
	
endmodule 