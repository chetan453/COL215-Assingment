library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod_6_counter is
port (
	clk_in : in std_logic;
    reset : in std_logic;
    S : in std_logic;
    digit : out std_logic_vector (3 downto 0));
end mod_6_counter;

architecture md6c of mod_6_counter is

begin
  process
    variable processQ : integer := 0;
  begin
    if(reset = '1') then
            processQ := 0;
    elsif (falling_edge(clk_in)) then
      if(S = '1') then
          if (processQ < 5) then
            processQ := processQ + 1;
          else 
            processQ := 0;
          end if;
      end if;
    end if;
    digit<= std_logic_vector(to_unsigned(processQ,digit'length));
  end process;
end md6c;