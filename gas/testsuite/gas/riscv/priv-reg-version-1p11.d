#as: -march=rv32if -mpriv-spec=1.11
#source: priv-reg.s
#objdump: -dr -Mpriv-spec=1.11

.*:[  	]+file format .*


Disassembly of section .text:

0+000 <.text>:
[     	]+[0-9a-f]+:[  	]+00002573[    	]+csrr[        	]+a0,ustatus
[     	]+[0-9a-f]+:[  	]+00402573[    	]+csrr[        	]+a0,uie
[     	]+[0-9a-f]+:[  	]+00502573[    	]+csrr[        	]+a0,utvec
[     	]+[0-9a-f]+:[  	]+04002573[    	]+csrr[        	]+a0,uscratch
[     	]+[0-9a-f]+:[  	]+04102573[    	]+csrr[        	]+a0,uepc
[     	]+[0-9a-f]+:[  	]+04202573[    	]+csrr[        	]+a0,ucause
[     	]+[0-9a-f]+:[  	]+04302573[    	]+csrr[        	]+a0,utval
[     	]+[0-9a-f]+:[  	]+04402573[    	]+csrr[        	]+a0,uip
[     	]+[0-9a-f]+:[  	]+c0002573[    	]+rdcycle[     	]+a0
[     	]+[0-9a-f]+:[  	]+c0102573[    	]+rdtime[      	]+a0
[     	]+[0-9a-f]+:[  	]+c0202573[    	]+rdinstret[   	]+a0
[     	]+[0-9a-f]+:[  	]+c0302573[    	]+csrr[        	]+a0,hpmcounter3
[     	]+[0-9a-f]+:[  	]+c0402573[    	]+csrr[        	]+a0,hpmcounter4
[     	]+[0-9a-f]+:[  	]+c0502573[    	]+csrr[        	]+a0,hpmcounter5
[     	]+[0-9a-f]+:[  	]+c0602573[    	]+csrr[        	]+a0,hpmcounter6
[     	]+[0-9a-f]+:[  	]+c0702573[    	]+csrr[        	]+a0,hpmcounter7
[     	]+[0-9a-f]+:[  	]+c0802573[    	]+csrr[        	]+a0,hpmcounter8
[     	]+[0-9a-f]+:[  	]+c0902573[    	]+csrr[        	]+a0,hpmcounter9
[     	]+[0-9a-f]+:[  	]+c0a02573[    	]+csrr[        	]+a0,hpmcounter10
[     	]+[0-9a-f]+:[  	]+c0b02573[    	]+csrr[        	]+a0,hpmcounter11
[     	]+[0-9a-f]+:[  	]+c0c02573[    	]+csrr[        	]+a0,hpmcounter12
[     	]+[0-9a-f]+:[  	]+c0d02573[    	]+csrr[        	]+a0,hpmcounter13
[     	]+[0-9a-f]+:[  	]+c0e02573[    	]+csrr[        	]+a0,hpmcounter14
[     	]+[0-9a-f]+:[  	]+c0f02573[    	]+csrr[        	]+a0,hpmcounter15
[     	]+[0-9a-f]+:[  	]+c1002573[    	]+csrr[        	]+a0,hpmcounter16
[     	]+[0-9a-f]+:[  	]+c1102573[    	]+csrr[        	]+a0,hpmcounter17
[     	]+[0-9a-f]+:[  	]+c1202573[    	]+csrr[        	]+a0,hpmcounter18
[     	]+[0-9a-f]+:[  	]+c1302573[    	]+csrr[        	]+a0,hpmcounter19
[     	]+[0-9a-f]+:[  	]+c1402573[    	]+csrr[        	]+a0,hpmcounter20
[     	]+[0-9a-f]+:[  	]+c1502573[    	]+csrr[        	]+a0,hpmcounter21
[     	]+[0-9a-f]+:[  	]+c1602573[    	]+csrr[        	]+a0,hpmcounter22
[     	]+[0-9a-f]+:[  	]+c1702573[    	]+csrr[        	]+a0,hpmcounter23
[     	]+[0-9a-f]+:[  	]+c1802573[    	]+csrr[        	]+a0,hpmcounter24
[     	]+[0-9a-f]+:[  	]+c1902573[    	]+csrr[        	]+a0,hpmcounter25
[     	]+[0-9a-f]+:[  	]+c1a02573[    	]+csrr[        	]+a0,hpmcounter26
[     	]+[0-9a-f]+:[  	]+c1b02573[    	]+csrr[        	]+a0,hpmcounter27
[     	]+[0-9a-f]+:[  	]+c1c02573[    	]+csrr[        	]+a0,hpmcounter28
[     	]+[0-9a-f]+:[  	]+c1d02573[    	]+csrr[        	]+a0,hpmcounter29
[     	]+[0-9a-f]+:[  	]+c1e02573[    	]+csrr[        	]+a0,hpmcounter30
[     	]+[0-9a-f]+:[  	]+c1f02573[    	]+csrr[        	]+a0,hpmcounter31
[     	]+[0-9a-f]+:[  	]+c8002573[    	]+rdcycleh[    	]+a0
[     	]+[0-9a-f]+:[  	]+c8102573[    	]+rdtimeh[     	]+a0
[     	]+[0-9a-f]+:[  	]+c8202573[    	]+rdinstreth[  	]+a0
[     	]+[0-9a-f]+:[  	]+c8302573[    	]+csrr[        	]+a0,hpmcounter3h
[     	]+[0-9a-f]+:[  	]+c8402573[    	]+csrr[        	]+a0,hpmcounter4h
[     	]+[0-9a-f]+:[  	]+c8502573[    	]+csrr[        	]+a0,hpmcounter5h
[     	]+[0-9a-f]+:[  	]+c8602573[    	]+csrr[        	]+a0,hpmcounter6h
[     	]+[0-9a-f]+:[  	]+c8702573[    	]+csrr[        	]+a0,hpmcounter7h
[     	]+[0-9a-f]+:[  	]+c8802573[    	]+csrr[        	]+a0,hpmcounter8h
[     	]+[0-9a-f]+:[  	]+c8902573[    	]+csrr[        	]+a0,hpmcounter9h
[     	]+[0-9a-f]+:[  	]+c8a02573[    	]+csrr[        	]+a0,hpmcounter10h
[     	]+[0-9a-f]+:[  	]+c8b02573[    	]+csrr[        	]+a0,hpmcounter11h
[     	]+[0-9a-f]+:[  	]+c8c02573[    	]+csrr[        	]+a0,hpmcounter12h
[     	]+[0-9a-f]+:[  	]+c8d02573[    	]+csrr[        	]+a0,hpmcounter13h
[     	]+[0-9a-f]+:[  	]+c8e02573[    	]+csrr[        	]+a0,hpmcounter14h
[     	]+[0-9a-f]+:[  	]+c8f02573[    	]+csrr[        	]+a0,hpmcounter15h
[     	]+[0-9a-f]+:[  	]+c9002573[    	]+csrr[        	]+a0,hpmcounter16h
[     	]+[0-9a-f]+:[  	]+c9102573[    	]+csrr[        	]+a0,hpmcounter17h
[     	]+[0-9a-f]+:[  	]+c9202573[    	]+csrr[        	]+a0,hpmcounter18h
[     	]+[0-9a-f]+:[  	]+c9302573[    	]+csrr[        	]+a0,hpmcounter19h
[     	]+[0-9a-f]+:[  	]+c9402573[    	]+csrr[        	]+a0,hpmcounter20h
[     	]+[0-9a-f]+:[  	]+c9502573[    	]+csrr[        	]+a0,hpmcounter21h
[     	]+[0-9a-f]+:[  	]+c9602573[    	]+csrr[        	]+a0,hpmcounter22h
[     	]+[0-9a-f]+:[  	]+c9702573[    	]+csrr[        	]+a0,hpmcounter23h
[     	]+[0-9a-f]+:[  	]+c9802573[    	]+csrr[        	]+a0,hpmcounter24h
[     	]+[0-9a-f]+:[  	]+c9902573[    	]+csrr[        	]+a0,hpmcounter25h
[     	]+[0-9a-f]+:[  	]+c9a02573[    	]+csrr[        	]+a0,hpmcounter26h
[     	]+[0-9a-f]+:[  	]+c9b02573[    	]+csrr[        	]+a0,hpmcounter27h
[     	]+[0-9a-f]+:[  	]+c9c02573[    	]+csrr[        	]+a0,hpmcounter28h
[     	]+[0-9a-f]+:[  	]+c9d02573[    	]+csrr[        	]+a0,hpmcounter29h
[     	]+[0-9a-f]+:[  	]+c9e02573[    	]+csrr[        	]+a0,hpmcounter30h
[     	]+[0-9a-f]+:[  	]+c9f02573[    	]+csrr[        	]+a0,hpmcounter31h
[     	]+[0-9a-f]+:[  	]+10002573[    	]+csrr[        	]+a0,sstatus
[     	]+[0-9a-f]+:[  	]+10202573[    	]+csrr[        	]+a0,sedeleg
[     	]+[0-9a-f]+:[  	]+10302573[    	]+csrr[        	]+a0,sideleg
[     	]+[0-9a-f]+:[  	]+10402573[    	]+csrr[        	]+a0,sie
[     	]+[0-9a-f]+:[  	]+10502573[    	]+csrr[        	]+a0,stvec
[     	]+[0-9a-f]+:[  	]+10602573[    	]+csrr[        	]+a0,scounteren
[     	]+[0-9a-f]+:[  	]+14002573[    	]+csrr[        	]+a0,sscratch
[     	]+[0-9a-f]+:[  	]+14102573[    	]+csrr[        	]+a0,sepc
[     	]+[0-9a-f]+:[  	]+14202573[    	]+csrr[        	]+a0,scause
[     	]+[0-9a-f]+:[  	]+14302573[    	]+csrr[        	]+a0,stval
[     	]+[0-9a-f]+:[  	]+14402573[    	]+csrr[        	]+a0,sip
[     	]+[0-9a-f]+:[  	]+18002573[    	]+csrr[        	]+a0,satp
[     	]+[0-9a-f]+:[  	]+54602573[    	]+csrr[        	]+a0,sentropy
[     	]+[0-9a-f]+:[  	]+f1102573[    	]+csrr[        	]+a0,mvendorid
[     	]+[0-9a-f]+:[  	]+f1202573[    	]+csrr[        	]+a0,marchid
[     	]+[0-9a-f]+:[  	]+f1302573[    	]+csrr[        	]+a0,mimpid
[     	]+[0-9a-f]+:[  	]+f1402573[    	]+csrr[        	]+a0,mhartid
[     	]+[0-9a-f]+:[  	]+f1502573[    	]+csrr[        	]+a0,mnoise
[     	]+[0-9a-f]+:[  	]+30002573[    	]+csrr[        	]+a0,mstatus
[     	]+[0-9a-f]+:[  	]+30102573[    	]+csrr[        	]+a0,misa
[     	]+[0-9a-f]+:[  	]+30202573[    	]+csrr[        	]+a0,medeleg
[     	]+[0-9a-f]+:[  	]+30302573[    	]+csrr[        	]+a0,mideleg
[     	]+[0-9a-f]+:[  	]+30402573[    	]+csrr[        	]+a0,mie
[     	]+[0-9a-f]+:[  	]+30502573[    	]+csrr[        	]+a0,mtvec
[     	]+[0-9a-f]+:[  	]+30602573[    	]+csrr[        	]+a0,mcounteren
[     	]+[0-9a-f]+:[  	]+34002573[    	]+csrr[        	]+a0,mscratch
[     	]+[0-9a-f]+:[  	]+34102573[    	]+csrr[        	]+a0,mepc
[     	]+[0-9a-f]+:[  	]+34202573[    	]+csrr[        	]+a0,mcause
[     	]+[0-9a-f]+:[  	]+34302573[    	]+csrr[        	]+a0,mtval
[     	]+[0-9a-f]+:[  	]+34402573[    	]+csrr[        	]+a0,mip
[     	]+[0-9a-f]+:[  	]+3a002573[    	]+csrr[        	]+a0,pmpcfg0
[     	]+[0-9a-f]+:[  	]+3a102573[    	]+csrr[        	]+a0,pmpcfg1
[     	]+[0-9a-f]+:[  	]+3a202573[    	]+csrr[        	]+a0,pmpcfg2
[     	]+[0-9a-f]+:[  	]+3a302573[    	]+csrr[        	]+a0,pmpcfg3
[     	]+[0-9a-f]+:[  	]+3b002573[    	]+csrr[        	]+a0,pmpaddr0
[     	]+[0-9a-f]+:[  	]+3b102573[    	]+csrr[        	]+a0,pmpaddr1
[     	]+[0-9a-f]+:[  	]+3b202573[    	]+csrr[        	]+a0,pmpaddr2
[     	]+[0-9a-f]+:[  	]+3b302573[    	]+csrr[        	]+a0,pmpaddr3
[     	]+[0-9a-f]+:[  	]+3b402573[    	]+csrr[        	]+a0,pmpaddr4
[     	]+[0-9a-f]+:[  	]+3b502573[    	]+csrr[        	]+a0,pmpaddr5
[     	]+[0-9a-f]+:[  	]+3b602573[    	]+csrr[        	]+a0,pmpaddr6
[     	]+[0-9a-f]+:[  	]+3b702573[    	]+csrr[        	]+a0,pmpaddr7
[     	]+[0-9a-f]+:[  	]+3b802573[    	]+csrr[        	]+a0,pmpaddr8
[     	]+[0-9a-f]+:[  	]+3b902573[    	]+csrr[        	]+a0,pmpaddr9
[     	]+[0-9a-f]+:[  	]+3ba02573[    	]+csrr[        	]+a0,pmpaddr10
[     	]+[0-9a-f]+:[  	]+3bb02573[    	]+csrr[        	]+a0,pmpaddr11
[     	]+[0-9a-f]+:[  	]+3bc02573[    	]+csrr[        	]+a0,pmpaddr12
[     	]+[0-9a-f]+:[  	]+3bd02573[    	]+csrr[        	]+a0,pmpaddr13
[     	]+[0-9a-f]+:[  	]+3be02573[    	]+csrr[        	]+a0,pmpaddr14
[     	]+[0-9a-f]+:[  	]+3bf02573[    	]+csrr[        	]+a0,pmpaddr15
[     	]+[0-9a-f]+:[  	]+b0002573[    	]+csrr[        	]+a0,mcycle
[     	]+[0-9a-f]+:[  	]+b0202573[    	]+csrr[        	]+a0,minstret
[     	]+[0-9a-f]+:[  	]+b0302573[    	]+csrr[        	]+a0,mhpmcounter3
[     	]+[0-9a-f]+:[  	]+b0402573[    	]+csrr[        	]+a0,mhpmcounter4
[     	]+[0-9a-f]+:[  	]+b0502573[    	]+csrr[        	]+a0,mhpmcounter5
[     	]+[0-9a-f]+:[  	]+b0602573[    	]+csrr[        	]+a0,mhpmcounter6
[     	]+[0-9a-f]+:[  	]+b0702573[    	]+csrr[        	]+a0,mhpmcounter7
[     	]+[0-9a-f]+:[  	]+b0802573[    	]+csrr[        	]+a0,mhpmcounter8
[     	]+[0-9a-f]+:[  	]+b0902573[    	]+csrr[        	]+a0,mhpmcounter9
[     	]+[0-9a-f]+:[  	]+b0a02573[    	]+csrr[        	]+a0,mhpmcounter10
[     	]+[0-9a-f]+:[  	]+b0b02573[    	]+csrr[        	]+a0,mhpmcounter11
[     	]+[0-9a-f]+:[  	]+b0c02573[    	]+csrr[        	]+a0,mhpmcounter12
[     	]+[0-9a-f]+:[  	]+b0d02573[    	]+csrr[        	]+a0,mhpmcounter13
[     	]+[0-9a-f]+:[  	]+b0e02573[    	]+csrr[        	]+a0,mhpmcounter14
[     	]+[0-9a-f]+:[  	]+b0f02573[    	]+csrr[        	]+a0,mhpmcounter15
[     	]+[0-9a-f]+:[  	]+b1002573[    	]+csrr[        	]+a0,mhpmcounter16
[     	]+[0-9a-f]+:[  	]+b1102573[    	]+csrr[        	]+a0,mhpmcounter17
[     	]+[0-9a-f]+:[  	]+b1202573[    	]+csrr[        	]+a0,mhpmcounter18
[     	]+[0-9a-f]+:[  	]+b1302573[    	]+csrr[        	]+a0,mhpmcounter19
[     	]+[0-9a-f]+:[  	]+b1402573[    	]+csrr[        	]+a0,mhpmcounter20
[     	]+[0-9a-f]+:[  	]+b1502573[    	]+csrr[        	]+a0,mhpmcounter21
[     	]+[0-9a-f]+:[  	]+b1602573[    	]+csrr[        	]+a0,mhpmcounter22
[     	]+[0-9a-f]+:[  	]+b1702573[    	]+csrr[        	]+a0,mhpmcounter23
[     	]+[0-9a-f]+:[  	]+b1802573[    	]+csrr[        	]+a0,mhpmcounter24
[     	]+[0-9a-f]+:[  	]+b1902573[    	]+csrr[        	]+a0,mhpmcounter25
[     	]+[0-9a-f]+:[  	]+b1a02573[    	]+csrr[        	]+a0,mhpmcounter26
[     	]+[0-9a-f]+:[  	]+b1b02573[    	]+csrr[        	]+a0,mhpmcounter27
[     	]+[0-9a-f]+:[  	]+b1c02573[    	]+csrr[        	]+a0,mhpmcounter28
[     	]+[0-9a-f]+:[  	]+b1d02573[    	]+csrr[        	]+a0,mhpmcounter29
[     	]+[0-9a-f]+:[  	]+b1e02573[    	]+csrr[        	]+a0,mhpmcounter30
[     	]+[0-9a-f]+:[  	]+b1f02573[    	]+csrr[        	]+a0,mhpmcounter31
[     	]+[0-9a-f]+:[  	]+b8002573[    	]+csrr[        	]+a0,mcycleh
[     	]+[0-9a-f]+:[  	]+b8202573[    	]+csrr[        	]+a0,minstreth
[     	]+[0-9a-f]+:[  	]+b8302573[    	]+csrr[        	]+a0,mhpmcounter3h
[     	]+[0-9a-f]+:[  	]+b8402573[    	]+csrr[        	]+a0,mhpmcounter4h
[     	]+[0-9a-f]+:[  	]+b8502573[    	]+csrr[        	]+a0,mhpmcounter5h
[     	]+[0-9a-f]+:[  	]+b8602573[    	]+csrr[        	]+a0,mhpmcounter6h
[     	]+[0-9a-f]+:[  	]+b8702573[    	]+csrr[        	]+a0,mhpmcounter7h
[     	]+[0-9a-f]+:[  	]+b8802573[    	]+csrr[        	]+a0,mhpmcounter8h
[     	]+[0-9a-f]+:[  	]+b8902573[    	]+csrr[        	]+a0,mhpmcounter9h
[     	]+[0-9a-f]+:[  	]+b8a02573[    	]+csrr[        	]+a0,mhpmcounter10h
[     	]+[0-9a-f]+:[  	]+b8b02573[    	]+csrr[        	]+a0,mhpmcounter11h
[     	]+[0-9a-f]+:[  	]+b8c02573[    	]+csrr[        	]+a0,mhpmcounter12h
[     	]+[0-9a-f]+:[  	]+b8d02573[    	]+csrr[        	]+a0,mhpmcounter13h
[     	]+[0-9a-f]+:[  	]+b8e02573[    	]+csrr[        	]+a0,mhpmcounter14h
[     	]+[0-9a-f]+:[  	]+b8f02573[    	]+csrr[        	]+a0,mhpmcounter15h
[     	]+[0-9a-f]+:[  	]+b9002573[    	]+csrr[        	]+a0,mhpmcounter16h
[     	]+[0-9a-f]+:[  	]+b9102573[    	]+csrr[        	]+a0,mhpmcounter17h
[     	]+[0-9a-f]+:[  	]+b9202573[    	]+csrr[        	]+a0,mhpmcounter18h
[     	]+[0-9a-f]+:[  	]+b9302573[    	]+csrr[        	]+a0,mhpmcounter19h
[     	]+[0-9a-f]+:[  	]+b9402573[    	]+csrr[        	]+a0,mhpmcounter20h
[     	]+[0-9a-f]+:[  	]+b9502573[    	]+csrr[        	]+a0,mhpmcounter21h
[     	]+[0-9a-f]+:[  	]+b9602573[    	]+csrr[        	]+a0,mhpmcounter22h
[     	]+[0-9a-f]+:[  	]+b9702573[    	]+csrr[        	]+a0,mhpmcounter23h
[     	]+[0-9a-f]+:[  	]+b9802573[    	]+csrr[        	]+a0,mhpmcounter24h
[     	]+[0-9a-f]+:[  	]+b9902573[    	]+csrr[        	]+a0,mhpmcounter25h
[     	]+[0-9a-f]+:[  	]+b9a02573[    	]+csrr[        	]+a0,mhpmcounter26h
[     	]+[0-9a-f]+:[  	]+b9b02573[    	]+csrr[        	]+a0,mhpmcounter27h
[     	]+[0-9a-f]+:[  	]+b9c02573[    	]+csrr[        	]+a0,mhpmcounter28h
[     	]+[0-9a-f]+:[  	]+b9d02573[    	]+csrr[        	]+a0,mhpmcounter29h
[     	]+[0-9a-f]+:[  	]+b9e02573[    	]+csrr[        	]+a0,mhpmcounter30h
[     	]+[0-9a-f]+:[  	]+b9f02573[    	]+csrr[        	]+a0,mhpmcounter31h
[     	]+[0-9a-f]+:[  	]+32002573[    	]+csrr[        	]+a0,mcountinhibit
[     	]+[0-9a-f]+:[  	]+32302573[    	]+csrr[        	]+a0,mhpmevent3
[     	]+[0-9a-f]+:[  	]+32402573[    	]+csrr[        	]+a0,mhpmevent4
[     	]+[0-9a-f]+:[  	]+32502573[    	]+csrr[        	]+a0,mhpmevent5
[     	]+[0-9a-f]+:[  	]+32602573[    	]+csrr[        	]+a0,mhpmevent6
[     	]+[0-9a-f]+:[  	]+32702573[    	]+csrr[        	]+a0,mhpmevent7
[     	]+[0-9a-f]+:[  	]+32802573[    	]+csrr[        	]+a0,mhpmevent8
[     	]+[0-9a-f]+:[  	]+32902573[    	]+csrr[        	]+a0,mhpmevent9
[     	]+[0-9a-f]+:[  	]+32a02573[    	]+csrr[        	]+a0,mhpmevent10
[     	]+[0-9a-f]+:[  	]+32b02573[    	]+csrr[        	]+a0,mhpmevent11
[     	]+[0-9a-f]+:[  	]+32c02573[    	]+csrr[        	]+a0,mhpmevent12
[     	]+[0-9a-f]+:[  	]+32d02573[    	]+csrr[        	]+a0,mhpmevent13
[     	]+[0-9a-f]+:[  	]+32e02573[    	]+csrr[        	]+a0,mhpmevent14
[     	]+[0-9a-f]+:[  	]+32f02573[    	]+csrr[        	]+a0,mhpmevent15
[     	]+[0-9a-f]+:[  	]+33002573[    	]+csrr[        	]+a0,mhpmevent16
[     	]+[0-9a-f]+:[  	]+33102573[    	]+csrr[        	]+a0,mhpmevent17
[     	]+[0-9a-f]+:[  	]+33202573[    	]+csrr[        	]+a0,mhpmevent18
[     	]+[0-9a-f]+:[  	]+33302573[    	]+csrr[        	]+a0,mhpmevent19
[     	]+[0-9a-f]+:[  	]+33402573[    	]+csrr[        	]+a0,mhpmevent20
[     	]+[0-9a-f]+:[  	]+33502573[    	]+csrr[        	]+a0,mhpmevent21
[     	]+[0-9a-f]+:[  	]+33602573[    	]+csrr[        	]+a0,mhpmevent22
[     	]+[0-9a-f]+:[  	]+33702573[    	]+csrr[        	]+a0,mhpmevent23
[     	]+[0-9a-f]+:[  	]+33802573[    	]+csrr[        	]+a0,mhpmevent24
[     	]+[0-9a-f]+:[  	]+33902573[    	]+csrr[        	]+a0,mhpmevent25
[     	]+[0-9a-f]+:[  	]+33a02573[    	]+csrr[        	]+a0,mhpmevent26
[     	]+[0-9a-f]+:[  	]+33b02573[    	]+csrr[        	]+a0,mhpmevent27
[     	]+[0-9a-f]+:[  	]+33c02573[    	]+csrr[        	]+a0,mhpmevent28
[     	]+[0-9a-f]+:[  	]+33d02573[    	]+csrr[        	]+a0,mhpmevent29
[     	]+[0-9a-f]+:[  	]+33e02573[    	]+csrr[        	]+a0,mhpmevent30
[     	]+[0-9a-f]+:[  	]+33f02573[    	]+csrr[        	]+a0,mhpmevent31
[     	]+[0-9a-f]+:[  	]+04302573[    	]+csrr[        	]+a0,utval
[     	]+[0-9a-f]+:[  	]+14302573[    	]+csrr[        	]+a0,stval
[     	]+[0-9a-f]+:[  	]+18002573[    	]+csrr[        	]+a0,satp
[     	]+[0-9a-f]+:[  	]+34302573[    	]+csrr[        	]+a0,mtval
[     	]+[0-9a-f]+:[  	]+32002573[    	]+csrr[        	]+a0,mcountinhibit
[     	]+[0-9a-f]+:[  	]+20002573[    	]+csrr[        	]+a0,0x200
[     	]+[0-9a-f]+:[  	]+20202573[    	]+csrr[        	]+a0,0x202
[     	]+[0-9a-f]+:[  	]+20302573[    	]+csrr[        	]+a0,0x203
[     	]+[0-9a-f]+:[  	]+20402573[    	]+csrr[        	]+a0,0x204
[     	]+[0-9a-f]+:[  	]+20502573[    	]+csrr[        	]+a0,0x205
[     	]+[0-9a-f]+:[  	]+24002573[    	]+csrr[        	]+a0,0x240
[     	]+[0-9a-f]+:[  	]+24102573[    	]+csrr[        	]+a0,0x241
[     	]+[0-9a-f]+:[  	]+24202573[    	]+csrr[        	]+a0,0x242
[     	]+[0-9a-f]+:[  	]+24302573[    	]+csrr[        	]+a0,0x243
[     	]+[0-9a-f]+:[  	]+24402573[    	]+csrr[        	]+a0,0x244
[     	]+[0-9a-f]+:[  	]+38002573[    	]+csrr[        	]+a0,0x380
[     	]+[0-9a-f]+:[  	]+38102573[    	]+csrr[        	]+a0,0x381
[     	]+[0-9a-f]+:[  	]+38202573[    	]+csrr[        	]+a0,0x382
[     	]+[0-9a-f]+:[  	]+38302573[    	]+csrr[        	]+a0,0x383
[     	]+[0-9a-f]+:[  	]+38402573[    	]+csrr[        	]+a0,0x384
[     	]+[0-9a-f]+:[  	]+38502573[    	]+csrr[        	]+a0,0x385
[     	]+[0-9a-f]+:[  	]+32102573[    	]+csrr[        	]+a0,0x321
[     	]+[0-9a-f]+:[  	]+32202573[    	]+csrr[        	]+a0,0x322
[     	]+[0-9a-f]+:[  	]+00102573[    	]+frflags[     	]+a0
[     	]+[0-9a-f]+:[  	]+00202573[    	]+frrm[        	]+a0
[     	]+[0-9a-f]+:[  	]+00302573[    	]+frcsr[       	]+a0
[     	]+[0-9a-f]+:[  	]+7b002573[    	]+csrr[        	]+a0,dcsr
[     	]+[0-9a-f]+:[  	]+7b102573[    	]+csrr[        	]+a0,dpc
[     	]+[0-9a-f]+:[  	]+7b202573[    	]+csrr[        	]+a0,dscratch0
[     	]+[0-9a-f]+:[  	]+7b302573[    	]+csrr[        	]+a0,dscratch1
[     	]+[0-9a-f]+:[  	]+7b202573[    	]+csrr[        	]+a0,dscratch0
[     	]+[0-9a-f]+:[  	]+7a002573[    	]+csrr[        	]+a0,tselect
[     	]+[0-9a-f]+:[  	]+7a102573[    	]+csrr[        	]+a0,tdata1
[     	]+[0-9a-f]+:[  	]+7a202573[    	]+csrr[        	]+a0,tdata2
[     	]+[0-9a-f]+:[  	]+7a302573[    	]+csrr[        	]+a0,tdata3
[     	]+[0-9a-f]+:[  	]+7a402573[    	]+csrr[        	]+a0,tinfo
[     	]+[0-9a-f]+:[  	]+7a502573[    	]+csrr[        	]+a0,tcontrol
[     	]+[0-9a-f]+:[  	]+7a802573[    	]+csrr[        	]+a0,mcontext
[     	]+[0-9a-f]+:[  	]+7aa02573[    	]+csrr[        	]+a0,scontext
[     	]+[0-9a-f]+:[  	]+7a102573[    	]+csrr[        	]+a0,tdata1
[     	]+[0-9a-f]+:[  	]+7a102573[    	]+csrr[        	]+a0,tdata1
[     	]+[0-9a-f]+:[  	]+7a102573[    	]+csrr[        	]+a0,tdata1
[     	]+[0-9a-f]+:[  	]+7a102573[    	]+csrr[        	]+a0,tdata1
[     	]+[0-9a-f]+:[  	]+7a302573[    	]+csrr[        	]+a0,tdata3
[     	]+[0-9a-f]+:[  	]+7a302573[    	]+csrr[        	]+a0,tdata3
