----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/11/10 19:59:38
-- Design Name: 
-- Module Name: rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    Port ( ce : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR(5 downto 0);
           inst : out STD_LOGIC_VECTOR(31 downto 0));
end rom;

architecture Behavioral of rom is
begin
    
    process
    type rom_array_type is array(63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    variable rom_array : rom_array_type;
    file filein : text;
    variable fstatus : FILE_OPEN_STATUS;
    variable buf : LINE;
    variable output : LINE;
    variable data : STD_LOGIC_VECTOR(31 downto 0);
    variable index : STD_LOGIC_VECTOR(5 downto 0) := "000000";
    begin
        -- 在process中，先打开文件
        file_open(fstatus, filein, "/home/zhanghuimeng/Computer_Architecture/TestThinpadProject/rom.data", read_mode);
            while not endfile(filein) loop
                readline(filein, buf);
                if buf'length = 0 then -- 否则hread会报错
                    exit;
                end if;
                hread(buf, data);
                
                rom_array(to_integer(unsigned(index))) := data;
                
                -- 打印rom_array(index)的值
                deallocate(output);
                write(output, string'("rom_array("));
                write(output, integer'(to_integer(unsigned(index))));
                write(output, string'(") = "));
                write(output, rom_array(to_integer(unsigned(index))));
                report output.all;
                
                index := index + "000001";
            end loop;
        
        -- 等待ce变化
        loop
            wait on ce, addr;
            if (ce = '0') then
                inst <= x"00000000";
            else
                inst <= rom_array(to_integer(unsigned(addr)));
            end if;
        end loop;
    end process;

end Behavioral;
