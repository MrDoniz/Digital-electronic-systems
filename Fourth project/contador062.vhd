--AUTOR: Daniel Doniz Garcia
--FECHA: 5 abr 2020
--EMAIL: alu0101217277@ull.edu.es
--ASIGNATURA: Sistemas Electronicos Digitales
library IEEE;
use IEEE.STD_LOGIC_1164.ALL

entity contador is
  Port ( 
    clk   : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    ce    : in  STD_LOGIC;
    count : out  STD_LOGIC_VECTOR (3 downto 0)
    );
end contador;

architecture Behavioral of contador is
	COMPONENT ffD_reset
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;
		d : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
  
	COMPONENT ffT_reset
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;
		t : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
	
	signal qa,qb, qc, qd: std_logic;
	signal da,db, dc, dd: std_logic;

begin
	unit_A: ffT_reset PORT MAP(
		clk   => clk,
		reset => reset,
		ce    => ce,
		t     => da,
		q     => qa
    );
	unit_B: ffD_reset PORT MAP(
		clk   => clk,
		reset => reset,
		ce    => ce,
		d     => db,
		q     => qb
    );
	unit_C: ffD_reset PORT MAP(
		clk   => clk,
		reset => reset,
		ce    => ce,
		d     => dc,
		q     => qc
    );
	unit_D: ffT_reset PORT MAP(
		clk   => clk,
		reset => reset,
		ce    => ce,
		t     => dd,
		q     => qd
    );
    
	dd <= (qb and qc) or (not qa and not qc and not qd) or (not qb and not qc and qd);
	dc <= (not qa and not qb and not qc) or (qb and qd);
	db <= (not qb and qc and not qd) or (qb and not qc) or (qb and qd);
	da <= (qb and qc and not qd);
	
	count <= qa & qb & qc & qd;

end Behavioral;