--A gated D latch described the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part2 is
	PORT(
		Clk,D: IN STD_LOGIC;
		Q: OUT STD_LOGIC
	);
END part2;

ARCHITECTURE part2_arch OF part2 IS
	SIGNAL D_g,nD_g,Qa,Qb: STD_LOGIC;
	ATTRIBUTE keep: boolean;
	ATTRIBUTE keep of D_g,nD_g,Qa,Qb: SIGNAL IS true;
BEGIN
	D_g <= NOT (D AND Clk);
	nD_g <= NOT (NOT D AND Clk);
	Qa <= NOT(D_g AND Qb);
	Qb <= NOT(nD_G AND Qa);
	Q <= Qa;
END part2_arch;

--*====================================================================================*--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part3 is
	PORT(
		Clk,D: IN STD_LOGIC;
		Q: OUT STD_LOGIC
	);
END part3;

ARCHITECTURE part3_arch OF part3 IS
	SIGNAL Qm: STD_LOGIC;
   COMPONENT part2 is
      port(clk, D : in std_logic;
          Q: out std_logic);
   END COMPONENT;
BEGIN
	G1: part2 port map(NOT Clk, D, Qm);
	G2: part2 port map(Clk, Qm, Q);
END part3_arch;