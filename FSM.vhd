LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FSM IS
PORT(	SW : in std_logic_vector(1 downto 0);
	KEY : in std_logic_vector(3 downto 0);
	LEDR : out std_logic_vector(9 downto 0) 
	);
END FSM;

ARCHITECTURE Behavior OF FSM IS
signal w, clock, reset, output : std_logic;
TYPE State_type IS (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state

BEGIN
w <= SW(1);
reset <= SW(0);
clock <= KEY(0);
--output<=LEDR(0);

PROCESS (w, y_Q) -- state table
BEGIN
CASE y_Q IS
	WHEN 	A => IF (w = '0') THEN Y_D <= B; 
			ELSE Y_D <= F;
			END IF;
	WHEN	B => IF (w = '0') THEN Y_D <= C;
			ELSE Y_D <= F;
			END IF;
	WHEN	C => IF (w = '0') THEN Y_D <= D;
			ELSE Y_D <= F;
			END IF;
	WHEN	D => IF (w = '0') THEN Y_D <= E;
			ELSE Y_D <= F;
			END IF;
	WHEN	E => IF (w = '0') THEN Y_D <= E;
			ELSE Y_D <= F;
			END IF;
	WHEN	F => IF (w = '1') THEN Y_D <= G;
			ELSE Y_D <= B;
			END IF;
	WHEN	G => IF (w = '1') THEN Y_D <= H;
			ELSE Y_D <= B;
			END IF;
	WHEN	H => IF (w = '1') THEN Y_D <= I;
			ELSE Y_D <= B;
			END IF;
	WHEN	I => IF (w = '1') THEN Y_D <= I;
			ELSE Y_D <= B;
			END IF;

END CASE;
END PROCESS; -- state table


PROCESS (clock, reset) -- state flip-flops
BEGIN
	if (reset = '1') then y_q <= A;
	elsif (rising_edge(clock)) then y_q <= Y_D;
	end if;
END PROCESS;

 LEDR(0) <= '1' when ((y_q=E) or (y_q=I)) else
	 '0';
END Behavior;