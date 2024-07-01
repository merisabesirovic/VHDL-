library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithStruct is 
    port(
        ireg : in std_logic_vector(5 downto 0);
        iCLK : in std_logic;
        orez : out std_logic_vector(2 downto 0);
        oCarry : out std_logic;
        iEN : in std_logic
    );
end ArithStruct;

architecture Behavioral of ArithStruct is
    signal slow_clk : std_logic;
    signal oreg1 : std_logic_vector(2 downto 0);
    signal oreg2 : std_logic_vector(2 downto 0);
    signal cmpIn : std_logic_vector(2 downto 0) := "100";
    signal rez1 : std_logic_vector(2 downto 0);
    signal rez2 : std_logic_vector(2 downto 0);

    component clock_divider is 
        port(
            CLK_IN : in std_logic;
            CLK_OUT : out std_logic
        );
    end component;

    component register3bit is 
        port(
            iCLK : in std_logic;
            iEN : in std_logic;
            input : in std_logic_vector(2 downto 0);
            output : out std_logic_vector(2 downto 0)
        );
    end component;

    component adder3bit is 
        port(
            iOP1, iOP2 : in std_logic_vector(2 downto 0);
            carry : out std_logic;
            rezultat : out std_logic_vector(2 downto 0)
        );
    end component;

    component shifterLeft is 
        port(
            iA : in std_logic_vector(2 downto 0);
            iEN : in std_logic;
            oB : out std_logic_vector(2 downto 0)
        );
    end component;

    component comparator is 
        port(
            inA : in std_logic_vector(2 downto 0);
            inB : in std_logic_vector(2 downto 0);
            oREZ : out std_logic_vector(2 downto 0)
        );
    end component;

begin
    clock : clock_divider port map(
        CLK_IN => iCLK, 
        CLK_OUT => slow_clk
    );

    reg1 : register3bit port map (
        input => ireg(2 downto 0),
        iEN => iEN,
        iCLK => slow_clk,
        output => oreg1
    );

    reg2 : register3bit port map (
        input => ireg(5 downto 3),
        iEN => iEN,
        iCLK => slow_clk,
        output => oreg2
    );

    adder : adder3bit port map(
        iOP1 => oreg1,
        iOP2 => oreg2,
        carry => oCarry,
        rezultat => rez1
    );

    shifter : shifterLeft port map(
        iA => rez1,
        iEN => iEN,
        oB => rez2
    );

    comp : comparator port map(
        inA => rez2,
        inB => cmpIn,
        oREZ => orez
    );
end Behavioral;
