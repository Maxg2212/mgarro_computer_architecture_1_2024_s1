transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/maxga/OneDrive/Documentos/Proyectos_Arqui/mgarro_computer_architecture_1_2024_s1/MemoyModules/ROM.vhd}

