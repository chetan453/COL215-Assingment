-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity seven_segment_decoder is
port(
  digit_input : in std_logic_vector (3 downto 0);
  cathod_out : out std_logic_vector (6 downto 0));
 end seven_segment_decoder;
 
 architecture beh of seven_segment_decoder is 
 begin 
 	process(digit_input) is
    variable a,b,c,d : std_logic;
    begin
    	a := digit_input(3);
        b := digit_input(2);
        c := digit_input(1);
        d := digit_input(0);
    	cathod_out(6)<=c or a or (not(b)and not(d)) or (b and d);
        cathod_out(5)<=not(b) or (not(c) and not(d)) or (c and d);
        cathod_out(4)<= not(c) or d or b;
        cathod_out(3)<=a or (not(b) and not(d)) or (not(b) and c) or (c and not(d)) or (b and not(c) and d);
        cathod_out(2)<=(not(b) or c)and not(d);
        cathod_out(1)<=a or (not(c) and not(d)) or (b and not(c)) or (b and not(d));
        cathod_out(0)<=a or (not(b) and c) or (c and not(d)) or (b and not(c));
    end process;
 end beh;