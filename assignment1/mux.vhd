library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
    Port ( ctr_ip : in STD_LOGIC_VECTOR (1 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           digit4 : in STD_LOGIC_VECTOR (3 downto 0);
           digit_out : out STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is
begin
process(ctr_ip, digit1, digit2, digit3, digit4) is
    begin
        case ctr_ip is
            when "00" =>
                digit_out <= digit1;
            when "01" =>
                digit_out <= digit2;
            when "10" =>
                digit_out <= digit3;
            when "11" =>
                digit_out <= digit4;
            when others => 
       end case;
    end process;
end Behavioral;