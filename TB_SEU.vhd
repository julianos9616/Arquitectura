LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TB_SEU IS
END TB_SEU;
 
ARCHITECTURE behavior OF TB_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         Imm : IN  std_logic_vector(12 downto 0);
         Sout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Sout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          Imm => Imm,
          Sout => Sout
        );

   -- Clock process definitions
   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Imm <= "0111111111111";
		wait for 20 ns;
		Imm <= "1000000000001";
		wait for 20 ns;
		Imm <= "1110000000001";
		wait for 20 ns;
		Imm <= "0110000000001";
		wait for 20 ns;

 -- insert stimulus here 

      wait;
   end process;

END;
