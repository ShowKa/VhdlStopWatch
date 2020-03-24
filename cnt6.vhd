library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt6 is
    Port ( CLK : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end cnt6;

architecture Behavioral of cnt6 is
	signal T_Q : STD_LOGIC_VECTOR(3 downto 0);
begin
	process(CLK, R)
	begin
		if (R = '1') then
			T_Q <= "0000";
		elsif (CLK' event and CLK = '1') then
			if (T_Q = "0101") then
				T_Q <= "0000";
			else 
				T_Q <= T_Q + 1;
			end if;
		end if;
	end process;
	Q <= T_Q;
end Behavioral;

