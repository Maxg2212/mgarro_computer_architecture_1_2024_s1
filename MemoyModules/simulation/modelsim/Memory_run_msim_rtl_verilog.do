transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/pc_control_unit.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/regfile.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/flopr.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/alu_defs.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/clock_manager.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/clockDivider.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/control_unit.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/mux2.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/segment_if_id.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/segment_ex_mem.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/segment_id_ex.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/segment_mem_wb.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/extend.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/datapath.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/pipelined_processor.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/top.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/P_ROM.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/P_RAM.sv}
vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/alu.sv}

vlog -sv -work work +incdir+C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/TB_TOP.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_TOP

add wave *
view structure
view signals
run -all
