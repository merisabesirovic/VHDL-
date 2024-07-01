library ieee;
use ieee.std_logic_1164.all;

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
