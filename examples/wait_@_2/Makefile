
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv wait_ex.sv

simulate:
	vsim -novopt work.e1 -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
