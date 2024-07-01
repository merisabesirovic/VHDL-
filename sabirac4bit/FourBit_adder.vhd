----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:02 06/25/2024 
-- Design Name: 
-- Module Name:    FourBit_adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBit_adder is
port( 
X : in std_logic_vector(3 downto 0);
Y : in std_logic_vector(3 downto 0);
Cin : in std_logic;
Cout : out std_logic;
sum : out std_logic(3 downto 0)
);
end FourBit_adder;

architecture Behavioral of FourBit_adder is
signal carry : std_logic_vector(4 downto 0);
component sabirac4bit is port
( X : in std_logic;
  Y : in std_logic;
  Cin : in std_logic;
  Cout : out std_logic;
  sum : out std_logic
);
end component;

begin

carry(0) <= Cin;
sab1 : sabirac4bit port map (
X => X(0),
Y => Y(0),
Cin => carry(0),
Cout => carry(1),
sum => sum(0));

sab2 : sabirac4bit port map (
X => X(1),
Y => Y(1),
Cin => carry(1),
Cout => carry(2),
sum => sum(1));

sab3 : sabirac4bit port map (
X => X(2),
Y => Y(2),
Cin => carry(2),
Cout => carry(3),
sum => sum(2));

sab4 : sabirac4bit port map (
X => X(3),
Y => Y(3),
Cin => carry(3),
Cout => carry(4),
sum => sum(3));
Cout <= carry(4);
end Behavioral;

