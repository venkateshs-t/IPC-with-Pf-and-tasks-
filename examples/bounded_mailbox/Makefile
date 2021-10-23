
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv bounded_mailbox.sv

simulate:
	vsim -novopt work.bounded_mailbox -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
