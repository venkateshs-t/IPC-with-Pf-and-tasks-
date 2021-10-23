
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv fun_task.sv

simulate:
	vsim -novopt work.fun_task -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
