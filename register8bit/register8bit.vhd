----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:43 06/25/2024 
-- Design Name: 
-- Module Name:    register8bit - Behavioral 
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
-- 8 bit registar, iLOAD dozvola za upis kada je 1,
 --ulaz aData za smestanje, ako je iLOAD na 0 treba da se pomera u zavisnosti 
 --od sledecih kontrola, shiftleft, shiftright, aritmeticko kolo(definise da li je pomeranje 
 --aritmeticko(kada je na 0) ili logicko (kada je na 1)) ako su i shiftleft i shiftright ukljuceni, stoji u mestu.

entity register8bit is
port(
iCLK : in std_logic;
iLOAD : in std_logic;
aData : in std_logic_vector(3 downto 0);
shiftleft : in std_logic;
shiftright : in std_logic;
shift : in std_logic;
output : out std_logic_vector(3 downto 0)
);
end register8bit;

architecture Behavioral of register8bit is
signal state : std_logic_vector(3 downto 0);
signal slow_clk : std_logic;
component clock_divider is port(
CLK_IN : in std_logic;
CLK_OUT : out std_logic);
end component;
begin
clk : clock_divider port map (CLK_IN => iCLK, CLK_OUT => slow_clk);
process(slow_clk) begin
		if(rising_edge(slow_clk)) then
				if(iLOAD = '1') then
						state <= aData;
				else 
						if(shiftleft = '1' and shiftright = '1') then
							state <= state;
						elsif (shiftleft = '1') then
								if(shift = '1') then 
									state<=(state(2 downto 0) & '0');
								else 
									state <=(state(2 downto 0) & state(2));
									end if;
						elsif (shiftright = '1') then
								if(shift = '1') then
									state <= ('0' & state(3 downto 1));
								else 
								state <= (state(3) & state(3 downto 1));
								end if;
						else 
							state <= state;
						end if;
					end if;
				end if;
		
		end process;
	output <= state;

end Behavioral;

