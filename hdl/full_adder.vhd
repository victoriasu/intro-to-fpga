library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
port (
    iA          : in std_logic;
    iB          : in std_logic;
    iCarry      : in std_logic;

    oSum        : out std_logic;
    oCarry      : out std_logic
);
end entity full_adder;

architecture rtl of full_adder is
    signal a_b_sum              : std_logic;
    signal a_b_carry            : std_logic;
    signal carry_sum_carry_out  : std_logic;
begin
    
    i_sum_a_b : entity work.half_adder(rtl)
    port map (
        iA          => iA,
        iB          => iB,

        oSum        => a_b_sum,
        oCarry      => a_b_carry
    );

    i_sum_carry : entity work.half_adder(rtl)
    port map (
        iA          => a_b_sum,
        iB          => iCarry,

        oSum        => oSum,
        oCarry      => carry_sum_carry_out
    );

    oCarry <= carry_sum_carry_out or a_b_carry;

end architecture rtl;