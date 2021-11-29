
set_time_format -unit ns -decimal_places 3  			
create_clock -name {clk} -period 20.800 -waveform { 0.000 10.400 } [get_ports {clk}]

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
 		
set_false_path -from [get_ports {btn1 btn2}]  -to [get_clocks {clk}]
set_max_delay -from btn1_sync[0]  -to btn1_sync[1] 10.000
set_max_delay -from btn2_sync[0]  -to btn2_sync[1] 10.000

set_false_path -from [get_clocks {clk}] -to [get_ports {led1 led2}] 