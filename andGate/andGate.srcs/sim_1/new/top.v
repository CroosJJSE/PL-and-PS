`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:43:08 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module top;

    // Inputs
    reg a, b;
    // Output
    wire c;

    // Instantiate the Unit Under Test (UUT)
    andGatre uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Initialize inputs
        a = 1'b0;
        b = 1'b0;

        // Wait 100 units of time for the circuit to settle
        #100;

        // Check the output
        if (c !== (a & b)) begin
            $display("Test failed for a=0, b=0");
        end else begin
            $display("Test passed for a=0, b=0");
        end

        // Repeat the same for other test cases
        // Test case 2
        a = 1'b1;
        b = 1'b0;
        #100;
        if (c !== (a & b)) begin
            $display("Test failed for a=1, b=0");
        end else begin
            $display("Test passed for a=1, b=0");
        end

        // Test case 3
        a = 1'b0;
        b = 1'b1;
        #100;
        if (c !== (a & b)) begin
            $display("Test failed for a=0, b=1");
        end else begin
            $display("Test passed for a=0, b=1");
        end

        // Test case 4
        a = 1'b1;
        b = 1'b1;
        #100;
        if (c !== (a & b)) begin
            $display("Test failed for a=1, b=1");
        end else begin
            $display("Test passed for a=1, b=1");
        end

        // End simulation
        $finish;
    end
endmodule
