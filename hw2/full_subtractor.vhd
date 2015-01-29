library ieee;
use ieee.std_logic_1164.all;

-- minuend is minuend, subtrahend1 and subtrahend2 are subtrahends
-- Difference is difference, Borrow is borrow
entity full_subtractor is
	port (
			minuend, subtrahend1, subtrahend2 : in std_logic;
			Difference, Borrow : out std_logic
	);
end full_subtractor;

architecture full_subtractor_arch of full_subtractor is

begin
	Difference <= minuend XOR subtrahend1 XOR subtrahend2;
	Borrow <= ((NOT minuend) AND (subtrahend1 XOR subtrahend2)) OR (subtrahend1 AND subtrahend2); 
end full_subtractor_arch;