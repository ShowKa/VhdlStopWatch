library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt60 is
    Port ( CLK, RESET : in  STD_LOGIC;
           Q_deg1, Q_deg10 : out  STD_LOGIC_VECTOR (3 downto 0));
end cnt60;

architecture Behavioral of cnt60 is

	COMPONENT cnt10
	PORT(
		R : IN std_logic;
		CLK : IN std_logic;          
		Q : OUT std_logic_vector(3 downto 0);
		Carry : OUT std_logic
		);
	END COMPONENT;

	COMPONENT cnt6
	PORT(
		CLK : IN std_logic;
		R : IN std_logic;          
		Q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal t_c : std_logic;

begin

	Inst_cnt10: cnt10 PORT MAP(
		R => RESET,
		CLK => CLK,
		Q => Q_deg1,
		Carry =>  t_c
	);
	
	Inst_cnt6: cnt6 PORT MAP(
		CLK => t_c,
		R => RESET,
		Q => Q_deg10
	);

end Behavioral;

