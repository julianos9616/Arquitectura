
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity instructionMemory is
    Port ( 
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));
end instructionMemory;

architecture arqInstructionMemory of instructionMemory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	signal instructions : rom_type := (X"01000000",
	--instrucciones
												  "10000010000100000010000000001000",-- mov 8 %g1
												  "10000100000100000011111111111001",-- mov -7 %g2
												  "10010000000000000100000000000010",-- add %g1, %g2, %o0
												  "10010000000110000100000000000010",-- xor %g1, %g2, %o1
												  "10010100001010000100000000000010",-- andn %g1, %g2, %o2
												  "10010110001110000100000000000010",-- xnor %g1, %g2, %o3
												  "10011000001000000100000000000010",-- sub %g1, %g2, %o4
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000");
												  
	
begin
	process (reset, address)
		begin
			if (reset = '1') then
				outInstruction <= (others => '0');
			else
				outInstruction <= instructions(conv_integer(address(5 downto 0)));--retorna en entero la posicion de la matriz
			end if;
	end process;
end arqInstructionMemory;

