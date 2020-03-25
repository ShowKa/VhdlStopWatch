library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tffr is
    Port ( t, r : in  STD_LOGIC;
           q : out  STD_LOGIC);
end tffr;

architecture Behavioral of tffr is
	signal t_q : std_logic;
begin
	-- t flip-flop
	process(t, r) 
	begin
		if(r='1') then
			t_q <= '0';
		elsif (t' event and T = '1') then
			t_q <= not t_q;
		end if;
	end process;
	q <= t_q;
end Behavioral;

