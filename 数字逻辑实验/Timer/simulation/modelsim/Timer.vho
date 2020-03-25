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

-- DATE "05/08/2019 07:36:41"

-- 
-- Device: Altera EPM240T100C5 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, maxii;
USE IEEE.std_logic_1164.all;
USE maxii.maxii_components.all;

ENTITY 	Timer IS
    PORT (
	c_clk : IN std_logic;
	c_rst : IN std_logic;
	outh : OUT std_logic_vector(6 DOWNTO 0);
	outl : OUT std_logic_vector(6 DOWNTO 0);
	pause : IN std_logic
	);
END Timer;

ARCHITECTURE structure OF Timer IS
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
SIGNAL ww_pause : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12\ : std_logic;
SIGNAL \t_clk~regout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~20\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1\ : std_logic;
SIGNAL \Equal0~2\ : std_logic;
SIGNAL \Equal0~3\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~22\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~5COUT1_90\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~7COUT1_88\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~9COUT1_84\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~11COUT1_86\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~15COUT1_82\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~17COUT1_76\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~19COUT1_80\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~21COUT1_78\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~25COUT1_72\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~27COUT1_74\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~29COUT1_70\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~31COUT1_68\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~35COUT1_66\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~37COUT1_64\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~39COUT1_62\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~41COUT1_60\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~18\ : std_logic;
SIGNAL \c_clk~combout\ : std_logic;
SIGNAL \pause~combout\ : std_logic;
SIGNAL \u2|tmp~regout\ : std_logic;
SIGNAL \u4|tmp~regout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\ : std_logic;
SIGNAL \u3|tmp~regout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \c_rst~combout\ : std_logic;
SIGNAL \t_rst~0_combout\ : std_logic;
SIGNAL \u5|tmp~regout\ : std_logic;
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
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[1]~COUTCOUT1_28\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~20_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_30\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ : std_logic;
SIGNAL \num[3]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~17_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ : std_logic;
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
SIGNAL \Mux10~2_combout\ : std_logic;
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
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\ : std_logic;
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
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~22_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUT\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[1]~COUTCOUT1_32\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~21COUT1_34\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~77_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~72_combout\ : std_logic;
SIGNAL \l[2]~1_combout\ : std_logic;
SIGNAL \l[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\ : std_logic;
SIGNAL \l[3]~2_combout\ : std_logic;
SIGNAL \l[3]~3_combout\ : std_logic;
SIGNAL \Mux13~6_combout\ : std_logic;
SIGNAL \Mux12~6_combout\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux10~3_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Mux7~6_combout\ : std_logic;
SIGNAL t : std_logic_vector(20 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \ALT_INV_t_clk~regout\ : std_logic;
SIGNAL \ALT_INV_Mux11~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ALT_INV_pause~combout\ : std_logic;

BEGIN

ww_c_clk <= c_clk;
ww_c_rst <= c_rst;
outh <= ww_outh;
outl <= ww_outl;
ww_pause <= pause;
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
\ALT_INV_t_clk~regout\ <= NOT \t_clk~regout\;
\ALT_INV_Mux11~2_combout\ <= NOT \Mux11~2_combout\;
\ALT_INV_Mux9~2_combout\ <= NOT \Mux9~2_combout\;
\ALT_INV_pause~combout\ <= NOT \pause~combout\;

t_clk : maxii_lcell
-- Equation(s):
-- \t_clk~regout\ = DFFEAS(!t(0) & \Equal0~5\ & \Equal0~4_combout\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datab => t(0),
	datac => \Equal0~5\,
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \t_clk~regout\);

\t[20]\ : maxii_lcell
-- Equation(s):
-- t(20) = DFFEAS(\Add0~0_combout\ & (t(0) # !\Equal0~5\ # !\Equal0~4_combout\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f700",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Equal0~4_combout\,
	datab => \Equal0~5\,
	datac => t(0),
	datad => \Add0~0_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(20));

\t[19]\ : maxii_lcell
-- Equation(s):
-- t(19) = DFFEAS(\Add0~2_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b0f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => t(0),
	datab => \Equal0~5\,
	datac => \Add0~2_combout\,
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(19));

\t[18]\ : maxii_lcell
-- Equation(s):
-- t(18) = DFFEAS(\Add0~4_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2aa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Add0~4_combout\,
	datab => \Equal0~5\,
	datac => t(0),
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(18));

\t[17]\ : maxii_lcell
-- Equation(s):
-- t(17) = DFFEAS(\Add0~6_combout\ & (t(0) # !\Equal0~5\ # !\Equal0~4_combout\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f700",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Equal0~4_combout\,
	datab => \Equal0~5\,
	datac => t(0),
	datad => \Add0~6_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(17));

\Equal0~0\ : maxii_lcell
-- Equation(s):
-- \Equal0~0_combout\ = t(18) & t(17) & t(20) & t(19)

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
	dataa => t(18),
	datab => t(17),
	datac => t(20),
	datad => t(19),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~0_combout\);

\t[15]\ : maxii_lcell
-- Equation(s):
-- t(15) = DFFEAS(\Add0~8_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Equal0~5\,
	datab => t(0),
	datac => \Add0~8_combout\,
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(15));

\t[14]\ : maxii_lcell
-- Equation(s):
-- t(14) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~12_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~12_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(14));

\t[13]\ : maxii_lcell
-- Equation(s):
-- t(13) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~14_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~14_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(13));

\t[16]\ : maxii_lcell
-- Equation(s):
-- \Equal0~1\ = t(15) & !t(14) & !t[16] & !t(13)
-- t(16) = DFFEAS(\Equal0~1\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~10_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => t(15),
	datab => t(14),
	datac => \Add0~10_combout\,
	datad => t(13),
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~1\,
	regout => t(16));

\t[10]\ : maxii_lcell
-- Equation(s):
-- t(10) = DFFEAS(\Add0~16_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Equal0~5\,
	datab => t(0),
	datac => \Add0~16_combout\,
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(10));

\t[11]\ : maxii_lcell
-- Equation(s):
-- t(11) = DFFEAS(\Add0~20_combout\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datad => \Add0~20_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(11));

\t[9]\ : maxii_lcell
-- Equation(s):
-- t(9) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~22_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~22_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(9));

\t[12]\ : maxii_lcell
-- Equation(s):
-- \Equal0~2\ = !t(11) & !t(9) & !t[12] & t(10)
-- t(12) = DFFEAS(\Equal0~2\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~18_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => t(11),
	datab => t(9),
	datac => \Add0~18_combout\,
	datad => t(10),
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~2\,
	regout => t(12));

\t[7]\ : maxii_lcell
-- Equation(s):
-- t(7) = DFFEAS(\Add0~24_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Equal0~5\,
	datab => t(0),
	datac => \Add0~24_combout\,
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(7));

\t[6]\ : maxii_lcell
-- Equation(s):
-- t(6) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~28_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~28_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(6));

\t[5]\ : maxii_lcell
-- Equation(s):
-- t(5) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~30_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~30_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(5));

\t[8]\ : maxii_lcell
-- Equation(s):
-- \Equal0~3\ = t(7) & !t(5) & !t[8] & !t(6)
-- t(8) = DFFEAS(\Equal0~3\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~26_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => t(7),
	datab => t(5),
	datac => \Add0~26_combout\,
	datad => t(6),
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~3\,
	regout => t(8));

\Equal0~4\ : maxii_lcell
-- Equation(s):
-- \Equal0~4_combout\ = \Equal0~2\ & \Equal0~0_combout\ & \Equal0~3\ & \Equal0~1\

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
	dataa => \Equal0~2\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~3\,
	datad => \Equal0~1\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~4_combout\);

\t[3]\ : maxii_lcell
-- Equation(s):
-- t(3) = DFFEAS(\Add0~34_combout\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datad => \Add0~34_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(3));

\t[2]\ : maxii_lcell
-- Equation(s):
-- t(2) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~36_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~36_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(2));

\t[1]\ : maxii_lcell
-- Equation(s):
-- t(1) = DFFEAS(GND, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~38_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	datac => \Add0~38_combout\,
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(1));

\t[4]\ : maxii_lcell
-- Equation(s):
-- \Equal0~5\ = !t(1) & !t(3) & !t[4] & !t(2)
-- t(4) = DFFEAS(\Equal0~5\, GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, \Add0~32_combout\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => t(1),
	datab => t(3),
	datac => \Add0~32_combout\,
	datad => t(2),
	aclr => \LessThan0~0_combout\,
	sload => VCC,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Equal0~5\,
	regout => t(4));

\t[0]\ : maxii_lcell
-- Equation(s):
-- t(0) = DFFEAS(\Add0~40_combout\ & (t(0) # !\Equal0~4_combout\ # !\Equal0~5\), GLOBAL(\c_clk~combout\), !GLOBAL(\LessThan0~0_combout\), , !\pause~combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a2aa",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \c_clk~combout\,
	dataa => \Add0~40_combout\,
	datab => \Equal0~5\,
	datac => t(0),
	datad => \Equal0~4_combout\,
	aclr => \LessThan0~0_combout\,
	ena => \ALT_INV_pause~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => t(0));

\c_clk~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_c_clk,
	combout => \c_clk~combout\);

\pause~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_pause,
	combout => \pause~combout\);

\Add0~0\ : maxii_lcell
-- Equation(s):
-- \Add0~0_combout\ = t(20) $ (!\Add0~3\)

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(20),
	cin => \Add0~3\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~0_combout\);

\Add0~2\ : maxii_lcell
-- Equation(s):
-- \Add0~2_combout\ = t(19) $ (!\Add0~13\ & \Add0~5\) # (\Add0~13\ & \Add0~5COUT1_90\)
-- \Add0~3\ = CARRY(!\Add0~5COUT1_90\ # !t(19))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(19),
	cin => \Add0~13\,
	cin0 => \Add0~5\,
	cin1 => \Add0~5COUT1_90\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\Add0~4\ : maxii_lcell
-- Equation(s):
-- \Add0~4_combout\ = t(18) $ !(!\Add0~13\ & \Add0~7\) # (\Add0~13\ & \Add0~7COUT1_88\)
-- \Add0~5\ = CARRY(t(18) & !\Add0~7\)
-- \Add0~5COUT1_90\ = CARRY(t(18) & !\Add0~7COUT1_88\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(18),
	cin => \Add0~13\,
	cin0 => \Add0~7\,
	cin1 => \Add0~7COUT1_88\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~4_combout\,
	cout0 => \Add0~5\,
	cout1 => \Add0~5COUT1_90\);

\Add0~6\ : maxii_lcell
-- Equation(s):
-- \Add0~6_combout\ = t(17) $ ((!\Add0~13\ & \Add0~11\) # (\Add0~13\ & \Add0~11COUT1_86\))
-- \Add0~7\ = CARRY(!\Add0~11\ # !t(17))
-- \Add0~7COUT1_88\ = CARRY(!\Add0~11COUT1_86\ # !t(17))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(17),
	cin => \Add0~13\,
	cin0 => \Add0~11\,
	cin1 => \Add0~11COUT1_86\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~6_combout\,
	cout0 => \Add0~7\,
	cout1 => \Add0~7COUT1_88\);

\Add0~8\ : maxii_lcell
-- Equation(s):
-- \Add0~8_combout\ = t(15) $ \Add0~13\
-- \Add0~9\ = CARRY(!\Add0~13\ # !t(15))
-- \Add0~9COUT1_84\ = CARRY(!\Add0~13\ # !t(15))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(15),
	cin => \Add0~13\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~8_combout\,
	cout0 => \Add0~9\,
	cout1 => \Add0~9COUT1_84\);

\Add0~10\ : maxii_lcell
-- Equation(s):
-- \Add0~10_combout\ = t(16) $ !(!\Add0~13\ & \Add0~9\) # (\Add0~13\ & \Add0~9COUT1_84\)
-- \Add0~11\ = CARRY(t(16) & !\Add0~9\)
-- \Add0~11COUT1_86\ = CARRY(t(16) & !\Add0~9COUT1_84\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(16),
	cin => \Add0~13\,
	cin0 => \Add0~9\,
	cin1 => \Add0~9COUT1_84\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~10_combout\,
	cout0 => \Add0~11\,
	cout1 => \Add0~11COUT1_86\);

\Add0~12\ : maxii_lcell
-- Equation(s):
-- \Add0~12_combout\ = t(14) $ !(!\Add0~23\ & \Add0~15\) # (\Add0~23\ & \Add0~15COUT1_82\)
-- \Add0~13\ = CARRY(t(14) & !\Add0~15COUT1_82\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(14),
	cin => \Add0~23\,
	cin0 => \Add0~15\,
	cin1 => \Add0~15COUT1_82\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

\Add0~14\ : maxii_lcell
-- Equation(s):
-- \Add0~14_combout\ = t(13) $ ((!\Add0~23\ & \Add0~19\) # (\Add0~23\ & \Add0~19COUT1_80\))
-- \Add0~15\ = CARRY(!\Add0~19\ # !t(13))
-- \Add0~15COUT1_82\ = CARRY(!\Add0~19COUT1_80\ # !t(13))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(13),
	cin => \Add0~23\,
	cin0 => \Add0~19\,
	cin1 => \Add0~19COUT1_80\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~14_combout\,
	cout0 => \Add0~15\,
	cout1 => \Add0~15COUT1_82\);

\Add0~16\ : maxii_lcell
-- Equation(s):
-- \Add0~16_combout\ = t(10) $ !\Add0~23\
-- \Add0~17\ = CARRY(t(10) & !\Add0~23\)
-- \Add0~17COUT1_76\ = CARRY(t(10) & !\Add0~23\)

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(10),
	cin => \Add0~23\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~16_combout\,
	cout0 => \Add0~17\,
	cout1 => \Add0~17COUT1_76\);

\Add0~18\ : maxii_lcell
-- Equation(s):
-- \Add0~18_combout\ = t(12) $ (!(!\Add0~23\ & \Add0~21\) # (\Add0~23\ & \Add0~21COUT1_78\))
-- \Add0~19\ = CARRY(t(12) & (!\Add0~21\))
-- \Add0~19COUT1_80\ = CARRY(t(12) & (!\Add0~21COUT1_78\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(12),
	cin => \Add0~23\,
	cin0 => \Add0~21\,
	cin1 => \Add0~21COUT1_78\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~18_combout\,
	cout0 => \Add0~19\,
	cout1 => \Add0~19COUT1_80\);

\Add0~20\ : maxii_lcell
-- Equation(s):
-- \Add0~20_combout\ = t(11) $ (!\Add0~23\ & \Add0~17\) # (\Add0~23\ & \Add0~17COUT1_76\)
-- \Add0~21\ = CARRY(!\Add0~17\ # !t(11))
-- \Add0~21COUT1_78\ = CARRY(!\Add0~17COUT1_76\ # !t(11))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(11),
	cin => \Add0~23\,
	cin0 => \Add0~17\,
	cin1 => \Add0~17COUT1_76\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~20_combout\,
	cout0 => \Add0~21\,
	cout1 => \Add0~21COUT1_78\);

\Add0~22\ : maxii_lcell
-- Equation(s):
-- \Add0~22_combout\ = t(9) $ ((!\Add0~33\ & \Add0~27\) # (\Add0~33\ & \Add0~27COUT1_74\))
-- \Add0~23\ = CARRY(!\Add0~27COUT1_74\ # !t(9))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(9),
	cin => \Add0~33\,
	cin0 => \Add0~27\,
	cin1 => \Add0~27COUT1_74\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

\Add0~24\ : maxii_lcell
-- Equation(s):
-- \Add0~24_combout\ = t(7) $ ((!\Add0~33\ & \Add0~29\) # (\Add0~33\ & \Add0~29COUT1_70\))
-- \Add0~25\ = CARRY(!\Add0~29\ # !t(7))
-- \Add0~25COUT1_72\ = CARRY(!\Add0~29COUT1_70\ # !t(7))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(7),
	cin => \Add0~33\,
	cin0 => \Add0~29\,
	cin1 => \Add0~29COUT1_70\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~24_combout\,
	cout0 => \Add0~25\,
	cout1 => \Add0~25COUT1_72\);

\Add0~26\ : maxii_lcell
-- Equation(s):
-- \Add0~26_combout\ = t(8) $ (!(!\Add0~33\ & \Add0~25\) # (\Add0~33\ & \Add0~25COUT1_72\))
-- \Add0~27\ = CARRY(t(8) & (!\Add0~25\))
-- \Add0~27COUT1_74\ = CARRY(t(8) & (!\Add0~25COUT1_72\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(8),
	cin => \Add0~33\,
	cin0 => \Add0~25\,
	cin1 => \Add0~25COUT1_72\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~26_combout\,
	cout0 => \Add0~27\,
	cout1 => \Add0~27COUT1_74\);

\Add0~28\ : maxii_lcell
-- Equation(s):
-- \Add0~28_combout\ = t(6) $ (!(!\Add0~33\ & \Add0~31\) # (\Add0~33\ & \Add0~31COUT1_68\))
-- \Add0~29\ = CARRY(t(6) & (!\Add0~31\))
-- \Add0~29COUT1_70\ = CARRY(t(6) & (!\Add0~31COUT1_68\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(6),
	cin => \Add0~33\,
	cin0 => \Add0~31\,
	cin1 => \Add0~31COUT1_68\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~28_combout\,
	cout0 => \Add0~29\,
	cout1 => \Add0~29COUT1_70\);

\Add0~30\ : maxii_lcell
-- Equation(s):
-- \Add0~30_combout\ = t(5) $ \Add0~33\
-- \Add0~31\ = CARRY(!\Add0~33\ # !t(5))
-- \Add0~31COUT1_68\ = CARRY(!\Add0~33\ # !t(5))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(5),
	cin => \Add0~33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~30_combout\,
	cout0 => \Add0~31\,
	cout1 => \Add0~31COUT1_68\);

\Add0~32\ : maxii_lcell
-- Equation(s):
-- \Add0~32_combout\ = t(4) $ (!\Add0~35\)
-- \Add0~33\ = CARRY(t(4) & (!\Add0~35COUT1_66\))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(4),
	cin0 => \Add0~35\,
	cin1 => \Add0~35COUT1_66\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

\Add0~34\ : maxii_lcell
-- Equation(s):
-- \Add0~34_combout\ = t(3) $ \Add0~37\
-- \Add0~35\ = CARRY(!\Add0~37\ # !t(3))
-- \Add0~35COUT1_66\ = CARRY(!\Add0~37COUT1_64\ # !t(3))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(3),
	cin0 => \Add0~37\,
	cin1 => \Add0~37COUT1_64\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~34_combout\,
	cout0 => \Add0~35\,
	cout1 => \Add0~35COUT1_66\);

\Add0~36\ : maxii_lcell
-- Equation(s):
-- \Add0~36_combout\ = t(2) $ !\Add0~39\
-- \Add0~37\ = CARRY(t(2) & !\Add0~39\)
-- \Add0~37COUT1_64\ = CARRY(t(2) & !\Add0~39COUT1_62\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(2),
	cin0 => \Add0~39\,
	cin1 => \Add0~39COUT1_62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~36_combout\,
	cout0 => \Add0~37\,
	cout1 => \Add0~37COUT1_64\);

\Add0~38\ : maxii_lcell
-- Equation(s):
-- \Add0~38_combout\ = t(1) $ (\Add0~41\)
-- \Add0~39\ = CARRY(!\Add0~41\ # !t(1))
-- \Add0~39COUT1_62\ = CARRY(!\Add0~41COUT1_60\ # !t(1))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => t(1),
	cin0 => \Add0~41\,
	cin1 => \Add0~41COUT1_60\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~38_combout\,
	cout0 => \Add0~39\,
	cout1 => \Add0~39COUT1_62\);

\Add0~40\ : maxii_lcell
-- Equation(s):
-- \Add0~40_combout\ = !t(0)
-- \Add0~41\ = CARRY(t(0))
-- \Add0~41COUT1_60\ = CARRY(t(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => t(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Add0~40_combout\,
	cout0 => \Add0~41\,
	cout1 => \Add0~41COUT1_60\);

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

\Mod0|auto_generated|divider|divider|StageOut[20]~74\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\ = \u4|tmp~regout\ & !\LessThan0~0_combout\

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
	datac => \u4|tmp~regout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\);

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

\LessThan0~0\ : maxii_lcell
-- Equation(s):
-- \LessThan0~0_combout\ = \u5|tmp~regout\ & \u2|tmp~regout\ & \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\ & \u3|tmp~regout\

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
	dataa => \u5|tmp~regout\,
	datab => \u2|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\,
	datad => \u3|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \LessThan0~0_combout\);

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
	lut_mask => "afaf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datac => \c_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \t_rst~0_combout\);

\u5|tmp\ : maxii_lcell
-- Equation(s):
-- \u5|tmp~regout\ = DFFEAS(!\u5|tmp~regout\, !\u4|tmp~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \u4|ALT_INV_tmp~regout\,
	datac => \u5|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u5|tmp~regout\);

\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) = \u3|tmp~regout\ & !\LessThan0~0_combout\
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUT\ = CARRY(\u3|tmp~regout\ & !\LessThan0~0_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[1]~COUTCOUT1_29\ = CARRY(\u3|tmp~regout\ & !\LessThan0~0_combout\)

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
	dataa => \u3|tmp~regout\,
	datab => \LessThan0~0_combout\,
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
	lut_mask => "ffcc",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\,
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
	lut_mask => "2d0d",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u4|tmp~regout\,
	datab => \LessThan0~0_combout\,
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
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11\ = CARRY(\u5|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13\)
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~11COUT1_27\ = CARRY(\u5|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~13COUT1_25\)

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "2d02",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u5|tmp~regout\,
	datab => \LessThan0~0_combout\,
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

\Div0|auto_generated|divider|divider|StageOut[17]~27\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\);

\Div0|auto_generated|divider|divider|StageOut[17]~62\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\ = \u4|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

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
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\);

\Div0|auto_generated|divider|divider|StageOut[16]~23\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\ = \u3|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

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
	datab => \u3|tmp~regout\,
	datac => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~23_combout\);

\Div0|auto_generated|divider|divider|StageOut[16]~28\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~28_combout\ = !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1) & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
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
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ $ (!\Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ & 
-- !\Div0|auto_generated|divider|divider|StageOut[17]~62_combout\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\ & (\Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\))
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\ & (\Div0|auto_generated|divider|divider|StageOut[17]~27_combout\ # 
-- \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\))

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
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~27_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[17]~62_combout\,
	cin0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17\,
	cin1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~17COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	cout0 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\,
	cout1 => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_34\);

\Div0|auto_generated|divider|divider|StageOut[18]~26\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ = \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\);

\Div0|auto_generated|divider|divider|StageOut[18]~60\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ = \u5|tmp~regout\ & !\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

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
	datac => \LessThan0~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\);

\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ & !\Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\)
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_36\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ & !\Div0|auto_generated|divider|divider|StageOut[18]~60_combout\ & 
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
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[18]~60_combout\,
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

\Div0|auto_generated|divider|divider|StageOut[23]~16\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

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
	datac => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\);

\Div0|auto_generated|divider|divider|StageOut[23]~61\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\ # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ac",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\);

\num[3]~0\ : maxii_lcell
-- Equation(s):
-- \num[3]~0_combout\ = \u3|tmp~regout\ & !\LessThan0~0_combout\

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
	combout => \num[3]~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[22]~63\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~63_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- (!\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1)) # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \num[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "003a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \num[3]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
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

\Div0|auto_generated|divider|divider|StageOut[21]~13\ : maxii_lcell
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ = !\LessThan0~0_combout\ & \u2|tmp~regout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

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
	datac => \u2|tmp~regout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\);

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
-- \Div0|auto_generated|divider|divider|StageOut[20]~14_combout\ = \u1|tmp~regout\ & (!\LessThan0~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

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
	dataa => \u1|tmp~regout\,
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
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ & !\Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\)
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_28\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[21]~18_combout\ & !\Div0|auto_generated|divider|divider|StageOut[21]~13_combout\ & 
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
	dataa => \Div0|auto_generated|divider|divider|StageOut[21]~18_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[21]~13_combout\,
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
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13_cout0\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ & !\Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15_cout0\)
-- \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~13COUT1_32\ = CARRY(!\Div0|auto_generated|divider|divider|StageOut[23]~16_combout\ & !\Div0|auto_generated|divider|divider|StageOut[23]~61_combout\ & 
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
	dataa => \Div0|auto_generated|divider|divider|StageOut[23]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[23]~61_combout\,
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
-- \Mux6~6_combout\ = !\LessThan0~0_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ # 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\) # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1322",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \LessThan0~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux6~6_combout\);

\Mux5~6\ : maxii_lcell
-- Equation(s):
-- \Mux5~6_combout\ = !\LessThan0~0_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ & 
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ # !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # 
-- \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3110",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \LessThan0~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux5~6_combout\);

\Mux4~0\ : maxii_lcell
-- Equation(s):
-- \Mux4~0_combout\ = !\LessThan0~0_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3032",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datab => \LessThan0~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux4~0_combout\);

\Mux3~0\ : maxii_lcell
-- Equation(s):
-- \Mux3~0_combout\ = \LessThan0~0_combout\ # \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\) # !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ $ 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "deef",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datab => \LessThan0~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux3~0_combout\);

\Mux2~0\ : maxii_lcell
-- Equation(s):
-- \Mux2~0_combout\ = !\LessThan0~0_combout\ & \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0004",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux2~0_combout\);

\Mux1~0\ : maxii_lcell
-- Equation(s):
-- \Mux1~0_combout\ = \LessThan0~0_combout\ # \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ $ !\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\ # 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "efbf",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux1~0_combout\);

\Mux0~5\ : maxii_lcell
-- Equation(s):
-- \Mux0~5_combout\ = !\LessThan0~0_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\) # 
-- !\Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0150",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~5_combout\);

\u0|tmp\ : maxii_lcell
-- Equation(s):
-- \u0|tmp~regout\ = DFFEAS(!\u0|tmp~regout\, !\t_clk~regout\, !GLOBAL(\t_rst~0_combout\), , , , , , )

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
	clk => \ALT_INV_t_clk~regout\,
	datad => \u0|tmp~regout\,
	aclr => \t_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \u0|tmp~regout\);

\Mux10~2\ : maxii_lcell
-- Equation(s):
-- \Mux10~2_combout\ = !\LessThan0~0_combout\ & \u0|tmp~regout\

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
	datac => \LessThan0~0_combout\,
	datad => \u0|tmp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~2_combout\);

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
	lut_mask => "ffcc",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~16_combout\,
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

\Mod0|auto_generated|divider|divider|StageOut[21]~75\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ = !\LessThan0~0_combout\ & \u5|tmp~regout\ & (!\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0044",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u5|tmp~regout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\);

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

\Mod0|auto_generated|divider|divider|StageOut[20]~33\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\

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
	datad => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\);

\Mod0|auto_generated|divider|divider|StageOut[20]~78\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\ = \u4|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & !\LessThan0~0_combout\

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
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \LessThan0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\);

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
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ $ (!\Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\ & (\Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\))
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\ & (\Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\))

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
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~33_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~78_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~13COUT1_32\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~18_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19COUT1_34\);

\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\ $ (!\Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~19\)
-- \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~15COUT1_36\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\ & 
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
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~32_combout\,
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
-- \Mod0|auto_generated|divider|divider|StageOut[25]~16_combout\ = !\LessThan0~0_combout\ & \u2|tmp~regout\ & !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\

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
	datac => \u2|tmp~regout\,
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
	lut_mask => "ffcc",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~24_combout\,
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

\Mod0|auto_generated|divider|divider|StageOut[27]~77\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~77_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\) # !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ca",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~74_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~77_combout\);

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

\Mod0|auto_generated|divider|divider|StageOut[26]~21\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\);

\Mod0|auto_generated|divider|divider|StageOut[26]~73\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1)) # !\Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\ & \num[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "003a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \num[3]~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella\(1),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ $ (!\Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\))
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\ = CARRY(!\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\ # 
-- \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\))

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
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~15COUT1_36\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\,
	cout0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\,
	cout1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\ = CARRY(!\Mod0|auto_generated|divider|divider|StageOut[27]~77_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\ & 
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
	dataa => \Mod0|auto_generated|divider|divider|StageOut[27]~77_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[27]~20_combout\,
	cin0 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17\,
	cin1 => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~17COUT1_38\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~22\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\);

\Mod0|auto_generated|divider|divider|StageOut[28]~76\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\ # 
-- \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ea",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~75_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3|add_sub_cella[2]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\);

\Mod0|auto_generated|divider|divider|StageOut[28]~19\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19_cout0\ = CARRY(\Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\ # \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~23_cout\)
-- \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~19COUT1_40\ = CARRY(\Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\ # \Mod0|auto_generated|divider|divider|StageOut[28]~19_combout\ # 
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
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~76_combout\,
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

\Mod0|auto_generated|divider|divider|StageOut[32]~72\ : maxii_lcell
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~72_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1)) # 
-- !\Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\ & !\LessThan0~0_combout\ & \u2|tmp~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f44",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u2|tmp~regout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella\(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4|add_sub_cella[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~72_combout\);

\l[2]~1\ : maxii_lcell
-- Equation(s):
-- \l[2]~1_combout\ = !\LessThan0~0_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\ # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[32]~72_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4540",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~14_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[32]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \l[2]~1_combout\);

\l[1]~0\ : maxii_lcell
-- Equation(s):
-- \l[1]~0_combout\ = !\LessThan0~0_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1) # 
-- !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\u1|tmp~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1150",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella\(1),
	datac => \u1|tmp~regout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \l[1]~0_combout\);

\l[3]~2\ : maxii_lcell
-- Equation(s):
-- \l[3]~2_combout\ = !\LessThan0~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ # \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0054",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[26]~21_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \l[3]~2_combout\);

\l[3]~3\ : maxii_lcell
-- Equation(s):
-- \l[3]~3_combout\ = \l[3]~2_combout\ # \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\ & !\LessThan0~0_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff20",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~16_combout\,
	datab => \LessThan0~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5|add_sub_cella[2]~12_combout\,
	datad => \l[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \l[3]~3_combout\);

\Mux13~6\ : maxii_lcell
-- Equation(s):
-- \Mux13~6_combout\ = \l[3]~3_combout\ # \l[2]~1_combout\ & (!\l[1]~0_combout\ # !\Mux10~2_combout\) # !\l[2]~1_combout\ & (\l[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff7c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~2_combout\,
	datab => \l[2]~1_combout\,
	datac => \l[1]~0_combout\,
	datad => \l[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux13~6_combout\);

\Mux12~6\ : maxii_lcell
-- Equation(s):
-- \Mux12~6_combout\ = !\l[3]~3_combout\ & (\Mux10~2_combout\ & (\l[1]~0_combout\ # !\l[2]~1_combout\) # !\Mux10~2_combout\ & !\l[2]~1_combout\ & \l[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00b2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~2_combout\,
	datab => \l[2]~1_combout\,
	datac => \l[1]~0_combout\,
	datad => \l[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux12~6_combout\);

\Mux11~2\ : maxii_lcell
-- Equation(s):
-- \Mux11~2_combout\ = \LessThan0~0_combout\ & (!\l[1]~0_combout\ & \l[2]~1_combout\) # !\LessThan0~0_combout\ & (\u0|tmp~regout\ # !\l[1]~0_combout\ & \l[2]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4f44",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \l[1]~0_combout\,
	datad => \l[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux11~2_combout\);

\Mux10~3\ : maxii_lcell
-- Equation(s):
-- \Mux10~3_combout\ = \l[1]~0_combout\ & (\LessThan0~0_combout\ # !\l[2]~1_combout\ # !\u0|tmp~regout\) # !\l[1]~0_combout\ & (\l[2]~1_combout\ $ (\LessThan0~0_combout\ # !\u0|tmp~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b4fb",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \l[1]~0_combout\,
	datad => \l[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux10~3_combout\);

\Mux9~2\ : maxii_lcell
-- Equation(s):
-- \Mux9~2_combout\ = \l[1]~0_combout\ & !\l[2]~1_combout\ & (\LessThan0~0_combout\ # !\u0|tmp~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00b0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \l[1]~0_combout\,
	datad => \l[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux9~2_combout\);

\Mux8~2\ : maxii_lcell
-- Equation(s):
-- \Mux8~2_combout\ = \l[1]~0_combout\ $ (\LessThan0~0_combout\ # !\u0|tmp~regout\) # !\l[2]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4bff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \u0|tmp~regout\,
	datac => \l[1]~0_combout\,
	datad => \l[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux8~2_combout\);

\Mux7~6\ : maxii_lcell
-- Equation(s):
-- \Mux7~6_combout\ = !\l[3]~3_combout\ & (\Mux10~2_combout\ & !\l[2]~1_combout\ & !\l[1]~0_combout\ # !\Mux10~2_combout\ & \l[2]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0046",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~2_combout\,
	datab => \l[2]~1_combout\,
	datac => \l[1]~0_combout\,
	datad => \l[3]~3_combout\,
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
	datain => \Mux10~3_combout\,
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


