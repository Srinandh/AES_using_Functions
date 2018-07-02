----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 15:43:15
-- Design Name: 
-- Module Name: dh_128 - Behavioral
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

entity dh_128 is
    Port ( p1,p2 : in STD_LOGIC_VECTOR (127 downto 0);
           key : out STD_LOGIC_VECTOR (127 downto 0));
end dh_128;

architecture Behavioral of dh_128 is
component dh is
Port ( p1,p2 : in STD_LOGIC_VECTOR (3 downto 0);
           key : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

begin
x1:dh port map(p1=>p1(127 downto 124),p2=>p2(127 downto 124),key=>key(127 downto 124));
x2:dh port map(p1=>p1(123 downto 120),p2=>p2(123 downto 120),key=>key(123 downto 120));
x3:dh port map(p1=>p1(119 downto 116),p2=>p2(119 downto 116),key=>key(119 downto 116));
x4:dh port map(p1=>p1(115 downto 112),p2=>p2(115 downto 112),key=>key(115 downto 112));
x5:dh port map(p1=>p1(111 downto 108),p2=>p2(111 downto 108),key=>key(111 downto 108));
x6:dh port map(p1=>p1(107 downto 104),p2=>p2(107 downto 104),key=>key(107 downto 104));
x7:dh port map(p1=>p1(103 downto 100),p2=>p2(103 downto 100),key=>key(103 downto 100));
x8:dh port map(p1=>p1(99 downto 96),p2=>p2(99 downto 96),key=>key(99 downto 96));
x9:dh port map(p1=>p1(95 downto 92),p2=>p2(95 downto 92),key=>key(95 downto 92));
x10:dh port map(p1=>p1(91 downto 88),p2=>p2(91 downto 88),key=>key(91 downto 88));
x11:dh port map(p1=>p1(87 downto 84),p2=>p2(87 downto 84),key=>key(87 downto 84));
x12:dh port map(p1=>p1(83 downto 80),p2=>p2(83 downto 80),key=>key(83 downto 80));
x13:dh port map(p1=>p1(79 downto 76),p2=>p2(79 downto 76),key=>key(79 downto 76));
x14:dh port map(p1=>p1(75 downto 72),p2=>p2(75 downto 72),key=>key(75 downto 72));
x15:dh port map(p1=>p1(71 downto 68),p2=>p2(71 downto 68),key=>key(71 downto 68));
x16:dh port map(p1=>p1(67 downto 64),p2=>p2(67 downto 64),key=>key(67 downto 64));
x17:dh port map(p1=>p1(63 downto 60),p2=>p2(63 downto 60),key=>key(63 downto 60));
x18:dh port map(p1=>p1(59 downto 56),p2=>p2(59 downto 56),key=>key(59 downto 56));
x19:dh port map(p1=>p1(55 downto 52),p2=>p2(55 downto 52),key=>key(55 downto 52));
x20:dh port map(p1=>p1(51 downto 48),p2=>p2(51 downto 48),key=>key(51 downto 48));
x21:dh port map(p1=>p1(47 downto 44),p2=>p2(47 downto 44),key=>key(47 downto 44));
x22:dh port map(p1=>p1(43 downto 40),p2=>p2(43 downto 40),key=>key(43 downto 40));
x23:dh port map(p1=>p1(39 downto 36),p2=>p2(39 downto 36),key=>key(39 downto 36));
x24:dh port map(p1=>p1(35 downto 32),p2=>p2(35 downto 32),key=>key(35 downto 32));
x25:dh port map(p1=>p1(31 downto 28),p2=>p2(31 downto 28),key=>key(31 downto 28));
x26:dh port map(p1=>p1(27 downto 24),p2=>p2(27 downto 24),key=>key(27 downto 24));
x27:dh port map(p1=>p1(23 downto 20),p2=>p2(23 downto 20),key=>key(23 downto 20));
x28:dh port map(p1=>p1(19 downto 16),p2=>p2(19 downto 16),key=>key(19 downto 16));
x29:dh port map(p1=>p1(15 downto 12),p2=>p2(15 downto 12),key=>key(15 downto 12));
x30:dh port map(p1=>p1(11 downto 8),p2=>p2(11 downto 8),key=>key(11 downto 8));
x31:dh port map(p1=>p1(7 downto 4),p2=>p2(7 downto 4),key=>key(7 downto 4));
x32:dh port map(p1=>p1(3 downto 0),p2=>p2(3 downto 0),key=>key(3 downto 0));


end Behavioral;
