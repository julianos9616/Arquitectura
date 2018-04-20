
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU is
    Port ( Imm : in  STD_LOGIC_VECTOR (12 downto 0);
           Sout : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));
end SEU;

architecture arq_SEU of SEU is

begin
	process(Imm)
		begin
			if Imm(12) = '0' then 
				Sout <= "0000000000000000000" & imm;
			else
				Sout <= "1111111111111111111" & imm;
			end if;
	end process;

end arq_SEU;

