LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Sumador IS
END TB_Sumador;
 
ARCHITECTURE behavior OF TB_Sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         S : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          A => A,
          B => B,
          S => S
        );


   -- Stimulus process
   stim_proc: process
   begin		
      A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000100";
		wait for 40 ns;
		
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000100";
		wait for 40 ns;
   end process;

END;
