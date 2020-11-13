    Library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_textio.all;
    use std.textio.all;
    -------------------------------------------------
    entity ressource is
        port (A : in integer range 0 to 7 ;
              B : in integer range 0 to 7;
          C : in integer range 0 to 7;
          s : in std_logic;
          S1 : out integer range 0 to 7;
          S2: out integer range 0 to 7);
     
    end ressource;
    -------------------------------------------------
    architecture synthese of ressource is
    begin
    -------------------------------------------------
        partage_interdit : process (A,B,C)
        variable op1,op2: integer range 0 to 7;
     
            begin
            op1:= A+B;
            op2:= A+C;
            if s='1' then
                S1 <= op1;
            else
                S1 <= op2;
            end if;
     
        end process partage_interdit;
    -------------------------------------------------
        partage_force : process (A,B,C)
        variable op1,op2: integer range 0 to 7;
     
            begin
            if s='1' then
                op1:= A;
                op2:= B;
            else
                op1:= A;
                op2:= C;
            end if;
            S2 <= op1+op2;
     
        end process partage_force;
    -------------------------------------------------
     
    end synthese;

