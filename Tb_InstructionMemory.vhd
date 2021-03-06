
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_InstructionMemory IS
END Tb_InstructionMemory;
 
ARCHITECTURE behavior OF Tb_InstructionMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        ); 

-- Stimulus process
   stim_proc: process
   begin		
      reset <= '0';
		address <= "00000000000000000000000000000000";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000001";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000010";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000011";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000100";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000101";
      wait for 100 ns;
		reset <= '0';
		address <= "00000000000000000000000000000110";
      wait for 100 ns;

      wait;
   end process;
END;
