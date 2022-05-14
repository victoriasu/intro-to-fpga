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
begin

    oLed <= led_on;

    process (iClk)
    begin
        if rising_edge(iClk) then
            -- Currently the LED is set to always off
            -- How can we use the switch to decide when to turn it on?
            led_on <= '0';
        end if;
    end process;

end architecture rtl;