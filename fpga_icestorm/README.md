to gen a pll via icestorm project
icepll -i 100 -o 30
bzw als verilog File
icepll -i 100 -o 30 -m -f pll.v

F_PLLIN:   100.000 MHz (given)
F_PLLOUT:   30.000 MHz (requested)
F_PLLOUT:   30.000 MHz (achieved)

FEEDBACK: SIMPLE
F_PFD:   20.000 MHz
F_VCO:  960.000 MHz

DIVR:  4 (4'b0100)
DIVF: 47 (7'b0101111)
DIVQ:  5 (3'b101)

FILTER_RANGE: 2 (3'b010)
