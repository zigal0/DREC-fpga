set_time_format -unit ns -decimal_places 3  		
create_clock -name {clk} -period 20.800 -waveform { 0.000 10.400 } [get_ports {clk}]
create_generated_clock -divide_by 4 -source [get_ports clk] -name clk2 [get_registers clk2]

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  

 