`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BUAA
// Engineer:dabaiaichihuluobo 
// 
// Create Date:    14:38:25 02/13/2020 
// Design Name: 	TestLVDSTop
// Module Name:    TestLVDSTop 
// Project Name: 
// Target Devices: XC7K325T
// Tool versions: ISE 14.7
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 输入为Bank33de 差分时钟；测试差分时钟如何转换为单端时钟时钟
//						输入差分时钟16.368MHz，1s发光led翻转一次。ucf约束文件中打开终端100欧姆电阻
//////////////////////////////////////////////////////////////////////////////////
module TestLVDSTop(
    input clk_p,			//16.368MHz
    input clk_n,
    input rst_n,
	output led_h
    );

//差分时钟信号转单端信号
wire clk_diff_to_single;

IBUFGDS clk_diff_to_single_inst(
	.O(clk_diff_to_single),
	.I(clk_p),
	.IB(clk_n));

wire clk16P368;
wire clk65P472;
wire LOCKED;

clkGenerator clk_gen_inst
   (// Clock in ports
    .CLK_IN1(clk_diff_to_single),      // IN
    // Clock out ports
    .CLK_OUT1(clk16P368),     // OUT
    .CLK_OUT2(clk65P472),     // OUT
    // Status and control signals
    .RESET(!rst_n),// IN
    .LOCKED(LOCKED));      // OUT
	
	
//正常逻辑，计时跑马灯
reg [25:0] cnt = 0;
reg led_o_r = 0;

always @ (posedge clk16P368 or negedge rst_n) begin
	if (!rst_n)begin
		cnt <= 0;
	end
	else begin
		if ( 16368000 == cnt ) begin
			cnt <= 0 ;
			led_o_r <= ~led_o_r;
		end
		else begin
			cnt <= cnt + 1;
		end
	end
end

assign led_h = led_o_r;

endmodule
