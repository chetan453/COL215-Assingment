----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2022 03:06:14 PM
-- Design Name: 
-- Module Name: seven_segment_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_segment_decoder is
    Port ( digit_input : in STD_LOGIC_VECTOR (3 downto 0);
           cathod_out : out STD_LOGIC_VECTOR (6 downto 0));
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
        cathod_out(6)<= not (c or a or (not(b)and not(d)) or (b and d));
        cathod_out(5)<=not(not(b) or (not(c) and not(d)) or (c and d));
        cathod_out(4)<= not(not(c) or d or b);
        cathod_out(3)<= not(a or (not(b) and not(d)) or (not(b) and c) or (c and not(d)) or (b and not(c) and d));
        cathod_out(2)<=not((not(b) or c)and not(d));
        cathod_out(1)<=not(a or (not(c) and not(d)) or (b and not(c)) or (b and not(d)));
        cathod_out(0)<=not(a or (not(b) and c) or (c and not(d)) or (b and not(c)));
    end process;
 end beh;
