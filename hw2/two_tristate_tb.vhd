library ieee;
use ieee.std_logic_1164.all;

entity two_tristate_tb is
end two_tristate_tb;

architecture two_tristate_tb_arch of two_tristate_tb is
	component Two_Tristate is
		port( 
			X, F, Y : IN std_logic;
			G : OUT std_logic
		);
	end component;
	
	signal XT, FT, YT, GT : std_logic;
	
begin
	UUT: Two_Tristate port map (X => XT, F => FT, Y => YT, G => GT);
	
	process begin
		report "two_tristate test initiated";
		
		XT <= '1', '0' after 10 ns, 'X' after 20 ns, 'L' after 30 ns, '1' after 40 ns;
		YT <= '0', 'L' after 10 ns, 'W' after 20 ns, '0' after 30 ns, 'Z' after 40 ns;
		FT <= '0', '1' after 10 ns, '0' after 50 ns;
		
		wait for 60 ns;
		
		assert false report "two_tristate test complete" severity failure;
	end process;
end two_tristate_tb_arch;