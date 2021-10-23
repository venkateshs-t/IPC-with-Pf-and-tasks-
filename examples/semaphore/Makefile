
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv semaphores.sv

simulate:
	vsim -novopt work.main -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
