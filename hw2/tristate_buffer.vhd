library ieee;
use ieee.std_logic_1164.all;

entity tristate_buffer is
	port(	
			input, enable : IN std_logic;
			output : OUT std_logic
	);
end tristate_buffer;

architecture tristate_buffer_arch of tristate_buffer is
begin
	output <= transport input after 5 ns when (enable = '1') else 'Z';
end tristate_buffer_arch;