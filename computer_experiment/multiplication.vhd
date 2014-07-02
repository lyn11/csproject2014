----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:10:42 07/01/2014 
-- Design Name: 
-- Module Name:    multiplication - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplication is
    Port ( CLK : in  STD_LOGIC;
           start : in  STD_LOGIC;
           ready : out  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Hi : out  STD_LOGIC_VECTOR (31 downto 0);
           Lo : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplication;

architecture Behavioral of multiplication is
	signal condi : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal ans : STD_LOGIC_VECTOR (63 downto 0);
	
	component multiplier is
	PORT (
		clk : in  STD_LOGIC;
      A : in  STD_LOGIC_VECTOR (31 downto 0);
      B : in  STD_LOGIC_VECTOR (31 downto 0);
      p : out  STD_LOGIC_VECTOR (63 downto 0)
	);
	end component;
	
begin

	multiplier1 : multiplier PORT MAP(
		clk => CLK,
		A => A,
		B => B,
		p => ans
	);

process(CLK, start, A, B)
	begin
		if start = '0' then
			condi <= "0000";
			ready <= '0';
		elsif CLK'event and CLK = '0' then
			if condi < 14 then
				condi <= condi + 1;
			elsif condi = 14 then
				ready <= '1';
				Hi <= ans(63 downto 32);
				Lo <= ans(31 downto 0);
				condi <= condi + 1;
			end if;
		end if;
end process;

end Behavioral;

