----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:27 06/24/2024 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity shifter is
    port(
        iEN : in std_logic;
        iSEL1 : in std_logic;
        iSEL2 : in std_logic;
        iCLK : in std_logic;  -- Added clock signal
        output : out std_logic_vector(7 downto 0)
    );
end shifter;

architecture Behavioral of shifter is
    signal state : unsigned(2 downto 0) := (others => '0');
    signal OS : std_logic_vector(7 downto 0);
	 signal slow_clk : std_logic;
component clock_divider is
	port(
		CLK_IN: in std_logic;
		CLK_OUT: out std_logic
	);
end component;
begin
clk_divider: clock_divider port map(CLK_IN => iCLK, CLK_OUT => slow_clk);
process(slow_clk) 
    begin
        if rising_edge(slow_clk) then
            if (iEN = '1') then
                if (iSEL1 = '0') then
                    state <= state + 1;
                elsif (iSEL2 = '0') then
                    state <= state - 1;
                end if;
            end if;
        end if;
    end process;

    process(state)
    begin
        case state is
            when "000" => OS <= "00000001";
            when "001" => OS <= "00000010";
            when "010" => OS <= "00000100";
            when "011" => OS <= "00001000";
            when "100" => OS <= "00010000";
            when "101" => OS <= "00100000";
            when "110" => OS <= "01000000";
            when "111" => OS <= "10000000";
            when others => OS <= "00000000";
        end case;
    end process;

    output <= OS;
end Behavioral;
