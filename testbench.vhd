LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavior OF testbench IS
COMPONENT FSM is 
         port(	SW : in std_logic_vector(1 downto 0);
		KEY0 : in std_logic; 
		LEDR0 : out std_logic);
END COMPONENT;

SIGNAL wx : STD_LOGIC;
SIGNAL clk   : STD_LOGIC;
SIGNAL resetx  : STD_LOGIC; 
SIGNAL zx : STD_LOGIC;
SIGNAL m : STD_LOGIC_VECTOR(1 downto 0);

BEGIN
m<=wx & resetx;

process
   begin
        clk <= '0';
        wait for 10 ns;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for 10 ns;  --for next 0.5 ns signal is '1'.
   end process;

PROCESS
BEGIN
 
 wx <= '1';
 resetx <= '1'; 
 WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0'; 
 WAIT FOR 20 ns; 
 wx <= '0';
 resetx <= '0';  
 WAIT FOR 20 ns;
 wx <= '0';
 resetx <= '0';  
WAIT FOR 20 ns;
 wx <= '0';
 resetx <= '0'; 
 WAIT FOR 20 ns; 
 wx <= '0';
 resetx <= '0';  
 WAIT FOR 20 ns;
 wx <= '0';
 resetx <= '0';  
WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0'; 
 WAIT FOR 20 ns; 
 wx <= '0';
 resetx <= '0';  
 WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0'; 
WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0';
WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0';
WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0';
WAIT FOR 20 ns;
 wx <= '1';
 resetx <= '0';
WAIT;

END PROCESS;
FIG: FSM PORT MAP (m, clk, zx);
END Behavior;
