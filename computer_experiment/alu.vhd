----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:07:07 11/24/2013 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           R : out  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in STD_LOGIC;
           opt : in  STD_LOGIC_VECTOR (3 downto 0));
end alu;

architecture Behavioral of alu is
begin
process(A,B,op,CLK)
	begin
		if CLK'event and CLK = '1' then
			case opt is:
				when "0000" =>
					R <= A;
				when "0001" =>
					R <= A + B;
				when "0010" =>
					R <= A - B;
				when "0011" =>
					R <= A and B;
				when "0100" =>
					R <= A or B;
				when "0101" =>
					R <= not A;
				when "0110" =>
					R <= B;
				when "0111" =>
					R <= A xor B;
				when "1000" =>
					R <= 
				when "1001" =>
				when "1010" =>
				when "1011" =>
				when "1100" =>
				when "1101" =>
				when "1110" =>
				when "1111" =>
				when others =>
			end case;
			
		end if;
end process;
end Behavioral;

