----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/11/10 19:59:38
-- Design Name: 
-- Module Name: pc_reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_reg is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           pc : out STD_LOGIC_VECTOR(5 downto 0);
           ce : out STD_LOGIC);
end pc_reg;

architecture Behavioral of pc_reg is
    signal ce_o : STD_LOGIC;
    signal pc_o : STD_LOGIC_VECTOR(5 downto 0);
    
begin

    process (clk'event)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                ce <= '0';
                ce_o <= '0';
            else
                ce <= '1';
                ce_o <= '1';
            end if;
        end if;
    end process;
    
    process (clk'event)
        begin
            if rising_edge(clk) then
                if ce_o = '0' then
                    pc <= b"000000";
                    pc_o <= b"000000";
                else
                    pc_o <= pc_o + b"000001";  -- STD_LOGIC_SIGNED library
                    pc <= pc_o;
                end if;
            end if;
        end process;

end Behavioral;
