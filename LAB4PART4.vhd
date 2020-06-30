--A gated D latch described the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part4_1 is
	PORT(
		Clk,D: IN STD_LOGIC;
		Q: OUT STD_LOGIC
	);
END part4_1;

ARCHITECTURE part4_1_arch OF part4_1 IS
BEGIN
	PROCESS(D,Clk)
	BEGIN
		IF Clk='1' THEN
			Q <= D;
		END IF;
	END PROCESS;
END part4_1_arch;

--*====================================================================================*--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part4_2 is
	PORT(
		Clk,D: IN STD_LOGIC;
		Qa, Qb, Qc: OUT STD_LOGIC
	);
END part4_2;

ARCHITECTURE part4_2_arch OF part4_2 IS
   COMPONENT part4_1 is
      port(clk, D : in std_logic;
          Q: out std_logic);
   END COMPONENT;
BEGIN
	G1: part4_1 port map(Clk, D, Qa);
	G2: part4_1 port map(Clk, D, Qb);
	G3: part4_1 port map(NOT Clk, D, Qc);
END part4_2_arch;