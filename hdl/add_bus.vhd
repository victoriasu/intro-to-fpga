library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_bus is
port (
    iA      : in std_logic_vector(23 downto 0);
    iB      : in std_logic_vector(23 downto 0);

    oSum    : out std_logic_vector(23 downto 0);
    oCarry  : out std_logic
);
end entity add_bus;

architecture rtl of add_bus is
    signal carry_out : std_logic_vector (oSum'range);
    signal carry_in  : std_logic_vector (oSum'range);
begin

    carry_in(0) <= '0';
    oCarry      <= carry_out(carry_out'high);
    
    g_adders : for i in oSum'range generate

        i_full_adder : entity work.full_adder(rtl)
        port map (
            iA      => iA(i),
            iB      => iB(i),
            iCarry  => carry_in(i),

            oSum    => oSum(i),
            oCarry  => carry_out(i)
        );

        g_carry_connections : if i > 0 generate
            carry_in(i) <= carry_out(i - 1);
        end generate;
        
    end generate;

end architecture rtl;