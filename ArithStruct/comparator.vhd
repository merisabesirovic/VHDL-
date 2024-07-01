----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:31 06/28/2024 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

entity comparator is port(
inA : in std_logic_vector(2 downto 0);
inB : in std_logic_vector(2 downto 0);
oREZ : out std_logic_vector(2 downto 0));
end comparator;

architecture Behavioral of comparator is
begin
process(inA, inB) begin
	if(inA > inB) then 	
		oREZ <= "100";
	elsif(inA < inB) then
		oREZ <= "010";
	else 
	 oREZ <= "001";
	 end if;
	end process;
end Behavioral;

