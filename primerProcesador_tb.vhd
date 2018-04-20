-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT primerProcesador
    PORT(
         clkP : IN  std_logic;
         ResetP : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clkP : std_logic := '0';
   signal ResetP : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkP_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: primerProcesador PORT MAP (
          clkP => clkP,
          ResetP => ResetP,
          AluResult => AluResult
        );

   -- Clock process definitions
   clkP_process :process
   begin
		clkP <= '0';
		wait for clkP_period/2;
		clkP <= '1';
		wait for clkP_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		 
      ResetP <= '0';
		wait for 10 ns;		
		
		
   end process;

END;