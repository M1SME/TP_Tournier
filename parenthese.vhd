library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
--------------------------------------
entity parenthese is 
	port (  A	: in integer range 0 to 7;
		B	: in integer range 0 to 7;
		C	: in integer range 0 to 7;
		D	: in integer range 0 to 7;
		S1	: out integer range 0 to 7;
		S2 	: out integer range 0 to 7);
end parenthese;
----------------------------------------
architecture test of parenthese is 

Begin

S1 <= A+B+C+B;
S2 <= (A+B) + (C+D);

end test;

