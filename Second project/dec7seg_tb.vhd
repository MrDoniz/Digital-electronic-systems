LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY dec7seg_tb IS
END dec7seg_tb;
 
ARCHITECTURE behavior OF dec7seg_tb IS 
 
    COMPONENT dec7seg
    PORT(
         bcd : IN  std_logic_vector(3 downto 0);
         led : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');

   signal led : std_logic_vector(6 downto 0); 
 
BEGIN

   uut: dec7seg PORT MAP (
          bcd => bcd,
          led => led
        );
		
		bcd(0) <= not bcd(0) after 10 ns;
		bcd(1) <= not bcd(1) after 20 ns;
		bcd(2) <= not bcd(2) after 40 ns;
		bcd(3) <= not bcd(3) after 80 ns;

END;
