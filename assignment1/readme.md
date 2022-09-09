## Problem Description
***
In this assignment we had to construct a stopwatch
in basys 3 board. Display format of the clock will be (M:SS:T): minutes (M) on one LED display, seconds (SS) on two LED
displays and tenth of second (T) on one LED display. 

## Approach
***
The subproblems that had to be taken care of while making a stopwatch were as follows:
1. How do we decide which digit has to be displayed on which seven segments of the 
display?
2. Once we decide the digit to be displayed, how do we use mux and clock to 
continuously displaying 4 different digits on 4 different seven segments, since all 
of them are active only by one anode?
3. How do we pause and reset our clock?

We made 2 modulo counter `mod_10_counter` and `mod_6_counter` for generating the digits. which will generate the respective digit when the clock of appropriate frequecy is passed as an input. For generating the clock of required frequency we had created the `clock_divider` module.

We had created a module `display_decider` which will decide which digit will shown on the display. Ones the digit will be decided we will pass it through the `seven_segment_display` module to display which is constructed using the combinational logic.

### Circuit Diagram :
![Circuit diagram](/assignment1/circuit_diagram.png)