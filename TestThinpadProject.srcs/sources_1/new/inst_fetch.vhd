----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/11/10 19:59:38
-- Design Name: 
-- Module Name: inst_fetch - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inst_fetch is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           inst_o : out STD_LOGIC_VECTOR(31 downto 0));
end inst_fetch;

architecture Behavioral of inst_fetch is

component pc_reg
Port ( rst : in STD_LOGIC;
       clk : in STD_LOGIC;
       pc : out STD_LOGIC_VECTOR(5 downto 0);
       ce : out STD_LOGIC);
end component;

component rom is
    Port ( ce : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR(5 downto 0);
           inst : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal pc_to_addr : STD_LOGIC_VECTOR(5 downto 0);
signal ce_to_ce : STD_LOGIC;

begin
    pc_reg_0: pc_reg port map(rst => rst, clk => clk, pc => pc_to_addr, ce => ce_to_ce);
    rom_0: rom port map(ce => ce_to_ce, addr => pc_to_addr, inst => inst_o);
end Behavioral;
