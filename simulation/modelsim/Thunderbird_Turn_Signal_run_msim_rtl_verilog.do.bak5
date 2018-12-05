transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/USER1/Digital\ Logic/Thunderbird_Turn_Signal {C:/Users/USER1/Digital Logic/Thunderbird_Turn_Signal/ped_flip_flop.v}
vlog -vlog01compat -work work +incdir+C:/Users/USER1/Digital\ Logic/Thunderbird_Turn_Signal {C:/Users/USER1/Digital Logic/Thunderbird_Turn_Signal/gated_d_latch.v}
vlog -vlog01compat -work work +incdir+C:/Users/USER1/Digital\ Logic/Thunderbird_Turn_Signal {C:/Users/USER1/Digital Logic/Thunderbird_Turn_Signal/Thunderbird_Turn_Signal.v}

vlog -vlog01compat -work work +incdir+C:/Users/USER1/Digital\ Logic/Thunderbird_Turn_Signal {C:/Users/USER1/Digital Logic/Thunderbird_Turn_Signal/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
