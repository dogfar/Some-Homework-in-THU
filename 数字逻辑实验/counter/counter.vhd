library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity chufa is
	port(
		clk, rst, mode, pause: in std_logic;
		ten, one: buffer std_logic_vector(3 downto 0)
	);
end chufa;

architecture arc of chufa is
	signal cnt: integer := 0;
begin
	process(clk, rst)
	begin
		if (rst = '1') then
			ten <= "0000";one <= "0000";cnt <= 0;
		elsif (clk'event and clk = '1' and pause = '0') then
			if (mode = '1') then --(TIME Count)
				if (cnt < 16000000) then
					cnt <= cnt + 1;
				else
					cnt <= 0;
				end if;
			end if;
			if (mode = '0' or cnt = 0) then -- press count
				if (ten = "1001") then
					ten <= "0000";
					if (one = "0101") then
						one <= "0000";
					else
						one <= one + 1;
					end if;
				else
					ten <= ten + 1;
				end if;
			end if;
		end if;
	end process;
end arc;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity trans is
	port(
		number: in std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0)
	);
end trans;
architecture arc of trans is
begin
	process(number)
	begin
		case number is
			when "0000"=>display<="1111110";
			when "0001"=>display<="0110000";
			when "0010"=>display<="1101101";
			when "0011"=>display<="1111001";
			when "0100"=>display<="0110011";
			when "0101"=>display<="1011011";
			when "0110"=>display<="0011111";
			when "0111"=>display<="1110000";
			when "1000"=>display<="1111111";
			when "1001"=>display<="1110011";
			when "1010"=>display<="1110111";
			when "1011"=>display<="0011111";
			when "1100"=>display<="1001110";
			when "1101"=>display<="0111101";
			when "1110"=>display<="1001111";
			when "1111"=>display<="1000111";
			when others=>display<="0000000";
		end case;
	end process;
end arc;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(
		clk, rst, mode, pause: in std_logic;
		ten, one: buffer std_logic_vector(3 downto 0);
		ll, hh: out std_logic_vector(6 downto 0)
	);
end counter;

architecture arc of counter is
	component chufa
		port(
			clk, rst, mode, pause: in std_logic;
			ten, one: buffer std_logic_vector(3 downto 0)
		);
	end component;
	component trans
		port(
			number: in std_logic_vector(3 downto 0);
			display: out std_logic_vector(6 downto 0)
		);	
	end component;
begin
	tmp0: chufa port map(clk=>clk, rst=>rst, ten=>ten, one=>one, mode=>mode, pause=>pause);
	tmp1: trans port map(number=>ten, display=>ll);
	tmp2: trans port map(number=>one, display=>hh);
end arc;