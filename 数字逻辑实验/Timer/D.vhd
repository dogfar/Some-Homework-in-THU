library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;

entity D is
	port(clk, rst: IN STD_LOGIC ;
	q, nq: OUT STD_LOGIC
	) ;
end D ;

architecture bhv of D is
signal tmp: STD_LOGIC := '0' ; 
begin 
	process(clk, rst)
	begin 
		if(rst = '0') then 
			tmp <= '0' ;
		elsif (clk'event) and (clk = '1') then
			tmp <= not tmp ;
		end if ;
	end process ;
	
	process(tmp)
	begin
		q <= tmp ;
		nq <= not tmp ;
	end process ;
end bhv ;
