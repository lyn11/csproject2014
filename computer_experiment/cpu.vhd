----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:07 07/01/2014 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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

entity cpu is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  led : out STD_LOGIC_VECTOR (15 downto 0);
			  SW : in STD_LOGIC_VECTOR (31 downto 0));
end cpu;

architecture Behavioral of cpu is

	signal A : STD_LOGIC_VECTOR (31 downto 0);
	signal B : STD_LOGIC_VECTOR (31 downto 0);
	signal Hi : STD_LOGIC_VECTOR (31 downto 0);
	signal Lo : STD_LOGIC_VECTOR (31 downto 0);
	signal condi : STD_LOGIC_VECTOR (2 downto 0);
	signal mult_start : STD_LOGIC;
	signal mult_ready : STD_LOGIC;

	component multiplication is
	PORT (
		CLK : in  STD_LOGIC;
      start : in  STD_LOGIC;
      ready : out  STD_LOGIC;
      A : in  STD_LOGIC_VECTOR (31 downto 0);
      B : in  STD_LOGIC_VECTOR (31 downto 0);
      Hi : out  STD_LOGIC_VECTOR (31 downto 0);
      Lo : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
	
begin

	multiplication1 : multiplication PORT MAP(
		CLK => CLK,
		start => mult_start,
		ready => mult_ready,
		A => A,
		B => B,
		Hi => Hi,
		Lo => Lo
	);

LED <= Lo(15 downto 0);
process(CLK)
	begin
		if RST = '0' then
			condi <= "000";
			mult_start <= '0';
		elsif CLK'event and CLK = '0' then
			if condi = 0 then
				mult_start <= '1';
				A <= SW;
				B <= SW;
				condi <= condi + 1;
			elsif condi = 1 then
				if mult_ready = '1' then
					mult_start <= '0';
					condi <= condi + 1;
				end if;
			else
				condi <= condi + 0;
			end if;
		end if;
	end process;


end Behavioral;

