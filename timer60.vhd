library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity timer60 is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Y_DEG_1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  Y_DEG_10 : out  STD_LOGIC_VECTOR (7 downto 0));
end timer60;

architecture Behavioral of timer60 is

	COMPONENT cnt60
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Q_deg1 : OUT std_logic_vector(3 downto 0);
		Q_deg10 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT dec7seg
	PORT(
		A : IN std_logic_vector(3 downto 0);          
		Y : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	signal t_q_deg_1 : std_logic_vector(3 downto 0);
	signal t_q_deg_10 : std_logic_vector(3 downto 0);
	
begin

	Inst_cnt60: cnt60 PORT MAP(
		CLK => CLK,
		RESET => RESET,
		Q_deg1 => t_q_deg_1,
		Q_deg10 => t_q_deg_10 
	);

	dec7seg_deg_1: dec7seg PORT MAP(
		A => t_q_deg_1,
		Y => Y_DEG_1
	);
	
	dec7seg_deg_10: dec7seg PORT MAP(
		A => t_q_deg_10,
		Y => Y_DEG_10
	);
	
end Behavioral;

