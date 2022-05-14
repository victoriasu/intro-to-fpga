library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is the top of our design
entity top is
port (
    -- These are ports that connect to pins on the FPGA (see the constraints file for the pin mapping)
    GCLK : in  std_logic;

    SW   : in  std_logic_vector(7 downto 0);
    LED  : out std_logic_vector(7 downto 0)
);
end entity top;

architecture rtl of top is
begin

    -- For each of our 8 LEDs, create an LED control module
	g_led_controllers : for i in led'range generate
	
		i_led_controller : entity work.led_control(rtl)
		port map (
			clk     => GCLK,
			switch  => SW(i),
			led     => LED(i)
		);

	end generate;
  
end rtl;
