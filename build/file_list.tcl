#add constraints
add_files -fileset constrs_1 -norecurse ./constraints/pinout.xdc

#add source
add_files ../source/qwi00_led.sv
add_files ../source/led_indicate.sv
