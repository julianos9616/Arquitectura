
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;



entity Sumador is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);--NPC
           B : in  STD_LOGIC_VECTOR (31 downto 0);--PC
           S : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));--
end Sumador;

architecture arq_Sumador of Sumador is

begin
	process(A,B)
		begin
			S <= A + B;
	end process;

end arq_Sumador;

