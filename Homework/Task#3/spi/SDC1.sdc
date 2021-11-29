set_time_format -unit ns -decimal_places 3
create_clock -name {CLK} -period 20.800 -waveform { 0.000 10.400 } [get_ports {CLK}]
create_generated_clock -divide_by 2097152 -source [get_ports CLK] -name sclk [get_registers sclk]
create_generated_clock -divide_by 16 -source [get_ports sclk] -name counter_clk [get_registers counter_clk] 
create_generated_clock -divide_by 4096 -source [get_ports CLK] -name display_clk [get_registers display_clk]

#set_clock_uncertainty -rise_from [get_ports {CLK sclk counter_cl display_clk}] -rise_to [get_ports {CLK sclk counter_cl display_clk}] 0.020
#set_clock_uncertainty -rise_from [get_ports {CLK sclk counter_cl display_clk}] -fall_to [get_ports {CLK sclk counter_cl display_clk}] 0.020
#set_clock_uncertainty -fall_from [get_ports {CLK sclk counter_cl display_clk}] -rise_to [get_ports {CLK sclk counter_cl display_clk}] 0.020
#set_clock_uncertainty -fall_from [get_ports {CLK sclk counter_cl display_clk}] -fall_to [get_ports {CLK sclk counter_cl display_clk}] 0.020

set_clock_uncertainty -rise_from [get_ports {CLK}] -rise_to [get_ports {CLK}] 0.020
set_clock_uncertainty -rise_from [get_ports {CLK}] -fall_to [get_ports {CLK}] 0.020
set_clock_uncertainty -fall_from [get_ports {CLK}] -rise_to [get_ports {CLK}] 0.020
set_clock_uncertainty -fall_from [get_ports {CLK}] -fall_to [get_ports {CLK}] 0.020

set_false_path -from [get_ports {KEY1}]  -to [get_clocks {CLK}]
set_max_delay -from reset_sync[0]  -to reset_sync[1] 10.000

set_false_path -to [get_ports {DS_A DS_B DS_C DS_D DS_E DS_F DS_G DS_DP DS_EN1 DS_EN2 DS_EN3 DS_EN4}]