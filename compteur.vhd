library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.numeric_std;
use ieee.std_logic_unsigned.all;

entity compteur is
        port (clock, opt24, enable, init12 : in  std_logic;
              BCDu : out std_logic_vector (3 downto 0);
              BCDd : out std_logic_vector (3 downto 0)
	     );
    end entity;
    
architecture ar of compteur is

begin

	process(clock, enable)
	
	variable unit : std_logic_vector (3 downto 0) := "0000";
	variable diz : std_logic_vector (3 downto 0) := "0000";

	
	begin
	
	if(init12 = '1')
	then
	unit := "0010";
	diz := "0001";
	elsif(enable = '0')
	then
		unit := "0000";
		diz := "0000";
	elsif(clock'event and clock = '1')
	then
		unit := unit + '1';
		if(unit = "1010")
		then
			unit := "0000";
			diz := diz + '1';
		end if;
		if(opt24 = '1' and diz = "0010" and unit = "0100")
		then
			unit := "0000";
			diz := "0000";
			elsif(opt24 = '0' and diz = "0001" and unit = "0011")
				then
					unit := "0001";
					diz := "0000";
		end if;
		
	end if;
		
	BCDu <= unit;
	BCDd <= diz;
			
	end process;
	
	

end ar;
