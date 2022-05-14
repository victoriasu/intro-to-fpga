library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder is
port (
    iA          : in std_logic;
    iB          : in std_logic;

    oSum        : out std_logic;
    oCarry      : out std_logic
);
end entity half_adder;

architecture rtl of half_adder is
begin
    
    oSum    <= iA xor iB;
    oCarry  <= iA and iB;

end architecture rtl;