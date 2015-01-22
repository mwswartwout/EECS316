library ieee;
use ieee.std_logic_1164.all;

-- x is minuend, y and z are subtrahends
-- d is difference, b is borrow
entity full_subtractor is
	port (
			X, Y, Z : in std_logic;
			D, B : out std_logic
	);
end full_subtractor;

architecture full_subtractor_arch of full_subtractor is

begin
	d <= X XOR Y XOR Z;
	b <= ((NOT X) AND (Y XOR Z)) OR (Y AND Z); 
end full_subtractor_arch;