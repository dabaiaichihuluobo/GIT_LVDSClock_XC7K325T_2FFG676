Readme
1. Xilinx XC7K325T-2FFG676
2. ISE14.7
3. We use LVDS clock for the XC7K325T.Since this is the first time I use differential clock
   for the FPGA,I record the full code for the learning process.
4. LVDS clock generator SiT9102; clock P -> FPGA pin :AB11; clock N -> FPGA pin :AC11;
   AB11 and AC11 are in the BANK 33 of the XC7K325T;
5. This program uses primitives to change differential lvds clock to single clock;
   then use this single clk as the main clock to turn on or off the led at certain intervals. 
   
5. Remember the lvds IO standard is only available in the HP I/O banks.What is HP io 
   banks? What is the difference between HP and HR banks:The I/Os in Xilinx® 7 series FPGAs 
   are classified as either high range (HR) or high performance (HP) banks. HR I/O banks can 
   be operated from 1.2V to 3.3V, whereas HP I/O banks are optimized for operation between 1.2V 
   and 1.8V.
   