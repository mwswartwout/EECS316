library ieee;
use ieee.std_logic_1164.all;

entity Two_Tristate is 
	port( 
			X, F, Y : IN std_logic;
			G : OUT std_logic
	);
end Two_Tristate;

architecture Two_Tristate_arch of Two_Tristate is
	component tristate_buffer is 
		port (
				input, enable : IN std_logic;
				output : OUT std_logic
		);
	end component;
	
begin
	tristate1 : tristate_buffer port map (input => X, enable => F, output => G);
	tristate2 : tristate_buffer port map (input => Y, enable => F, output => G);
end;
	