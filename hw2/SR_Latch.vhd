library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch is
	port(
			S, R : 	IN std_logic;
			Q, NQ : INOUT std_logic
	);
end SR_Latch;

--architecture SR_Latch_Inertial_5ns of SR_Latch is
--begin
--	Q <= R NOR NQ after 5 ns;
--	NQ <= S NOR Q after 5 ns;
--end SR_Latch_Inertial_5ns;

--architecture SR_Latch_Inertial_20ns of SR_Latch is
--begin
--	Q <= R NOR NQ after 20 ns;
--	NQ <= S NOR Q after 20 ns;
--end SR_Latch_Inertial_20ns;

architecture SR_Latch_Transport_20ns of SR_Latch is
begin
	Q <= transport R NOR NQ after 20 ns;
	NQ <= transport S NOR Q after 20 ns;
end SR_Latch_Transport_20ns;
