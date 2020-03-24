
-- VHDL Instantiation Created from source file display.vhd -- 09:51:08 03/23/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT display
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Y : OUT std_logic_vector(7 downto 0);
		AN : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_display: display PORT MAP(
		CLK => ,
		RESET => ,
		Y => ,
		AN => 
	);


