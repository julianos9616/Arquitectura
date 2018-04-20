
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_Multiplexor IS
END TB_Multiplexor;
 
ARCHITECTURE behavior OF TB_Multiplexor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor
    PORT(
         In1 : IN  std_logic_vector(31 downto 0);
         In2 : IN  std_logic_vector(31 downto 0);
         Sc : IN  std_logic;
         Sout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(31 downto 0) := (others => '0');
   signal In2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Sc : std_logic := '0';

 	--Outputs
   signal Sout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor PORT MAP (
          In1 => In1,
          In2 => In2,
          Sc => Sc,
          Sout => Sout
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      IN1 <= "00001010101010100000000000000000";
		IN2 <= "11111111111111111111111111111111";
		Sc <= '1';
		wait for 100 ns;	
		
		IN1 <= "00001010101010100000000000000000";
		IN2 <= "11111111111111111111111111111111";
		Sc <= '0';
		wait for 100 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
