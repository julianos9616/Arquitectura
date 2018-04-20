LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ProgramCounter IS
END TB_ProgramCounter;
 
ARCHITECTURE behavior OF TB_ProgramCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         clk : IN  std_logic;
         Reset : IN  std_logic;
         InAddress : IN  std_logic_vector(31 downto 0);
         OutAddress : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal InAddress : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OutAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          clk => clk,
          Reset => Reset,
          InAddress => InAddress,
          OutAddress => OutAddress
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      InAddress <= "10100000000000000000000000000000";
		Reset <= '0';
      wait for 40 ns;	

      InAddress <= "10110000000000000000000000000000";
		Reset <= '1';
      wait for 40 ns;	
		
      wait;
   end process;

END;
