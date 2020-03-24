
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity display is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
			  Y : out STD_LOGIC_VECTOR(7 downto 0);
			  AN : out STD_LOGIC_VECTOR(3 downto 0)
           );
end display;

architecture Behavioral of display is
	
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

begin

	Inst_clk1milis: clk1milis PORT MAP(
		CLK => CLK,
		RST => RESET,
		DP => DP_mili
	);

	Inst_clk1s: clk1s PORT MAP(
		CLK => CLK,
		RST => RESET,
		DP => DP
	);

	Inst_timer60: timer60 PORT MAP(
		CLK => DP,
		RESET => RESET,
		Y_DEG_1 => T_DEG_1,
		Y_DEG_10 =>  T_DEG_10
	);

	Inst_select_display: select_display PORT MAP(
		CLK => DP_mili,
		RESET => RESET,
		select_display => t_display
	);
	
	process(T_DEG_1, T_DEG_10, t_display)
	begin
		case t_display is 
			when "00" => Y <= T_DEG_1; AN <= "1110";
			when "01" => Y <= T_DEG_10; AN <= "1101";
			when "10" => Y <=  "11000000"; AN <= "1011";
			when others => Y <= "11000000"; AN <= "0111";
		end case;
	end process;

end Behavioral;

