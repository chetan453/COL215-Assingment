library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
port(
  clock : in std_logic;
  reset, set  : in std_logic;
  factor : in integer;
  clock_out : out std_logic
);
end clock_divider;

architecture beh of clock_divider is
	signal clktemp : std_logic := '0'; 
begin
process (clock) is
variable count : integer := 0;
begin
    if(reset ='1') then
        count := 0;
        clktemp <= '0';
    elsif(falling_edge(clock) and set ='1') then
        count:= count + 1;
        if(count = factor) then
          clktemp <= not clktemp;
          count := 0;
        end if;
        
    end if;
end process;

clock_out <= clktemp ;

end beh;