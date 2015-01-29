library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port( 
			X, Y, Cin : IN std_logic;
			F : IN std_logic_vector (2 downto 0);
			S, Cout : OUT std_logic
	);
end alu;

architecture alu_arch of alu is
	component full_adder is
		port (
				a, b, c_in : IN std_logic;
				Sum, Carry : OUT std_logic
		);
	end component;
	
	component full_subtractor is
		port (
			minuend, subtrahend1, subtrahend2 : in std_logic;
			Difference, Borrow : out std_logic
		);
	end component;
	
	signal AdderSum, AdderCarry, SubtractorDifference, SubtractorBorrow : std_logic;
	
begin
	adder : full_adder port map (a => X, b => Y, c_in => Cin, Sum => AdderSum, Carry => AdderCarry);
	subtractor : full_subtractor port map (minuend => X, subtrahend1 => Y, subtrahend2 => Cin, Difference => SubtractorDifference, Borrow => SubtractorBorrow);
	
	with F select S <=
		'0' when "000",
		X when "001",
		Y when "010",
		Cin when "011",
		(X OR Y) when "100",
		(X AND Y) when "101",
		AdderSum when "110",
		SubtractorDifference when "111",
		'Z' when others;
	
	with F select Cout <=
		'0' when "000",
		'X' when "001",
		'1' when "010",
		X when "011",
		X when "100",
		X when "101",
		AdderCarry when "110",
		SubtractorBorrow when "111",
		'Z' when others;
end alu_arch;