library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec7seg is
	Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
   led : out  STD_LOGIC_VECTOR (6 downto 0));
end dec7seg;

architecture Behavioral of dec7seg is

	signal and1_led6, and2_led6 : std_logic;
	signal and1_led5, and2_led5, and3_led5 : std_logic;
	signal and1_led4 : std_logic;
	signal and1_led3, and2_led3, and3_led3 : std_logic; 
	signal and1_led1, and2_led1 : std_logic;
	signal and1_led0, and2_led0 : std_logic;

begin

--	 and1_led6 <= ((not(bcd(3))) and (not(bcd(2)))) and (not(bcd(1)));
--	 and2_led6 <= (bcd(2) and bcd(1)) and bcd(0);
--	 and1_led5 <= bcd(1) and bcd(0);
--	 and2_led5 <= ((not(bcd(3))) and (not(bcd(2)))) and bcd(0);
--	 and3_led5 <= ((not(bcd(3))) and (not(bcd(2)))) and bcd(1);
--	 and1_led4 <= (bcd(2) and not(bcd(3))) and (not(bcd(1)));
--	 and1_led3 <= ((not(bcd(3))) and (not(bcd(2)))) and (bcd(0) and (not(bcd(1))));
--	 and2_led3 <= ((bcd(2)) and (not(bcd(1)))) and (not(bcd(0)));
--	 and3_led3 <= (bcd(2) and bcd(1)) and bcd(0);
--	 and1_led1 <= (bcd(2) and not(bcd(1))) and bcd(0);
--	 and2_led1 <= (bcd(2) and bcd(1)) and (not(bcd(0)));
--	 and1_led0 <= ((not(bcd(3))) and (not(bcd(2)))) and (bcd(0) and (not(bcd(1))));
--	 and2_led0 <= (bcd(2) and not(bcd(1))) and (not(bcd(0)));
--	 led(6) <= and1_led6 or and2_led6;
--	 led(5) <= (and1_led5 or and2_led5) or and3_led5;
--	 led(4) <= bcd(0) or and1_led4;
--	 led(3) <= (and1_led3 or and2_led3) or and3_led3;
--	 led(2) <= ((not(bcd(3))) and (not(bcd(2)))) and (bcd(1) and (not(bcd(0))));
--	 led(1) <= and1_led1 or and2_led1;
--	 led(0) <= and1_led0 or and2_led0;

	with bcd select
		led <= "1000000" when "0000",
				 "1111001" when "0001",
				 "0100100" when "0010",
				 "0110000" when "0011",
				 "0011001" when "0100",
				 "0010010" when "0101",
				 "0000010" when "0110",
				 "1111000" when "0111",
				 "0000000" when "1000",
				 "0010000" when "1001",
				 "0111111" when others;
				 
end Behavioral;

