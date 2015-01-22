library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture full_adder_tb_arch of full_adder_tb is
	signal aT, bT, c_inT, SumT, CarryT : std_logic;
	
	component full_adder is 
		port( 
				a, b, c_in : IN std_logic;
				Sum, Carry : OUT std_logic
		);
	end component;
	
begin
	UUT : full_adder port map (a => aT, b => bT, c_in => c_inT, Sum => SumT, Carry => CarryT);

	process begin
		report "full_adder test begin";
	
		aT <= '1', '0' after 20 ns, '1' after 30 ns;
		bT <= '0', '1' after 10 ns, '0' after 25 ns, '1' after 35 ns;
		c_inT <= '0', '1' after 15 ns;
		wait for 100 ns;
		
		assert false report "full_adder test end" severity failure;
	end process;
end full_adder_tb_arch; 