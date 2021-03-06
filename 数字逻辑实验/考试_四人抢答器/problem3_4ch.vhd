library IEEE, BASIC;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY problem3_4ch IS
    PORT (
        clk1M                   : IN std_logic;   -- 1MHz 时钟
        clkBtn                  : IN std_logic;   -- CLK 按钮
        rstBtn                  : IN std_logic;   -- RST 按钮
        switches                : IN std_logic_vector(3 DOWNTO 0);   -- 连接4位开关
        leds                    : OUT std_logic_vector(3 DOWNTO 0));   -- 连接4位LED
END problem3_4ch;

ARCHITECTURE problem3_4ch OF problem3_4ch IS


    SIGNAL mode                     :  std_logic;   -- 0表示预备状态，1表示抢答状态
    SIGNAL btnSync                  :  std_logic;   
    SIGNAL btnLast                  :  std_logic;   
    SIGNAL switchSync               :  std_logic_vector(3 DOWNTO 0);   
    SIGNAL success                  :  std_logic_vector(3 DOWNTO 0);   
    SIGNAL leds_xhdl1               :  std_logic_vector(3 DOWNTO 0); 
    SIGNAL USEL						:  std_logic;  

BEGIN
    leds <= leds_xhdl1;
    leds_xhdl1 <= success ;

    PROCESS
    BEGIN
        WAIT UNTIL (clk1M'EVENT AND clk1M = '1');
        switchSync <= switches;    
        btnLast <= btnSync;    
        btnSync <= clkBtn;    
        IF (rstBtn = '1') THEN
            mode <= '0';    
        ELSE
            IF ((NOT btnSync AND btnLast) = '1') THEN
				mode <= '1';
            END IF;
        END IF;
    END PROCESS;

    PROCESS
    BEGIN
        WAIT UNTIL (clk1M'EVENT AND clk1M = '1');
        IF (NOT mode = '1') THEN
			success <= "0000";
        ELSE
			case switchsync is
				when "0001"=> success <= "0001";
				when "0010"=> success <= "0010";
				when "0100"=> success <= "0100";
				when "1000"=> success <= "1000";
				when others => USEL <= '1';
			end case;
        END IF;
    END PROCESS;
END problem3_4ch;
