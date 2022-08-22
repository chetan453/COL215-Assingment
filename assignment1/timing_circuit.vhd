-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity timing_circuit is
port
(
	clk : in std_logic;
    mux_ctrl : out std_logic_vector(1 downto 0);
    anode_ctrl : out std_logic_vector(3 downto 0);
);
end timing_circuit;

architecture beh of timing_circuit is
begin
	signal count_ms : integer := 0;
    signal count_secOnes : integer := 0;
    signal count_secTenth : integer := 0;
    signal count_min : integer := 0;
    signal refresh : integer := 0;
    
    
	timeCalc : process(clk)
    begin
    	if(rising_edge(clk)) then 
        	count_ms <= count_ms + 1 ;
            count_secOnes <= count_secOnes + 1;
            count_secTenth <= count_secTenth + 1;
            count_min <= count_min + 1;
            refresh <= refresh + 1;
            
            case refresh is
            	when 0 =>
                	anode_ctrl <= "0001";
            	when 100000 =>
                	anode_ctrl <= "0010";
				when 200000 =>
                	anode_ctrl <= "0100";
                when 300000 =>
                	anode_ctrl <= "1000";
                when 400000 =>
                	anode_ctrl <= "0001";
                    refresh <= 0;
			end case;
           	mux_ctrl <= "00" ;
        end if;

end beh;