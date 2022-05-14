library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port (
    iClk        : in std_logic;
    iReset      : in std_logic;

    oCount      : out std_logic_vector(23 downto 0);
    oOverflow   : out std_logic
);
end entity counter;

architecture rtl of counter is
    signal count    : std_logic_vector(oCount'range) := (others => '0');
    signal count_p1 : std_logic_vector(oCount'range);
begin

    oCount <= count;

    process (iClk)
    begin
        if rising_edge(iClk) then
            if iReset = '1' then
                count <= (others => '0');
            else
                count <= count_p1;
            end if;
        end if;
    end process;

    i_adder : entity work.add_bus(rtl)
    port map (
        iA      => count,
        iB      => (0 => '1', others => '0'),

        oSum    => count_p1,
        oCarry  => oOverflow
    );

end architecture rtl;