
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;



entity ALU is
    Port ( Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0):= (others => '0'));
end ALU;

architecture arq_ALU of ALU is

begin
	process(In1,In2,Aluop)
		begin
			case Aluop is
				when "000000" => Result <= In1 + In2;
				when "000001" => Result <= In1 - In2;
				when "000010" => Result <= In1 and In2;
				when "000011" => Result <= In1 or In2;
				when "000100" => Result <= In1 xor In2;
				when "000101" => Result <= In1 xnor In2;
				when "000110" => Result <= In1 nand In2;
				when "000111" => Result <= In1 nor In2;
				when others => Result <= "00000000000000000000000000000000";
			end case;
	end process;

end arq_ALU;

