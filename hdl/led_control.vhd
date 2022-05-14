library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_control is
port (
    iClk        : in  std_logic;
    
    iSwitch     : in  std_logic;
    oLed        : out std_logic
);
end entity led_control;

architecture rtl of led_control is
    signal led_on   : std_logic := '0';
    signal overflow : std_logic;
begin

    process (iClk)
    begin
        if rising_edge(iClk) then
            -- Currently the LED is set to always off (led_on := 0)
            -- How can we use the switch to decide when to turn it on?
            oLed <= led_on;

            -- Bonus points: how can we make the LED flash using the overflow signal from the counter below?
        end if;
    end process;

    i_counter : entity work.counter(rtl)
    port map (
        iClk        => iClk,
        iReset      => iSwitch,

        oCount      => open,
        oOverflow   => overflow
    )

end architecture rtl;