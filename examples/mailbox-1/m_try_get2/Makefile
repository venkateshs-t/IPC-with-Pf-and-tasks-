
all:
	make clean; make compile; make simulate

compile:
	vlib work; vlog -sv m_try_get2.sv

simulate:
	vsim -novopt work.mailbox_ex -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
