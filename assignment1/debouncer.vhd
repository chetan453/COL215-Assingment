----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2022 22:07:35
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    Port ( clk : in STD_LOGIC;
           start : in STD_LOGIC;
           pause : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_start : out STD_LOGIC;
           out_reset : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
signal tmpclk : std_logic := '0';
begin
process (clk,start,pause,reset) is
variable count_s,count_p,count_r : integer := 0;
begin
    if(falling_edge(clk)) then
        if(start = '1') then
            count_s := count_s + 1;
            if(count_s = 1000) then
                count_s := 0;
                tmpclk<= '1';
                out_reset<= '0';
        end if;
        elsif(pause = '1') then
            count_p := count_p + 1;
            if(count_p = 1000) then
                count_p := 0;
                tmpclk<= '0';
            end if;
        elsif(reset = '1') then
            count_r := count_r + 1;
            if(count_r = 1000) then
                count_r := 0;
                tmpclk<='0';
                out_reset<= '1';
             end if;
        end if;
      end if;
      out_start <= tmpclk;
end process;
end Behavioral;
