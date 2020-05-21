# AUTOR: Daniel Dóniz García
# FECHA: 17 abr 2020
# EMAIL: alu0101217277@ull.edu.es
# ASIGNATURA: Sistemas Electrónicos Digitales
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity wrap_contador is
	Port ( 
    V_BT   : in  STD_LOGIC_VECTOR (1 downto 0);
    V_SW   : in  STD_LOGIC_VECTOR (0 downto 0);
    G_LEDR : out STD_LOGIC_VECTOR (3 downto 0)
    );
end wrap_contador;

architecture Behavioral of wrap_contador is
	COMPONENT contador
	PORT(
		clk   : IN std_logic;
		reset : IN std_logic;
		ce    : IN std_logic;
		count : OUT std_logic_vector (3 downto 0)
		);
	END COMPONENT;

begin
	Inst_contador: contador PORT MAP (
		clk   => V_BT(0),
		reset => V_BT(1),
		ce    => V_SW(0),
		count => G_LEDR
	);

end Behavioral;