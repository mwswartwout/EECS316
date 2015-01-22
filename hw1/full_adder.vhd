library ieee;
use ieee.std_logic_1164.all;

ENTITY full_adder IS
	PORT (
			a, b, c_in : IN std_logic;
			Sum, Carry : OUT std_logic
	);
END full_adder;

ARCHITECTURE full_adder_arch_2 OF full_adder IS
	SIGNAL s1, s2, s3 : std_logic;
	
BEGIN
		s1 <= (a XOR b) after 15 ns;
		s2 <= (c_in AND s1) after 5 ns;
		s3 <= (a AND b) after 5 ns;
		Sum <= (s1 XOR c_in) after 15 ns;
		Carry <= (s2 OR s3) after 5 ns;
END full_adder_arch_2;