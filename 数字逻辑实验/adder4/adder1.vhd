library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity half_adder is
	port(a, b: in std_logic;
	s, c: out std_logic);
end half_adder ;
	
architecture bhv1 of half_adder is
begin
	c <= a and b ;
	s <= a xor b ;
end bhv1 ;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder1 is
	port(
		a,b,cin:in std_logic;
		s,cout:out std_logic;
		p,g:buffer std_logic
	);
end adder1;

architecture plus of adder1 is
	component half_adder
		port(a, b: in std_logic ;
		s, c: out std_logic) ;
	end component ;
begin
	u1: half_adder port map(a,b,p,g);
	process(cin,p,g)
	begin
		s <=cin xor p;
		cout <=g or (p and cin);
	end process;
end plus;
