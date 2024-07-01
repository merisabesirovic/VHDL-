library ieee;
use ieee.std_logic_1164.all;
--2. 4 bit sabirac, ulazi jedan po jedan bit (napraviti component sabirac i port mapirati 4 puta). 
--ima 3 ulaza i 2 izlaza, potpuni sabirac, 2 predstavljaju bitove operanda a treci predstavlja prenos.
--treba da sabere 3 bita sa ulaza i na izlazu da kaze sumu. suma 3 bin broja moze
--da bude od 0 do 3 tako da izlaz sabirace predstavlja 2 bita.
entity sabirac4bit is
   port( 
        X, Y, Cin : in std_logic;      -- Input ports for two significant bits and carry-in bit
        sum, Cout : out std_logic      -- Output ports for sum and carry-out bit
   );
end sabirac4bit;
 
architecture bhv of sabirac4bit is
begin
   sum <= (X xor Y) xor Cin;     -- Calculate the sum bit
   Cout <= (X and (Y or Cin)) or (Cin and Y);  -- Calculate the carry-out bit
end bhv;
