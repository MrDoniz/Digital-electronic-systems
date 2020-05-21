--AUTOR: Daniel Doniz Garcia
--FECHA: 5 abr 2020
--EMAIL: alu0101217277@ull.edu.es
--ASIGNATURA: Sistemas Electronicos Digitales
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wrap_sistema is
  Port ( V_BT   : in  STD_LOGIC_VECTOR (1 downto 0);
    V_SW   : in  STD_LOGIC_VECTOR (0 downto 0);
    G_HEX0 : out STD_LOGIC_VECTOR (6 downto 0);
    G_LEDR : out STD_LOGIC_VECTOR (3 downto 0)
    );
end wrap_sistema;

architecture Behavioral of wrap_sistema is
  COMPONENT contador
  PORT(
    reset : IN std_logic;
    ce    : IN std_logic;
    clk   : IN std_logic;
    count : OUT std_logic_vector(3 downto 0)
    );
  END COMPONENT;
    
  COMPONENT dec7seg
  PORT ( 
    bcd : IN  std_logic_vector (3 downto 0);
    led : OUT std_logic_vector (6 downto 0)
    );
  END COMPONENT;
  
  signal int : std_logic_vector(3 downto 0);

begin
  Inst_contador: contador PORT MAP (
    clk   => V_BT(0),
    reset => V_BT(1),
    ce    => V_SW(0),
    count => int
    );

  Inst_dec7seg: dec7seg PORT MAP (
    bcd => int,
    led => G_HEX0
    );

  G_LEDR <= int;

end Behavioral;