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
	D_g <= D AND Clk;
	nD_g <= NOT D AND Clk;
	Qa <= NOT(D_g OR Qb);
	Qb <= NOT(nD_G OR Qa);
	Q <= Qa;
END part2_arch;