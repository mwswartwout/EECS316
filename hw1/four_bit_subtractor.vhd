library ieee;
use ieee.std_logic_1164.all;

entity four_bit_subtractor is
	port (
			A, B : IN std_logic_vector (3 downto 0);
			Output : OUT std_logic_vector (3 downto 0);
			Overflow : OUT std_logic
		);
end four_bit_subtractor;

architecture four_bit_subtractor_arch of four_bit_subtractor is 
	component full_subtractor is
		port (
			X, Y, Z : in std_logic;
			D, B : out std_logic
		);
	end component;
	
	signal borrow3, borrow2, borrow1 : std_logic;
	
begin
	sub3 : full_subtractor port map (X => A(3), Y => B(3), Z => '0', D => Output(3), B => borrow3);
	sub2 : full_subtractor port map (X => A(2), Y => B(2), Z => borrow3, D => Output(2), B => borrow2);
	sub1 : full_subtractor port map (X => A(1), Y => B(1), Z => borrow2, D => Output(1), B => borrow1);
	sub0 : full_subtractor port map (X => A(0), Y => B(0), Z => borrow1, D => Output(0), B => Overflow);
end four_bit_subtractor_arch;