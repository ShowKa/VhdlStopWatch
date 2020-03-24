library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity chatter is
    Port ( SW : in  STD_LOGIC;
	        CLK_1ms : in  STD_LOGIC;
           SWW : out  STD_LOGIC);
end chatter;

architecture Behavioral of chatter is
signal chatt : std_logic_vector(3 downto 0);
begin

	process(CLK_1ms)
	begin 
		if(CLK_1ms' event and CLK_1ms = '1') then
			chatt <= chatt(2 downto 0) & SW;
		end if;
	end process;

	SWW <= chatt(3) and chatt(2) and chatt(1) and chatt(0);

end Behavioral;

