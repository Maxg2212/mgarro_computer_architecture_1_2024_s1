transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/pc_control_unit.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/flopr.sv}

vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/TB_PC_CONTROL_UNIT.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_PC_CONTROL_UNIT

add wave *
view structure
view signals
run -all
