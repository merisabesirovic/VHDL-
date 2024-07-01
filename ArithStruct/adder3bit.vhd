----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:38 06/28/2024 
-- Design Name: 
-- Module Name:    adder3bit - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Dodato za podršku aritmetickim operacijama

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder3bit is  
    port(
        iOP1, iOP2 : in std_logic_vector(2 downto 0);
        carry : out std_logic;
        rezultat : out std_logic_vector(2 downto 0)
    );
end adder3bit;

architecture Behavioral of adder3bit is
begin
    process(iOP1, iOP2)
    variable s : std_logic_vector(3 downto 0);
    begin
        s := ('0' & iOP1) + ('0' & iOP2);
        carry <= s(3);
        rezultat <= s(2 downto 0);
    end process;
end Behavioral;
