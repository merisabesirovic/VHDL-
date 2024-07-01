----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:55 06/28/2024 
-- Design Name: 
-- Module Name:    shifterLeft - Behavioral 
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

entity shifterLeft is port(
iA : in std_logic_vector(2 downto 0);
iEN : in std_logic;
oB : out std_logic_vector(2 downto 0));
end shifterLeft;

architecture Behavioral of shifterLeft is
 begin 
		process(iEN) begin
		if(iEN = '1') then
			oB <= (iA(1 downto 0) & '0');
		end if;
	end process;
end Behavioral;

