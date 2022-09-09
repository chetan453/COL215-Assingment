library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main is 
port(
    start,reset,pause : in std_logic;
    clock_main : in std_logic;
    segment : out std_logic_vector (6 downto 0);
    anodes : out std_logic_vector (3 downto 0);
    dp : out std_logic
);
end main;

architecture beh of main is 

  component debouncer is
    Port ( clk : in STD_LOGIC;
           start : in STD_LOGIC;
           pause : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_start : out STD_LOGIC;
           out_reset : out STD_LOGIC);
end component;

  component display_decider is
  port
  (
      clk : in std_logic;
      mux_ctrl : out std_logic_vector(1 downto 0);
      anode_ctrl : out std_logic_vector(3 downto 0);
      dp : out std_logic
  );
  end component;

  component clock_divider is
  port(
    clock, reset, set: in std_logic;
    factor : in integer;
    clock_out : out std_logic
  );
  end component;

  component mod_10_counter is
  port (
    clk_in,reset : in std_logic;
    S : in std_logic;
    digit : out std_logic_vector (3 downto 0));
  end component;

  component mod_6_counter is
  port (
    clk_in : in std_logic;
      reset : in std_logic;
      S : in std_logic;
      digit : out std_logic_vector (3 downto 0));
  end component;

  component seven_segment_decoder is
  port(
    digit_input : in std_logic_vector (3 downto 0);
    cathod_out : out std_logic_vector (6 downto 0));
  end component;

  component mux is
    Port ( ctr_ip : in STD_LOGIC_VECTOR (1 downto 0);
    digit1 : in STD_LOGIC_VECTOR (3 downto 0);
    digit2 : in STD_LOGIC_VECTOR (3 downto 0);
    digit3 : in STD_LOGIC_VECTOR (3 downto 0);
    digit4 : in STD_LOGIC_VECTOR (3 downto 0);
    digit_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

  signal clock_ms, clock_one_sec,clock_tens_sec,clock_min, S: std_logic;
  signal stop : std_logic := '1';
  signal mx_control : std_logic_vector(1 downto 0);
  signal digit0,digit1,digit2,digit3, seven_seg_digit : std_logic_vector (3 downto 0);
  signal clock_l : std_logic := '0';


begin
process (start,reset,pause,clock_main) is
begin

end process;
debounce_map : debouncer port map(clk=> clock_main,start => start,pause => pause,reset => reset,out_start => S,out_reset => stop);
display_map : display_decider port map (clk => clock_main, mux_ctrl => mx_control,anode_ctrl => anodes,dp => dp);

clk_ms_map : clock_divider port map(clock => clock_main,factor => 5000000,clock_out => clock_ms, reset => stop, set => S);
dig0_map : mod_10_counter port map(clk_in => clock_ms, S=> S, reset => stop, digit => digit0);

clk_one_sec_map : clock_divider port map (clock => clock_ms,factor => 5 ,clock_out => clock_one_sec, reset => stop, set => S);
dig1_map : mod_10_counter port map (clk_in => clock_one_sec, S=> S, reset=>stop, digit => digit1);

clock_tens_sec_map : clock_divider port map (clock => clock_one_sec,factor => 5,clock_out => clock_tens_sec, reset => stop, set => S);
dig2_map : mod_6_counter port map (clk_in => clock_tens_sec, S=> S, reset=>stop, digit => digit2);

clock_min_map : clock_divider port map (clock => clock_tens_sec,factor => 3,clock_out => clock_min, reset => stop, set => S);
dig3_map : mod_10_counter port map (clk_in => clock_min, S=> S, reset=>stop, digit => digit3);

muxMap : mux port map (ctr_ip => mx_control, digit1 => digit0, digit2 => digit1, digit3 => digit2, digit4 => digit3, digit_out => seven_seg_digit);
seven_segment_map : seven_segment_decoder port map (digit_input => seven_seg_digit, cathod_out => segment);

end beh;