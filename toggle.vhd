library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toggle is
    Port ( clk, reset, sw : in  STD_LOGIC;
           y : out STD_LOGIC);
end toggle;

architecture Behavioral of toggle is
	COMPONENT clk1milis
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		DP : OUT std_logic
		);
	END COMPONENT;

	COMPONENT chatter
	PORT(
		SW : IN std_logic;
		CLK_1ms : IN std_logic;          
		SWW : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT tffr
	PORT(
		t : IN std_logic;
		r : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;

	signal t_dp : std_logic;
	signal t_sww : std_logic;
begin

	Inst_clk1ms: clk1milis PORT MAP(
		CLK => clk,
		RST => reset,
		DP => t_dp -- 1 mili sec
	);

	-- avoid chattering
	Inst_chatter: chatter PORT MAP(
		SW => sw,
		CLK_1ms => t_dp,
		SWW => t_sww
	);
	
	-- T flip-flop
	Inst_tffr: tffr PORT MAP(
		t => t_sww,
		r => reset,
		q => y
	);

end Behavioral;

