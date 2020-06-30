library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity to_7seg is
   Port ( 
		A : in  STD_LOGIC_VECTOR (3 downto 0);
      seg7 : out  STD_LOGIC_VECTOR (6 downto 0)
	);
end to_7seg;

architecture Behavioral of to_7seg is

begin

--'a' corresponds to MSB of seg7 and 'g' corresponds to LSB of seg7.
process (A)
BEGIN
   case A is
        when "0000"=> seg7 <="0000001";  -- '0'
        when "0001"=> seg7 <="1001111";  -- '1'
        when "0010"=> seg7 <="0010010";  -- '2'
        when "0011"=> seg7 <="0000110";  -- '3'
        when "0100"=> seg7 <="1001100";  -- '4' 
        when "0101"=> seg7 <="0100100";  -- '5'
        when "0110"=> seg7 <="0100000";  -- '6'
        when "0111"=> seg7 <="0001111";  -- '7'
        when "1000"=> seg7 <="0000000";  -- '8'
        when "1001"=> seg7 <="0000100";  -- '9'
        when "1010"=> seg7 <="0001000";  -- 'A'
        when "1011"=> seg7 <="1100000";  -- 'b'
        when "1100"=> seg7 <="0110001";  -- 'C'
        when "1101"=> seg7 <="1000010";  -- 'd'
        when "1110"=> seg7 <="0110000";  -- 'E'
        when "1111"=> seg7 <="0111000";  -- 'F'
        when others =>  NULL;
   end case;
end process;

end Behavioral;

--*===============================================================================================*--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY part_5 IS
    PORT ( 
        SW1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  SW2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END part_5;

ARCHITECTURE part_5_arch OF part_5 IS
   COMPONENT to_7seg is
      port(
			A : in  STD_LOGIC_VECTOR (3 downto 0);
         seg7 : out  STD_LOGIC_VECTOR (6 downto 0)
		);
   END COMPONENT;
   SIGNAL A : STD_LOGIC_VECTOR(7 downto 0);
   SIGNAL B : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	seg1 : to_7seg port map(A(3 downto 0));
	seg2 : to_7seg port map(A(7 downto 4));
	seg3 : to_7seg port map(B(3 downto 0));
	seg4 : to_7seg port map(B(7 downto 4));
END part_5_arch;