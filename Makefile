flash: ulx3s.bit
	openFPGALoader -b ulx3s ulx3s.bit

ulx3s.bit: ulx3s_out.config
	ecppack ulx3s_out.config ulx3s.bit

ulx3s_out.config: blinky.json
	nextpnr-ecp5 --85k --json blinky.json \
		--package CABGA381 \
		--lpf ulx3s_v318.lpf \
		--textcfg ulx3s_out.config

blinky.json: blinky.v blinky.ys
	yosys blinky.ys
