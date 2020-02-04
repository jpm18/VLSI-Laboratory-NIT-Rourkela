#
# ASIC_DESIGN_LAB EC 6272
# File: Master constraints file
# Description: This file specify all the clock related constraints and it invoke the other constrains 
#              using read_sdc command from separate files.
# Instructors Evaluation
#-------------------------------------------------------------------------------------------------------

##############################################################################
#                                                                            #
#                            CLOCK DEFINITION                                #
#                                                                            #
##############################################################################


set EXTCLK "clk" ;
set_units -time 1.0ns ;

set_units -capacitance 1.0pF ;
set EXTCLK_PERIOD 10.0;

create_clock -name     "$EXTCLK" -period  "$EXTCLK_PERIOD"  -waveform "0 [expr $EXTCLK_PERIOD/2]" [get_ports clk]

set SKEW 0.200                                                                                                   

set_clock_uncertainty $SKEW [get_clocks $EXTCLK]


set MINRISE 0.20

set MAXRISE 0.25

set MINFALL 0.20 

set MAXFALL 0.25

set_clock_transition -rise -min  $MINRISE [get_clocks $EXTCLK]
set_clock_transition -rise -max  $MAXRISE [get_clocks $EXTCLK]
set_clock_transition -fall -min  $MINFALL [get_clocks $EXTCLK]
set_clock_transition -fall -max  $MAXFALL [get_clocks $EXTCLK]


##############################################################################
#                                                                            #
#                            DELAY DEFINITION                                #
#                                                                            #
##############################################################################


set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports en]
set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports reset]
set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports syn_clr]

set_output_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports q]

##set_operating_conditions WCCOM


set_max_capacitance 0.5 [all_outputs]

##set_min_capacitance 0.05 [all_inputs]

set_max_fanout 10 [all_inputs]

##set_max_transition 0.5 EXTCLK/q


