library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_blink is
port (
    iClk        : in  std_logic;
    
    iSwitch     : in  std_logic;
    oLed        : out std_logic
);
end entity led_blink;

architecture rtl of led_blink is
    signal led_on   : std_logic := '0';
    signal overflow : std_logic;
begin

    oLed <= led_on;

    process (iClk)
    begin
        if rising_edge(iClk) then
            if overflow = '1' then
                led_on <= not led_on;
            end if;
        end if;
    end process;

    i_counter : entity work.counter(rtl)
    port map (
        iClk        => iClk,
        iReset      => iSwitch,

        oCount      => open,
        oOverflow   => overflow
    );

end architecture rtl;