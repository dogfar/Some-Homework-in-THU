-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"

-- DATE "05/08/2019 08:01:16"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, maxii;
USE IEEE.std_logic_1164.all;
USE maxii.maxii_components.all;

ENTITY 	Counter IS
    PORT (
	c_clk : IN std_logic;
	c_rst : IN std_logic;
	outh : OUT std_logic_vector(6 DOWNTO 0);
	outl : OUT std_logic_vector(6 DOWNTO 0)
	);
END Counter;

ARCHITECTURE structure OF Counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_c_clk : std_logic;
SIGNAL ww_c_rst : std_logic;
SIGNAL ww_outh : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_outl : std_logic_vector(6 DOWNTO 0);
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~20\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~22\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\ : std_logic;
SIGNAL \c_clk~combout\ : std_logic;
SIGNAL \c_rst~combout\ : std_logic;
SIGNAL \t_rst~0_combout\ : std_logic;
SIGNAL \u4|tmp~regout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\ : std_logic;
SIGNAL \u2|tmp~regout\ : std_logic;
SIGNAL \u3|tmp~regout\ : std_logic;
SIGNAL \u5|tmp~regout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_29\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_23\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_27\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ : std_logic;
SIGNAL \num[3]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ : std_logic;
SIGNAL \u1|tmp~regout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~14_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_26\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_30\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13COUT1_32\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Mux6~6_combout\ : std_logic;
SIGNAL \Mux5~6_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~5_combout\ : std_logic;
SIGNAL \u0|tmp~regout\ : std_logic;
SIGNAL \num[0]~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_23\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_25\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_27\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_29\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_30\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_36\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~79_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUTCOUT1_32\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ : std_logic;
SIGNAL \Mux13~6_combout\ : std_logic;
SIGNAL \Mux12~6_combout\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux10~2_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Mux7~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_Mux5~6_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~5_combout\ : std_logic;
SIGNAL \u0|ALT_INV_tmp~regout\ : std_logic;
SIGNAL \u1|ALT_INV_tmp~regout\ : std_logic;
SIGNAL \u2|ALT_INV_tmp~regout\ : std_logic;
SIGNAL \u3|ALT_INV_tmp~regout\ : std_logic;
SIGNAL \ALT_INV_Mux12~6_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~6_combout\ : std_logic;
SIGNAL \u4|ALT_INV_tmp~regout\ : std_logic;
SIGNAL \ALT_INV_Mux11~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~2_combout\ : std_logic;

BEGIN

ww_c_clk <= c_clk;
ww_c_rst <= c_rst;
outh <= ww_outh;
outl <= ww_outl;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Mux5~6_combout\ <= NOT \Mux5~6_combout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux0~5_combout\ <= NOT \Mux0~5_combout\;
\u0|ALT_INV_tmp~regout\ <= NOT \u0|tmp~regout\;
\u1|ALT_INV_tmp~regout\ <= NOT \u1|tmp~regout\;
\u2|ALT_INV_tmp~regout\ <= NOT \u2|tmp~regout\;
\u3|ALT_INV_tmp~regout\ <= NOT \u3|tmp~regout\;
\ALT_INV_Mux12~6_combout\ <= NOT \Mux12~6_combout\;
\ALT_INV_Mux7~6_combout\ <= NOT \Mux7~6_combout\;
\u4|ALT_INV_tmp~regout\ <= NOT \u4|tmp~regout\;
\ALT_INV_Mux11~2_combout\ <= NOT \Mux11~2_combout\;
\ALT_INV_Mux9~2_combout\ <= NOT \Mux9~2_combout\;

\c_clk~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_c_clk,
	combout => \c_clk~combout\);

\c_rst~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_c_rst,
	combout => \c_rst~combout\);

\t_rst~0\ : maxii_lcell
-- Equation(s):
-- \t_rst~0_combout\ = \LessThan0~0_combout\ # !\c_rst~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfcf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \LessThan0~0_combout\,
	datac => \c_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \t_rst~0_combout\);

\u4|tmp\ : maxii_lcell
-- Equation(s):
-- \u4|tmp~regout\ = DFFEAS(!\u4|tmp~regout\, !\u3|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u3|ALT_INV_tmp~regout\,
	datad => \u4|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u4|tmp~regout\);

\Mod0|auto_generated|divider|divider|StageOut[20]~76\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\ = !\LessThan0~0_combout\ & (\u4|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5500",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datad => \u4|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\);

\u2|tmp\ : maxii_lcell
-- Equation(s):
-- \u2|tmp~regout\ = DFFEAS(!\u2|tmp~regout\, !\u1|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u1|ALT_INV_tmp~regout\,
	datad => \u2|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u2|tmp~regout\);

\u3|tmp\ : maxii_lcell
-- Equation(s):
-- \u3|tmp~regout\ = DFFEAS(!\u3|tmp~regout\, !\u2|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u2|ALT_INV_tmp~regout\,
	datad => \u3|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u3|tmp~regout\);

\u5|tmp\ : maxii_lcell
-- Equation(s):
-- \u5|tmp~regout\ = DFFEAS(!\u5|tmp~regout\, !\u4|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u4|ALT_INV_tmp~regout\,
	datad => \u5|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u5|tmp~regout\);

\LessThan0~0\ : maxii_lcell
-- Equation(s):
-- \LessThan0~0_combout\ = \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\ & \u2|tmp~regout\ & \u3|tmp~regout\ & \u5|tmp~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\,
	datab => \u2|tmp~regout\,
	datac => \u3|tmp~regout\,
	datad => \u5|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \LessThan0~0_combout\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) = !\LessThan0~0_combout\ & \u3|tmp~regout\
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\ = CARRY(!\LessThan0~0_combout\ & \u3|tmp~regout\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_29\ = CARRY(!\LessThan0~0_combout\ & \u3|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4444",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u3|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	cout0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_29\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ = CARRY(\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_23\ = CARRY(\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffaa",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_23\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ $ (\LessThan0~0_combout\ # !\u4|tmp~regout\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ & (\LessThan0~0_combout\ # !\u4|tmp~regout\))
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_23\ & (\LessThan0~0_combout\ # !\u4|tmp~regout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "4b0b",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u4|tmp~regout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ $ (\LessThan0~0_combout\ # !\u5|tmp~regout\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\ = CARRY(!\LessThan0~0_combout\ & \u5|tmp~regout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_27\ = CARRY(!\LessThan0~0_combout\ & \u5|tmp~regout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "4b04",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u5|tmp~regout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_27\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\);

\Div0|auto_generated|divider|divider|StageOut[18]~60\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ = !\LessThan0~0_combout\ & \u5|tmp~regout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \LessThan0~0_combout\,
	datac => \u5|tmp~regout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\);

\Div0|auto_generated|divider|divider|StageOut[18]~26\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\);

\Div0|auto_generated|divider|divider|StageOut[17]~62\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ = !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \u4|tmp~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \LessThan0~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \u4|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\);

\Div0|auto_generated|divider|divider|StageOut[17]~27\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\);

\Div0|auto_generated|divider|divider|StageOut[16]~23\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ = \u3|tmp~regout\ & !\LessThan0~0_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0022",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u3|tmp~regout\,
	datab => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\);

\Div0|auto_generated|divider|divider|StageOut[16]~28\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ = !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5050",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1) = \u2|tmp~regout\ & !\LessThan0~0_combout\
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\ = CARRY(\u2|tmp~regout\ & !\LessThan0~0_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\ = CARRY(\u2|tmp~regout\ & !\LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2222",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|tmp~regout\,
	datab => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1),
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\ = CARRY(\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\ = CARRY(\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcc",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\ $ (!\Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ & 
-- !\Div0|auto_generated|divider|divider|StageOut[16]~28_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ & !\Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ & !\Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e101",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ $ (!\Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ & 
-- !\Div0|auto_generated|divider|divider|StageOut[17]~27_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ & (\Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\))
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\ & (\Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e10e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ & !\Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ & !\Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "ff01",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\);

\Div0|auto_generated|divider|divider|StageOut[23]~61\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\) # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00e4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\);

\Div0|auto_generated|divider|divider|StageOut[23]~16\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\);

\num[3]~2\ : maxii_lcell
-- Equation(s):
-- \num[3]~2_combout\ = \u3|tmp~regout\ & !\LessThan0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \u3|tmp~regout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \num[3]~2_combout\);

\Div0|auto_generated|divider|divider|StageOut[22]~63\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\num[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "005c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datab => \num[3]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\);

\Div0|auto_generated|divider|divider|StageOut[22]~17\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\);

\Div0|auto_generated|divider|divider|StageOut[21]~13\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ = \u2|tmp~regout\ & (!\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u2|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\);

\Div0|auto_generated|divider|divider|StageOut[21]~18\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1) & (\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5500",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\);

\u1|tmp\ : maxii_lcell
-- Equation(s):
-- \u1|tmp~regout\ = DFFEAS(!\u1|tmp~regout\, !\u0|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u0|ALT_INV_tmp~regout\,
	datad => \u1|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u1|tmp~regout\);

\Div0|auto_generated|divider|divider|StageOut[20]~14\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~14_combout\ = \u1|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \u1|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~14_combout\);

\Div0|auto_generated|divider|divider|StageOut[20]~19\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\ = \u1|tmp~regout\ & !\LessThan0~0_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \u1|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\);

\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ = CARRY(\Div0|auto_generated|divider|divider|StageOut[20]~14_combout\ # \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_26\ = CARRY(\Div0|auto_generated|divider|divider|StageOut[20]~14_combout\ # \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffee",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[20]~14_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[20]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_26\);

\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ & !\Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\)
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ & !\Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_26\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "ff01",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_26\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\);

\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\ & (\Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\))
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_30\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\ & (\Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "ff0e",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_30\);

\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ & !\Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\)
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13COUT1_32\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ & !\Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_30\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "ff01",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_30\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13COUT1_32\);

\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\);

\Mux6~6\ : maxii_lcell
-- Equation(s):
-- \Mux6~6_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ # !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\) # 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5faa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux6~6_combout\);

\Mux5~6\ : maxii_lcell
-- Equation(s):
-- \Mux5~6_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\) # 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f550",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux5~6_combout\);

\Mux4~0\ : maxii_lcell
-- Equation(s):
-- \Mux4~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0fa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~0_combout\);

\Mux3~0\ : maxii_lcell
-- Equation(s):
-- \Mux3~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\) # 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ $ !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5aaf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~0_combout\);

\Mux2~0\ : maxii_lcell
-- Equation(s):
-- \Mux2~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~0_combout\);

\Mux1~0\ : maxii_lcell
-- Equation(s):
-- \Mux1~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ $ !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "af5f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~0_combout\);

\Mux0~5\ : maxii_lcell
-- Equation(s):
-- \Mux0~5_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\) # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "05f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~5_combout\);

\u0|tmp\ : maxii_lcell
-- Equation(s):
-- \u0|tmp~regout\ = DFFEAS(!\u0|tmp~regout\, \c_clk~combout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datad => \u0|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u0|tmp~regout\);

\num[0]~1\ : maxii_lcell
-- Equation(s):
-- \num[0]~1_combout\ = \u0|tmp~regout\ & (!\LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u0|tmp~regout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \num[0]~1_combout\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) = !\LessThan0~0_combout\ & \u3|tmp~regout\
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\ = CARRY(!\LessThan0~0_combout\ & \u3|tmp~regout\)
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_23\ = CARRY(!\LessThan0~0_combout\ & \u3|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4444",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u3|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_23\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_25\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffaa",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_25\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ $ (\LessThan0~0_combout\ # !\u4|tmp~regout\)
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\ & (\LessThan0~0_combout\ # !\u4|tmp~regout\))
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_27\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_25\ & (\LessThan0~0_combout\ # !\u4|tmp~regout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "4b0b",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u4|tmp~regout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15_cout0\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~15COUT1_25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_27\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\ $ (\LessThan0~0_combout\ # !\u5|tmp~regout\)
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\ = CARRY(!\LessThan0~0_combout\ & \u5|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\)
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_29\ = CARRY(!\LessThan0~0_combout\ & \u5|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_27\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "4b04",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u5|tmp~regout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_27\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_29\);

\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_29\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\);

\Mod0|auto_generated|divider|divider|StageOut[21]~32\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\);

\Mod0|auto_generated|divider|divider|StageOut[21]~77\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\ = \u5|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & !\LessThan0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \u5|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\);

\Mod0|auto_generated|divider|divider|StageOut[20]~80\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\ = \u4|tmp~regout\ & !\LessThan0~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \u4|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\);

\Mod0|auto_generated|divider|divider|StageOut[20]~33\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\);

\Mod0|auto_generated|divider|divider|StageOut[19]~34\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\);

\Mod0|auto_generated|divider|divider|StageOut[19]~28\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ = !\LessThan0~0_combout\ & \u3|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \LessThan0~0_combout\,
	datac => \u3|tmp~regout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1) = !\LessThan0~0_combout\ & \u2|tmp~regout\
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\ = CARRY(!\LessThan0~0_combout\ & \u2|tmp~regout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\ = CARRY(!\LessThan0~0_combout\ & \u2|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4444",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u2|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1),
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_30\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffcc",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_30\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\ $ (!\Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_30\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e101",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[19]~34_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17_cout0\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_30\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ $ (!\Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ & (\Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\))
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\ & (\Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e10e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~80_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ $ (!\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_36\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e101",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_36\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_36\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\);

\Mod0|auto_generated|divider|divider|StageOut[26]~74\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) # !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\num[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0702",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datad => \num[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\);

\Mod0|auto_generated|divider|divider|StageOut[26]~21\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\);

\Mod0|auto_generated|divider|divider|StageOut[27]~20\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\);

\Mod0|auto_generated|divider|divider|StageOut[27]~79\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~79_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\) # !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00e4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~76_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~79_combout\);

\Mod0|auto_generated|divider|divider|StageOut[25]~22\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1) & \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\);

\Mod0|auto_generated|divider|divider|StageOut[25]~16\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ = \u2|tmp~regout\ & !\LessThan0~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \u2|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1) = !\LessThan0~0_combout\ & \u1|tmp~regout\
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\ = CARRY(!\LessThan0~0_combout\ & \u1|tmp~regout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUTCOUT1_32\ = CARRY(!\LessThan0~0_combout\ & \u1|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4444",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u1|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1),
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUTCOUT1_32\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUTCOUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\ = CARRY(\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffaa",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~20\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\ $ (!\Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e101",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ $ (!\Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\))
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "e10e",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[27]~79_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "ff01",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[27]~79_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~22\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\);

\Mod0|auto_generated|divider|divider|StageOut[28]~78\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\ # 
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[21]~77_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\);

\Mod0|auto_generated|divider|divider|StageOut[28]~19\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ = CARRY(\Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\ # \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\ = CARRY(\Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\ # \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\)

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "ffef",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~78_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ & \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\) # 
-- (\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ & \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f0f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\);

\Mod0|auto_generated|divider|divider|StageOut[33]~75\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\) # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\ # \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fe0e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~74_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\);

\Mod0|auto_generated|divider|divider|StageOut[32]~73\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\) # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ # \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fe0e",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\);

\Mod0|auto_generated|divider|divider|StageOut[31]~72\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1) # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\u1|tmp~regout\ & !\LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "505c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1),
	datab => \u1|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\);

\Mux13~6\ : maxii_lcell
-- Equation(s):
-- \Mux13~6_combout\ = \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\ # \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ # !\num[0]~1_combout\) # 
-- !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dffc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \num[0]~1_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux13~6_combout\);

\Mux12~6\ : maxii_lcell
-- Equation(s):
-- \Mux12~6_combout\ = !\Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\ & (\num[0]~1_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ # !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\) # 
-- !\num[0]~1_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2302",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \num[0]~1_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux12~6_combout\);

\Mux11~2\ : maxii_lcell
-- Equation(s):
-- \Mux11~2_combout\ = \LessThan0~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\) # !\LessThan0~0_combout\ & (\u0|tmp~regout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "44f4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux11~2_combout\);

\Mux10~2\ : maxii_lcell
-- Equation(s):
-- \Mux10~2_combout\ = \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ $ (!\LessThan0~0_combout\ & \u0|tmp~regout\)) # 
-- !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & (\LessThan0~0_combout\ # \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ # !\u0|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bf4b",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~2_combout\);

\Mux9~2\ : maxii_lcell
-- Equation(s):
-- \Mux9~2_combout\ = !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ & (\LessThan0~0_combout\ # !\u0|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0b00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux9~2_combout\);

\Mux8~2\ : maxii_lcell
-- Equation(s):
-- \Mux8~2_combout\ = \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ $ (\LessThan0~0_combout\ # !\u0|tmp~regout\) # !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4fbf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux8~2_combout\);

\Mux7~6\ : maxii_lcell
-- Equation(s):
-- \Mux7~6_combout\ = !\Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\ & (\num[0]~1_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\ # !\num[0]~1_combout\ 
-- & \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1012",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \num[0]~1_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[33]~75_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~73_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux7~6_combout\);

\outh[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux6~6_combout\,
	oe => VCC,
	padio => ww_outh(0));

\outh[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux5~6_combout\,
	oe => VCC,
	padio => ww_outh(1));

\outh[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux4~0_combout\,
	oe => VCC,
	padio => ww_outh(2));

\outh[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux3~0_combout\,
	oe => VCC,
	padio => ww_outh(3));

\outh[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux2~0_combout\,
	oe => VCC,
	padio => ww_outh(4));

\outh[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux1~0_combout\,
	oe => VCC,
	padio => ww_outh(5));

\outh[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux0~5_combout\,
	oe => VCC,
	padio => ww_outh(6));

\outl[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux13~6_combout\,
	oe => VCC,
	padio => ww_outl(0));

\outl[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux12~6_combout\,
	oe => VCC,
	padio => ww_outl(1));

\outl[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux11~2_combout\,
	oe => VCC,
	padio => ww_outl(2));

\outl[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux10~2_combout\,
	oe => VCC,
	padio => ww_outl(3));

\outl[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux9~2_combout\,
	oe => VCC,
	padio => ww_outl(4));

\outl[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux8~2_combout\,
	oe => VCC,
	padio => ww_outl(5));

\outl[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Mux7~6_combout\,
	oe => VCC,
	padio => ww_outl(6));
END structure;


