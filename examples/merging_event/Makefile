
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv merging_event.sv

simulate:
	vsim -novopt work.tb -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
