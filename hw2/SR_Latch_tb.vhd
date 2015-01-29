library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch_tb is
end SR_Latch_tb;

architecture SR_Latch_tb_arch of SR_Latch_tb is
	component SR_Latch is
		port (
				S, R : 	IN std_logic;
				Q, NQ : INOUT std_logic
		);
	end component;
	
	signal ST, RT, QT, NQT : std_logic;
	
begin
	UUT : SR_Latch port map (S => ST, R => RT, Q => QT, NQ => NQT);

	process begin
		report "SR_Latch test initiated";
	
		RT <= '1', '0' after 25 ns, '1' after 30 ns, '0' after 50 ns;
		ST <= '0', '1' after 20 ns, '0' after 35 ns, '1' after 50 ns;
	
		wait for 75 ns;
	
		assert false report "SR_Latch test complete" severity failure;
	end process;
end SR_Latch_tb_arch;