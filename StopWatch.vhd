
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity StopWatch is
    Port ( clk, reset, switch : in  STD_LOGIC;
           seg7_display : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end StopWatch;

architecture Behavioral of StopWatch is

	COMPONENT toggle
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		sw : IN std_logic;          
		y : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT clk1milis
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		DP : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT clk1s
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		DP : OUT std_logic
		);
	END COMPONENT;

	COMPONENT timer60
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Y_DEG_1 : OUT std_logic_vector(7 downto 0);
		Y_DEG_10 : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT select_display
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;          
		select_display : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	signal DP_mili : STD_LOGIC;
	signal DP : STD_LOGIC;
	signal T_DEG_1, T_DEG_10 :STD_LOGIC_VECTOR (7 downto 0);
	signal t_display : std_logic_vector(1 downto 0);
	signal t_sww : std_logic;
	signal t_clk : std_logic;
begin

	-- switch
	Inst_swith: toggle PORT MAP(
		clk => clk,
		reset => reset,
		sw => switch,
		y => t_sww
	);

	-- select display
	Inst_clk1milis: clk1milis PORT MAP(
		CLK => CLK,
		RST => RESET,
		DP => DP_mili
	);

	Inst_select_display: select_display PORT MAP(
		CLK => DP_mili,
		RESET => RESET,
		select_display => t_display
	);

	-- timer
	process(t_sww)
	begin 
		-- starts clock when switch is pushed
		if (t_sww = '1') then
			t_clk <= clk;
		else
			t_clk <= '0';
		end if;
	end process;

	Inst_clk1s: clk1s PORT MAP(
		CLK => t_clk,
		RST => RESET,
		DP => DP
	);

	Inst_timer60: timer60 PORT MAP(
		CLK => DP,
		RESET => RESET,
		Y_DEG_1 => T_DEG_1,
		Y_DEG_10 =>  T_DEG_10
	);

	process(T_DEG_1, T_DEG_10, t_display)
	begin
		case t_display is 
			when "00" => seg7_display <= T_DEG_1; an <= "1110";
			when "01" => seg7_display <= T_DEG_10; an <= "1101";
			when "10" => seg7_display <=  "11000000"; an <= "1011";
			when others => seg7_display <= "11000000"; an <= "0111";
		end case;
	end process;

end Behavioral;

