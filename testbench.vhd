LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavior OF testbench IS
COMPONENT FSM is 
         port(	SW : in std_logic_vector(1 downto 0);
		KEY : in std_logic_vector(3 downto 0);
		LEDR : out std_logic_vector(9 downto 0));
END COMPONENT;

SIGNAL wx : STD_LOGIC;
SIGNAL clk   : STD_LOGIC;
SIGNAL resetx  : STD_LOGIC; 
SIGNAL m : STD_LOGIC_VECTOR(1 downto 0);
signal o1 : std_logic_vector(3 downto 0);
signal o2 : std_logic_vector(9 downto 0);

BEGIN
m<=wx & resetx;
o1<= "000" & clk;

process
   begin
        clk <= '0';
        wait for 10 ns; 
        clk <= '1';
        wait for 10 ns; 
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
FIG: FSM PORT MAP (m, o1, o2);
END Behavior;

