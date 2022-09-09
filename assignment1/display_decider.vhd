-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity display_decider is
port
(
    clk : in std_logic;
    mux_ctrl : out std_logic_vector(1 downto 0);
    anode_ctrl : out std_logic_vector(3 downto 0);
    dp : out std_logic
);
end display_decider;

architecture beh of display_decider is
    signal refresh : integer := 0;
begin

  process 
  
    begin
    
    if(falling_edge(clk)) then
      refresh <= refresh + 1;


    case refresh is
      when 1 =>
        anode_ctrl <= "1110";
        mux_ctrl<="00";
        dp <= '1';
      when 100000 =>
        anode_ctrl <= "1101";
        mux_ctrl<="01";
        dp <= '0';
      when 200000 =>
        anode_ctrl <= "1011";
        mux_ctrl<="10";
        dp <= '1';
      when 300000 =>
        anode_ctrl <= "0111";
        mux_ctrl<="11";
        dp <= '0';
      when 400000 =>
        anode_ctrl <= "1110";
        mux_ctrl<="00";
        dp <= '1';
        refresh <= 0;
       when others =>
    end case;
 end if;
 end process ;
end beh;