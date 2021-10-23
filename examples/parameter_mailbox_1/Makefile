
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv Parameterized_mailbox.sv

simulate:
	vsim -novopt work.Parameterized_mailbox -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
