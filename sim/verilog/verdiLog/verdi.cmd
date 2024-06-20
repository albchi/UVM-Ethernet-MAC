verdiSetActWin -dock widgetDock_<Message>
verdiWindowResize -win $_Verdi_1 "0" "0" "900" "700"
verdiWindowResize -win $_Verdi_1 "0" "0" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
simSetSimulator "-vcssv" -exec \
           "/home/sf10274/AlbertLand/0UVMgetinfo/lab-project-10gEthernetMAC/sim/verilog/simv" \
           -args "+vcs+lic+wait -a vcs.log"
debImport "-dbdir" \
          "/home/sf10274/AlbertLand/0UVMgetinfo/lab-project-10gEthernetMAC/sim/verilog/simv.daidir"
debLoadSimResult \
           /home/sf10274/AlbertLand/0UVMgetinfo/lab-project-10gEthernetMAC/sim/verilog/novas.fsdb
wvCreateWindow
srcHBSelect "tb.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "xgmii_txc" -line 86 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "xgmii_txd" -line 87 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
debExit
