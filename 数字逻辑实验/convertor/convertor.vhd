LIBRARY IEEE ; 
USE IEEE.STD_LOGIC_1164.ALL ; 
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL ;

entity convertor is
port(
		display:out std_logic_vector(6 downto 0);--不带译码器
		display_4:out std_logic_vector(3 downto 0);--带译码器
		display_41:out std_logic_vector(3 downto 0);--不带译码器
		clk:in std_logic; --控制输入
        rst:in std_logic --重置为0 
		); 
end convertor;

architecture bhv of convertor is
	signal F:std_logic_vector(3 downto 0):="0000" ;--自然数列
	signal S:std_logic_vector(3 downto 0):="0001" ;--奇数列
	signal T:std_logic_vector(3 downto 0):="0000" ;--偶数列
begin
	process(rst,clk)
	begin
		if(clk'event and clk='0') then
		if(F="1001") then F<="0000"; else F<=F+1 ; end if ;--+1
		if(S="1001") then S<="0001"; else S<=S+2 ; end if ;--+2
		if(T="1000") then T<="0000"; else T<=T+2 ; end if ;--+2
		end if;
		
		if(rst='1') then
		F<="0000" ; S<="0001"; T<="0000";--重置为0
		end if;
		
		display_4<=S ;--显示奇数列
		display_41<=T ;--显示偶数列
		case F is --译码，显示自然数列
			when "0000"=>display<="1111110"; --0
			when "0001"=>display<="0110000"; --1
			when "0010"=>display<="1101101"; --2
			when "0011"=>display<="1111001"; --3
			when "0100"=>display<="0110011"; --4
			when "0101"=>display<="1011011"; --5
			when "0110"=>display<="0011111"; --6
			when "0111"=>display<="1110000"; --7
			when "1000"=>display<="1111111"; --8
			when "1001"=>display<="1110011"; --9
			when "1010"=>display<="1110111"; --a                                                                                                                
			when "1011"=>display<="0011111"; --b
			when "1100"=>display<="1001110"; --c
			when "1101"=>display<="0111101"; --d
			when "1110"=>display<="1001111"; --e
			when "1111"=>display<="1000111"; --f
			when others=>display<="0000000"; --default
		end case;
	end process;
end bhv;
