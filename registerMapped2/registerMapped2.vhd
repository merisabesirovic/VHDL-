----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:46 06/27/2024 
-- Design Name: 
-- Module Name:    registerMapped2 - Behavioral 
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

entity registerMapped2 is port
(
iD : in std_logic_vector(7 downto 0);
output : out std_logic_vector(7 downto 0);
iCLK : in std_logic;
iEN : in std_logic);
end registerMapped2;

architecture Behavioral of registerMapped2 is
signal slow_clk : std_logic;
component clock_divider is port(
CLK_IN : in std_logic; CLK_OUT : out std_logic);
end component;

component register1bit is port(
input : in std_logic_vector(1 downto 0);
iEN : in std_logic;
iCLK : in std_logic;
outp : out std_logic_vector(1 downto 0));
end component;
begin
clk : clock_divider port map(CLK_IN => iCLK, CLK_OUT => slow_clk);
reg1 : register1bit port map 
( input => iD(1 downto 0),
  iEN => iEN,
  iCLK => slow_clk,
  outp => output(1 downto 0));
  
 reg2 : register1bit port map 
( input => iD(3 downto 2),
  iEN => iEN,
  iCLK => slow_clk,
  outp => output(3 downto 2));
  
 reg3 : register1bit port map 
( input => iD(5 downto 4),
  iEN => iEN,
  iCLK => slow_clk,
  outp => output(5 downto 4));
  
 reg4 : register1bit port map 
( input => iD(7 downto 6),
  iEN => iEN,
  iCLK => slow_clk,
  outp => output(7 downto 6));

end Behavioral;

