library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register3bit is 
    port (
        iCLK : in std_logic;
        iEN : in std_logic;
        input : in std_logic_vector(2 downto 0);
        output : out std_logic_vector(2 downto 0)
    );
end register3bit;

architecture Behavioral of register3bit is
begin
    process(iCLK) 
    begin
        if rising_edge(iCLK) then
            if iEN = '1' then
                output <= input;
            end if;
        end if;
    end process;
end Behavioral;
