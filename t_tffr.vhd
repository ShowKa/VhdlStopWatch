--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:24:59 03/23/2020
-- Design Name:   
-- Module Name:   D:/abDATA/PLD/StopWatch/t_tffr.vhd
-- Project Name:  StopWatch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tffr
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY t_tffr IS
END t_tffr;
 
ARCHITECTURE behavior OF t_tffr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tffr
    PORT(
         t : IN  std_logic;
         r : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal t : std_logic := '0';
   signal r : std_logic := '0';

 	--Outputs
   signal q : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tffr PORT MAP (
          t => t,
          r => r,
          q => q
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
		r <= '1'; wait for 100 ns;
		r <= '0'; wait for 100 ns;
		--
      t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      t <= '1'; wait for 100 ns;
		t <= '0'; wait for 100 ns;	
      wait;
   end process;

END;
