// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.1 (lin64) Build 5094488 Fri Jun 14 08:57:50 MDT 2024
// Date        : Sun Dec  1 15:01:00 2024
// Host        : nixos running 64-bit NixOS 24.05 (Uakari)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/imsozrious/work/vivado/final_project/final_project.sim/sim_1/impl/timing/xsim/system_time_impl.v
// Design      : system
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "6aedf956" *) (* H1 = "210" *) (* H2 = "242" *) 
(* Hrst = "264" *) (* V1 = "600" *) (* V2 = "604" *) 
(* Vrst = "628" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module system
   (led,
    Vsync,
    Hsync,
    vgaRed,
    vgaBlue,
    vgaGreen,
    clk);
  output [0:0]led;
  output Vsync;
  output Hsync;
  output [3:0]vgaRed;
  output [3:0]vgaBlue;
  output [3:0]vgaGreen;
  input clk;

  wire Hsync;
  wire Hsync_OBUF;
  wire Hsync_OBUF_inst_i_2_n_0;
  wire Vsync;
  wire Vsync_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \hcounter[7]_i_2_n_0 ;
  wire \hcounter[8]_i_1_n_0 ;
  wire \hcounter[8]_i_3_n_0 ;
  wire \hcounter[8]_i_4_n_0 ;
  wire [8:0]hcounter_reg;
  wire [0:0]led;
  wire \led_OBUF[0]_inst_i_2_n_0 ;
  wire [8:0]p_0_in;
  wire vcounter;
  wire \vcounter[0]_i_1_n_0 ;
  wire \vcounter[1]_i_1_n_0 ;
  wire \vcounter[2]_i_1_n_0 ;
  wire \vcounter[3]_i_1_n_0 ;
  wire \vcounter[4]_i_1_n_0 ;
  wire \vcounter[5]_i_1_n_0 ;
  wire \vcounter[6]_i_1_n_0 ;
  wire \vcounter[7]_i_1_n_0 ;
  wire \vcounter[8]_i_1_n_0 ;
  wire \vcounter[9]_i_2_n_0 ;
  wire \vcounter[9]_i_3_n_0 ;
  wire \vcounter[9]_i_4_n_0 ;
  wire \vcounter[9]_i_5_n_0 ;
  wire [9:0]vcounter_reg;
  wire [3:0]vgaBlue;
  wire [3:0]vgaGreen;
  wire [3:0]vgaRed;

initial begin
 $sdf_annotate("system_time_impl.sdf",,,,"tool_control");
end
  OBUF Hsync_OBUF_inst
       (.I(Hsync_OBUF),
        .O(Hsync));
  LUT6 #(
    .INIT(64'hFDDFDFDFFFFFFFFF)) 
    Hsync_OBUF_inst_i_1
       (.I0(hcounter_reg[7]),
        .I1(hcounter_reg[8]),
        .I2(hcounter_reg[5]),
        .I3(hcounter_reg[4]),
        .I4(Hsync_OBUF_inst_i_2_n_0),
        .I5(hcounter_reg[6]),
        .O(Hsync_OBUF));
  LUT4 #(
    .INIT(16'hFEEE)) 
    Hsync_OBUF_inst_i_2
       (.I0(hcounter_reg[3]),
        .I1(hcounter_reg[2]),
        .I2(hcounter_reg[1]),
        .I3(hcounter_reg[0]),
        .O(Hsync_OBUF_inst_i_2_n_0));
  OBUF Vsync_OBUF_inst
       (.I(Vsync_OBUF),
        .O(Vsync));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \hcounter[0]_i_1 
       (.I0(hcounter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \hcounter[1]_i_1 
       (.I0(hcounter_reg[0]),
        .I1(hcounter_reg[1]),
        .O(p_0_in[1]));
  (* \PinAttr:I2:HOLD_DETOUR  = "190" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \hcounter[2]_i_1 
       (.I0(hcounter_reg[1]),
        .I1(hcounter_reg[0]),
        .I2(hcounter_reg[2]),
        .O(p_0_in[2]));
  LUT4 #(
    .INIT(16'h7F80)) 
    \hcounter[3]_i_1 
       (.I0(hcounter_reg[2]),
        .I1(hcounter_reg[0]),
        .I2(hcounter_reg[1]),
        .I3(hcounter_reg[3]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \hcounter[4]_i_1 
       (.I0(hcounter_reg[3]),
        .I1(hcounter_reg[1]),
        .I2(hcounter_reg[0]),
        .I3(hcounter_reg[2]),
        .I4(hcounter_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \hcounter[5]_i_1 
       (.I0(hcounter_reg[4]),
        .I1(hcounter_reg[2]),
        .I2(hcounter_reg[0]),
        .I3(hcounter_reg[1]),
        .I4(hcounter_reg[3]),
        .I5(hcounter_reg[5]),
        .O(p_0_in[5]));
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \hcounter[6]_i_1 
       (.I0(\hcounter[7]_i_2_n_0 ),
        .I1(hcounter_reg[3]),
        .I2(hcounter_reg[4]),
        .I3(hcounter_reg[5]),
        .I4(hcounter_reg[6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'hFFFF7FFF00008000)) 
    \hcounter[7]_i_1 
       (.I0(hcounter_reg[6]),
        .I1(hcounter_reg[5]),
        .I2(hcounter_reg[4]),
        .I3(hcounter_reg[3]),
        .I4(\hcounter[7]_i_2_n_0 ),
        .I5(hcounter_reg[7]),
        .O(p_0_in[7]));
  (* \PinAttr:I2:HOLD_DETOUR  = "190" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \hcounter[7]_i_2 
       (.I0(hcounter_reg[1]),
        .I1(hcounter_reg[0]),
        .I2(hcounter_reg[2]),
        .O(\hcounter[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \hcounter[8]_i_1 
       (.I0(\hcounter[8]_i_3_n_0 ),
        .I1(hcounter_reg[2]),
        .I2(hcounter_reg[0]),
        .I3(hcounter_reg[1]),
        .O(\hcounter[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFF20000000)) 
    \hcounter[8]_i_2 
       (.I0(hcounter_reg[7]),
        .I1(\hcounter[8]_i_4_n_0 ),
        .I2(hcounter_reg[4]),
        .I3(hcounter_reg[5]),
        .I4(hcounter_reg[6]),
        .I5(hcounter_reg[8]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \hcounter[8]_i_3 
       (.I0(hcounter_reg[5]),
        .I1(hcounter_reg[6]),
        .I2(hcounter_reg[3]),
        .I3(hcounter_reg[4]),
        .I4(hcounter_reg[7]),
        .I5(hcounter_reg[8]),
        .O(\hcounter[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \hcounter[8]_i_4 
       (.I0(hcounter_reg[2]),
        .I1(hcounter_reg[0]),
        .I2(hcounter_reg[1]),
        .I3(hcounter_reg[3]),
        .O(\hcounter[8]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(hcounter_reg[0]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(hcounter_reg[1]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(hcounter_reg[2]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(hcounter_reg[3]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(hcounter_reg[4]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(hcounter_reg[5]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(hcounter_reg[6]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(hcounter_reg[7]),
        .R(\hcounter[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hcounter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[8]),
        .Q(hcounter_reg[8]),
        .R(\hcounter[8]_i_1_n_0 ));
  OBUF \led_OBUF[0]_inst 
       (.I(Vsync_OBUF),
        .O(led));
  LUT5 #(
    .INIT(32'hFFFFF7FF)) 
    \led_OBUF[0]_inst_i_1 
       (.I0(vcounter_reg[4]),
        .I1(vcounter_reg[3]),
        .I2(vcounter_reg[5]),
        .I3(vcounter_reg[6]),
        .I4(\led_OBUF[0]_inst_i_2_n_0 ),
        .O(Vsync_OBUF));
  LUT6 #(
    .INIT(64'hFFFBFFFBFFFBFBFF)) 
    \led_OBUF[0]_inst_i_2 
       (.I0(vcounter_reg[8]),
        .I1(vcounter_reg[9]),
        .I2(vcounter_reg[7]),
        .I3(vcounter_reg[2]),
        .I4(vcounter_reg[0]),
        .I5(vcounter_reg[1]),
        .O(\led_OBUF[0]_inst_i_2_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \vcounter[0]_i_1 
       (.I0(vcounter_reg[0]),
        .O(\vcounter[0]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \vcounter[1]_i_1 
       (.I0(vcounter_reg[0]),
        .I1(vcounter_reg[1]),
        .O(\vcounter[1]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "193" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \vcounter[2]_i_1 
       (.I0(vcounter_reg[1]),
        .I1(vcounter_reg[0]),
        .I2(vcounter_reg[2]),
        .O(\vcounter[2]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \vcounter[3]_i_1 
       (.I0(vcounter_reg[2]),
        .I1(vcounter_reg[0]),
        .I2(vcounter_reg[1]),
        .I3(vcounter_reg[3]),
        .O(\vcounter[3]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \vcounter[4]_i_1 
       (.I0(vcounter_reg[3]),
        .I1(vcounter_reg[1]),
        .I2(vcounter_reg[0]),
        .I3(vcounter_reg[2]),
        .I4(vcounter_reg[4]),
        .O(\vcounter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \vcounter[5]_i_1 
       (.I0(vcounter_reg[4]),
        .I1(vcounter_reg[2]),
        .I2(vcounter_reg[0]),
        .I3(vcounter_reg[1]),
        .I4(vcounter_reg[3]),
        .I5(vcounter_reg[5]),
        .O(\vcounter[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \vcounter[6]_i_1 
       (.I0(vcounter_reg[5]),
        .I1(vcounter_reg[3]),
        .I2(\vcounter[9]_i_3_n_0 ),
        .I3(vcounter_reg[2]),
        .I4(vcounter_reg[4]),
        .I5(vcounter_reg[6]),
        .O(\vcounter[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD2)) 
    \vcounter[7]_i_1 
       (.I0(vcounter_reg[6]),
        .I1(\vcounter[9]_i_5_n_0 ),
        .I2(vcounter_reg[7]),
        .O(\vcounter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \vcounter[8]_i_1 
       (.I0(vcounter_reg[7]),
        .I1(\vcounter[9]_i_5_n_0 ),
        .I2(vcounter_reg[6]),
        .I3(vcounter_reg[8]),
        .O(\vcounter[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \vcounter[9]_i_1 
       (.I0(\hcounter[8]_i_3_n_0 ),
        .I1(\vcounter[9]_i_3_n_0 ),
        .I2(vcounter_reg[8]),
        .I3(vcounter_reg[9]),
        .I4(\hcounter[7]_i_2_n_0 ),
        .I5(\vcounter[9]_i_4_n_0 ),
        .O(vcounter));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hCC6CCCCC)) 
    \vcounter[9]_i_2 
       (.I0(vcounter_reg[8]),
        .I1(vcounter_reg[9]),
        .I2(vcounter_reg[6]),
        .I3(\vcounter[9]_i_5_n_0 ),
        .I4(vcounter_reg[7]),
        .O(\vcounter[9]_i_2_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "193" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \vcounter[9]_i_3 
       (.I0(vcounter_reg[0]),
        .I1(vcounter_reg[1]),
        .O(\vcounter[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \vcounter[9]_i_4 
       (.I0(vcounter_reg[4]),
        .I1(vcounter_reg[5]),
        .I2(vcounter_reg[2]),
        .I3(vcounter_reg[3]),
        .I4(vcounter_reg[7]),
        .I5(vcounter_reg[6]),
        .O(\vcounter[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \vcounter[9]_i_5 
       (.I0(vcounter_reg[4]),
        .I1(vcounter_reg[2]),
        .I2(vcounter_reg[0]),
        .I3(vcounter_reg[1]),
        .I4(vcounter_reg[3]),
        .I5(vcounter_reg[5]),
        .O(\vcounter[9]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[0]_i_1_n_0 ),
        .Q(vcounter_reg[0]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[1]_i_1_n_0 ),
        .Q(vcounter_reg[1]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[2]_i_1_n_0 ),
        .Q(vcounter_reg[2]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[3]_i_1_n_0 ),
        .Q(vcounter_reg[3]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[4]_i_1_n_0 ),
        .Q(vcounter_reg[4]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[5]_i_1_n_0 ),
        .Q(vcounter_reg[5]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[6]_i_1_n_0 ),
        .Q(vcounter_reg[6]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[7]_i_1_n_0 ),
        .Q(vcounter_reg[7]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[8]_i_1_n_0 ),
        .Q(vcounter_reg[8]),
        .R(vcounter));
  FDRE #(
    .INIT(1'b0)) 
    \vcounter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\hcounter[8]_i_1_n_0 ),
        .D(\vcounter[9]_i_2_n_0 ),
        .Q(vcounter_reg[9]),
        .R(vcounter));
  OBUF \vgaBlue_OBUF[0]_inst 
       (.I(1'b0),
        .O(vgaBlue[0]));
  OBUF \vgaBlue_OBUF[1]_inst 
       (.I(1'b0),
        .O(vgaBlue[1]));
  OBUF \vgaBlue_OBUF[2]_inst 
       (.I(1'b0),
        .O(vgaBlue[2]));
  OBUF \vgaBlue_OBUF[3]_inst 
       (.I(1'b0),
        .O(vgaBlue[3]));
  OBUF \vgaGreen_OBUF[0]_inst 
       (.I(1'b0),
        .O(vgaGreen[0]));
  OBUF \vgaGreen_OBUF[1]_inst 
       (.I(1'b0),
        .O(vgaGreen[1]));
  OBUF \vgaGreen_OBUF[2]_inst 
       (.I(1'b0),
        .O(vgaGreen[2]));
  OBUF \vgaGreen_OBUF[3]_inst 
       (.I(1'b1),
        .O(vgaGreen[3]));
  OBUF \vgaRed_OBUF[0]_inst 
       (.I(1'b0),
        .O(vgaRed[0]));
  OBUF \vgaRed_OBUF[1]_inst 
       (.I(1'b0),
        .O(vgaRed[1]));
  OBUF \vgaRed_OBUF[2]_inst 
       (.I(1'b0),
        .O(vgaRed[2]));
  OBUF \vgaRed_OBUF[3]_inst 
       (.I(1'b0),
        .O(vgaRed[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
