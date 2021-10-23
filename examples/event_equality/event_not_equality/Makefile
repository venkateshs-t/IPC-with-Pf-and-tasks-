
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv event_not_equality.sv

simulate:
	vsim -novopt work.event_equality -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
