library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity primerProcesador is
    Port ( clkP : in  STD_LOGIC;
           ResetP : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end primerProcesador;

architecture arq_primerProcesador of primerProcesador is


	COMPONENT ALU
	PORT(
		Aluop : IN std_logic_vector(5 downto 0);
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT CU
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		Aluop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Multiplexor
	PORT(
		In1 : IN std_logic_vector(31 downto 0);
		In2 : IN std_logic_vector(31 downto 0);
		Sc : IN std_logic;          
		Sout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ProgramCounter
	PORT(
		clk : IN std_logic;
		Reset : IN std_logic;
		InAddress : IN std_logic_vector(31 downto 0);          
		OutAddress : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT RegisterFile
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rd : IN std_logic_vector(4 downto 0);
		Reset : IN std_logic;
		Data : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		Imm : IN std_logic_vector(12 downto 0);          
		Sout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nextProgramCounter
	PORT(
		InAddress : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		Reset : IN std_logic;          
		outAddress : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal nPCtoPC, nPCtoAdder, AdderToNPC, PCtoIM,IMtoRF, auxImm, auxAluresult, auxCrs1, auxCrs2, MuxToALU : std_logic_vector (31 downto 0) := x"00000000";
signal auxAluop : std_logic_vector(5 downto 0) := "000000";  	
	
begin
	
	
	Inst_nextProgramCounter: nextProgramCounter PORT MAP(
		InAddress => AdderToNPC,
		clk => clkP,
		Reset => ResetP,
		outAddress => nPCtoPC 
	);

	nPCtoAdder <= nPCtoPC;
	
	Inst_Sumador: Sumador PORT MAP(
		A => "00000000000000000000000000000001",
		B => nPCtoAdder,
		S => AdderToNPC
	);
	
	
  Inst_ProgramCounter: ProgramCounter PORT MAP(
		clk => clkP,
		Reset => ResetP,
		InAddress => nPCtoPC,
		OutAddress => PCtoIM
	);

  Inst_instructionMemory: instructionMemory PORT MAP(
		address => PCtoIM,
		reset => ResetP,
		outInstruction => IMtoRF
	);

  Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 => IMtoRF(18 downto 14),
		Rs2 => IMtoRF(4 downto 0),
		Rd => IMtoRF(29 downto 25),
		Reset => ResetP,
		Data => auxAluresult,
		Crs1 => auxCrs1,
		Crs2 => auxCrs2
	);

  Inst_CU: CU PORT MAP(
    Op => IMtoRF(31 downto 30),
    Op3 => IMtoRF(24 downto 19),
    Aluop => auxAluop
  );

  Inst_SEU: SEU PORT MAP(
		Imm => IMtoRF(12 downto 0),
		Sout => auxImm
	);

  Inst_Multiplexor: Multiplexor PORT MAP(
    In1 => auxCrs2,
    In2 => auxImm,
    Sc => IMtoRF(13),
    Sout => MuxToALU
  );

  Inst_ALU: ALU PORT MAP(
    Aluop => auxAluop,
    In1 => auxCrs1,
    In2 => MuxToALU,
    Result => auxAluresult
  );

  AluResult <= auxAluresult;
  
  
end arq_primerProcesador;

