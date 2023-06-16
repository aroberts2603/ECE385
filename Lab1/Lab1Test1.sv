module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
					// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because your device under test will be instantiated as a module inside your testbench

logic Clk = 0;

logic D3;
logic D2;
logic D1;
logic D0;

logic F2;
logic F1;
logic F0;

logic R1;
logic R0;

logic Execute;
logic LOADA;
logic LOADB;

logic A3;
logic A2;
logic A1;
logic A0;

logic B3;
logic B2;
logic B1;
logic B0;

// Instantiating the DUT
// Make sure the module and signal names match with those in your design
Lab1 dut0(.CLK(Clk), .Execute(Execute), .LOADA(LOADA), .LOADB(LOADB),
				 .D3(D3), .D2(D2), .D1(D1), .D0(D0), .F2(F2), .F1(F1), .F0(F0),
				 .A3(A3), .A2(A2), .A1(A1), .A0(A0), .B3(B3), .B2(B2), .B1(B1), .B0(B0),
				 .R1(R1), .R0(R0));

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 


initial begin: TEST_VECTORS
//Put your test vectors here

//CLRN = 1'b0;
//#5 CLRN = 1'b1;

//Load A with 1101
//Load B with 0101
//NAND A, B, store the result in B (do NOT load again)
//XOR A, B, result in A (use the result from previous computation)
//SWAP A, B, turn off execute immediately after it’s on (use the result from previous computation)


// LOADS THE REGISTERS
Execute = 1'b0;
LOADA = 1'b0;
LOADB = 1'b0;

D3 = 1'b1;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b1;

#4 LOADA = 1'b1;
#4 LOADA = 1'b0;

D3 = 1'b0;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b1;

#4 LOADB = 1'b1;
#4 LOADB = 1'b0;


D3 = 1'b0;
D2 = 1'b0;
D1 = 1'b0;
D0 = 1'b0;

// A NAND B, STORE B
F2 = 1'b1;
F1 = 1'b0;
F0 = 1'b0;

R1 = 1'b0;
R0 = 1'b1;

#4 Execute = 1'b1;
#3 Execute = 1'b0;

#10

//A XOR B, STORE A
F2 = 1'b0;
F1 = 1'b1;
F0 = 1'b0;

R1 = 1'b1;
R0 = 1'b0;

#4 Execute = 1'b1;
#3 Execute = 1'b0;

#10

//SWAP A B
F2 = 1'b1;
F1 = 1'b0;
F0 = 1'b0;

R1 = 1'b1;
R0 = 1'b1;

#4 Execute = 1'b1;
#1 Execute = 1'b0;


end


endmodule
	