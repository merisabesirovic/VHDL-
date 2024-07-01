----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:27 06/27/2024 
-- Design Name: 
-- Module Name:    registerMapped - Behavioral 
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

entity registerMapped is 
port (
    iD     : in std_logic_vector(7 downto 0);
    iCLK   : in std_logic;
    iEN    : in std_logic;
    output : out std_logic_vector(7 downto 0)
);
end registerMapped;

architecture Behavioral of registerMapped is
    signal slow_clk : std_logic;

    component clock_divider is 
    port (
        CLK_IN  : in std_logic;
        CLK_OUT : out std_logic
    );
    end component;

    component register1bit is 
    port (
        iData  : in std_logic;  -- Promenjen naziv porta
        iEN    : in std_logic;
        iCLK   : in std_logic;
        oData  : out std_logic  -- Promenjen naziv porta
    );
    end component;

begin
    clk : clock_divider port map(
        CLK_IN  => iCLK,
        CLK_OUT => slow_clk
    );

    reg1 : register1bit port map(
        iData  => iD(0),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(0)
    );

    reg2 : register1bit port map(
        iData  => iD(1),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(1)
    );

    reg3 : register1bit port map(
        iData  => iD(2),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(2)
    );

    reg4 : register1bit port map(
        iData  => iD(3),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(3)
    );

    reg5 : register1bit port map(
        iData  => iD(4),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(4)
    );

    reg6 : register1bit port map(
        iData  => iD(5),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(5)
    );

    reg7 : register1bit port map(
        iData  => iD(6),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(6)
    );

    reg8 : register1bit port map(
        iData  => iD(7),
        iEN    => iEN,
        iCLK   => slow_clk,
        oData  => output(7)
    );

end Behavioral;
