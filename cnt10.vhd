
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity cnt10 is
    Port ( R, CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Carry: out STD_LOGIC
			  );
end cnt10;

architecture Behavioral of cnt10 is
	signal T_Q : std_logic_vector(3 downto 0);
begin
	process(CLK, R)
	begin
		if (R = '1') then
			T_Q <= "0000";			
		elsif (CLK' event and CLK = '1') then
			if (T_Q = "1001") then 
				T_Q <= "0000";
				Carry <= '1';
			else
				T_Q <= T_Q + 1;
				Carry <= '0';
			end if;
		end if;
	end process;
	Q <= T_Q;
end Behavioral;

