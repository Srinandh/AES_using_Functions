----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2018 14:52:00
-- Design Name: 
-- Module Name: aes_pro - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypt is
    Port ( a : in STD_LOGIC_VECTOR (127 downto 0);de:in std_logic;
           key : in STD_LOGIC_VECTOR (127 downto 0);
           b : out STD_LOGIC_VECTOR (127 downto 0));
end decrypt;

architecture Behavioral of decrypt is
type row is array(0 to 9) of std_logic_vector(31 downto 0);
type row1 is array(0 to 10) of std_logic_vector(127 downto 0);
--signal rcon:row;

type mat is array(0 to 3,0 to 3) of std_logic_vector(7 downto 0);
--signal skey1:std_logic_vector(127 downto 0);signal sb2:mat;
type si is array(0 to 40) of mat;
 --signal sb:si;


function inv_shift_rows( sa:mat) return mat is
    variable p:mat;
    
    begin
    
   p(0,0):=sa(0,0);
   p(0,1):=sa(0,1);
   p(0,2):=sa(0,2);
   p(0,3):=sa(0,3);
   p(1,0):=sa(1,3);
   p(1,1):=sa(1,0);
   p(1,2):=sa(1,1);
   p(1,3):=sa(1,2);
   p(2,0):=sa(2,2);
   p(2,1):=sa(2,3);
   p(2,2):=sa(2,0);
   p(2,3):=sa(2,1);
   p(3,0):=sa(3,1);
   p(3,1):=sa(3,2);
   p(3,2):=sa(3,3);
   p(3,3):=sa(3,0);
   
    
    return p;
    end function inv_shift_rows;
    function sbox( sa1:std_logic_vector(7 downto 0)) return std_logic_vector is
    
        
    begin
    case sa1 is
                when "00000000"=>return x"63";
                when "00000001"=>return x"7c";
                when "00000010"=>return x"77";
                when "00000011"=>return x"7b";
                when "00000100"=>return x"f2";
                when "00000101"=>return x"6b";
                when "00000110"=>return x"6f";
                when "00000111"=>return x"c5";
                when "00001000"=>return x"30";
                when "00001001"=>return x"01";
                when "00001010"=>return x"67";
                when "00001011"=>return x"2b";
                when "00001100"=>return x"fe";
                when "00001101"=>return x"d7";
                when "00001110"=>return x"ab";
                when "00001111"=>return x"76";
                when "00010000"=>return x"ca";
                when "00010001"=>return x"82";
                when "00010010"=>return x"c9";
                when "00010011"=>return x"7d";
                when "00010100"=>return x"fa";
                when "00010101"=>return x"59";
                when "00010110"=>return x"47";
                when "00010111"=>return x"f0";
                when "00011000"=>return x"ad";
                when "00011001"=>return x"d4";
                when "00011010"=>return x"a2";
                when "00011011"=>return x"af";
                when "00011100"=>return x"9c";
                when "00011101"=>return x"a4";
                when "00011110"=>return x"72";
                when "00011111"=>return x"c0";
                when "00100000"=>return x"b7";
                when "00100001"=>return x"fd";
                when "00100010"=>return x"93";
                when "00100011"=>return x"26";
                when "00100100"=>return x"36";
                when "00100101"=>return x"3f";
                when "00100110"=>return x"f7";
                when "00100111"=>return x"cc";
                when "00101000"=>return x"34";
                when "00101001"=>return x"a5";
                when "00101010"=>return x"e5";
                when "00101011"=>return x"f1";
                when "00101100"=>return x"71";
                when "00101101"=>return x"d8";
                when "00101110"=>return x"31";
                when "00101111"=>return x"15";
                when "00110000"=>return x"04";
                when "00110001"=>return x"c7";
                when "00110010"=>return x"23";
                when "00110011"=>return x"c3";
                when "00110100"=>return x"18";
                when "00110101"=>return x"96";                
                when "00110110"=>return x"05";
                when "00110111"=>return x"9a";
                when "00111000"=>return x"07";
                when "00111001"=>return x"12";
                when "00111010"=>return x"80";
                when "00111011"=>return x"e2";
                when "00111100"=>return x"eb";
                when "00111101"=>return x"27";
                when "00111110"=>return x"b2";
                when "00111111"=>return x"75";
                when "01000000"=>return x"09";
                when "01000001"=>return x"83";
                when "01000010"=>return x"2c";
                when "01000011"=>return x"1a";
                when "01000100"=>return x"1b";
                when "01000101"=>return x"6e";
                when "01000110"=>return x"5a";
             when "01000111"=>return x"a0";
                when "01001000"=>return x"52";
                when "01001001"=>return x"3b";
                when "01001010"=>return x"d6";
                when "01001011"=>return x"b3";
                when "01001100"=>return x"29";
                when "01001101"=>return x"e3";
                when "01001110"=>return x"2f";
               when "01001111"=>return x"84";
                when "01010000"=>return x"53";
                when "01010001"=>return x"d1";
                when "01010010"=>return x"00";
                when "01010011"=>return x"ed";
                when "01010100"=>return x"20";
                when "01010101"=>return x"fc";
                when "01010110"=>return x"b1";
                when "01010111"=>return x"5b";
                when "01011000"=>return x"6a";
                when "01011001"=>return x"cb";
                when "01011010"=>return x"be";
                when "01011011"=>return x"39";
                when "01011100"=>return x"4a";
                when "01011101"=>return x"4c";
                when "01011110"=>return x"58";
                when "01011111"=>return x"cf";
                when "01100000"=>return x"d0";
                when "01100001"=>return x"ef";
                when "01100010"=>return x"aa";
                when "01100011"=>return x"fb";
                when "01100100"=>return x"43";
                when "01100101"=>return x"4d";
                when "01100110"=>return x"33";
                when "01100111"=>return x"85";
                when "01101000"=>return x"45";
                when "01101001"=>return x"f9";
               when "01101010"=>return x"02";
                when "01101011"=>return x"7f";
                when "01101100"=>return x"50";
                when "01101101"=>return x"3c";
                when "01101110"=>return x"9f";
                when "01101111"=>return x"a8";
                when "01110000"=>return x"51";
                when "01110001"=>return x"a3";
                when "01110010"=>return x"40";
                when "01110011"=>return x"8f";
                when "01110100"=>return x"92";
                when "01110101"=>return x"9d";
                when "01110110"=>return x"38";
               when "01110111"=>return x"f5";
                when "01111000"=>return x"bc";
                when "01111001"=>return x"b6";
                when "01111010"=>return x"da";
                when "01111011"=>return x"21";
                when "01111100"=>return x"10";
                when "01111101"=>return x"ff";
                when "01111110"=>return x"f3";
                when "01111111"=>return x"d2";
                when "10000000"=>return x"cd";
                when "10000001"=>return x"0c";
                when "10000010"=>return x"13";
                when "10000011"=>return x"ec";
                when "10000100"=>return x"5f";
                when "10000101"=>return x"97";
                when "10000110"=>return x"44";
                when "10000111"=>return x"17";
                when "10001000"=>return x"c4";
                when "10001001"=>return x"a7";
                when "10001010"=>return x"7e";
                when "10001011"=>return x"3d";
                when "10001100"=>return x"64";
                when "10001101"=>return x"5d";
                when "10001110"=>return x"19";
                when "10001111"=>return x"73";
                when "10010000"=>return x"60";
                when "10010001"=>return x"81";
                when "10010010"=>return x"4f";
                when "10010011"=>return x"dc";
                when "10010100"=>return x"22";
                when "10010101"=>return x"2a";
                when "10010110"=>return x"90";
                when "10010111"=>return x"88";
                when "10011000"=>return x"46";
                when "10011001"=>return x"ee";
                when "10011010"=>return x"b8";
                when "10011011"=>return x"14";
                when "10011100"=>return x"de";
                when "10011101"=>return x"5e";
                when "10011110"=>return x"0b";
                when "10011111"=>return x"db";
                when "10100000"=>return x"e0";
                when "10100001"=>return x"32";
                when "10100010"=>return x"3a";
                when "10100011"=>return x"0a";
                when "10100100"=>return x"49";
                when "10100101"=>return x"06";
                when "10100110"=>return x"24";
                when "10100111"=>return x"5c";
                when "10101000"=>return x"c2";
                when "10101001"=>return x"d3";
                when "10101010"=>return x"ac";
                when "10101011"=>return x"62";
                when "10101100"=>return x"91";
                when "10101101"=>return x"95";
                when "10101110"=>return x"e4";
                when "10101111"=>return x"79";
                when "10110000"=>return x"e7";
                when "10110001"=>return x"c8";
                when "10110010"=>return x"37";
                when "10110011"=>return x"6d";
                when "10110100"=>return x"8d";
                when "10110101"=>return x"d5";
                when "10110110"=>return x"4e";
                when "10110111"=>return x"a9";
                when "10111000"=>return x"6c";
                when "10111001"=>return x"56";
                when "10111010"=>return x"f4";
                when "10111011"=>return x"ea";
                when "10111100"=>return x"65";
                when "10111101"=>return x"7a";
                when "10111110"=>return x"ae";
                when "10111111"=>return x"08";
                when "11000000"=>return x"ba";
                when "11000001"=>return x"78";
                when "11000010"=>return x"25";
                when "11000011"=>return x"2e";
                when "11000100"=>return x"1c";
                when "11000101"=>return x"a6";
                when "11000110"=>return x"b4";
                when "11000111"=>return x"c6";
                when "11001000"=>return x"e8";
                when "11001001"=>return x"dd";
                when "11001010"=>return x"74";
                when "11001011"=>return x"1f";
                when "11001100"=>return x"4b";
                when "11001101"=>return x"bd";
                when "11001110"=>return x"8b";
                when "11001111"=>return x"8a";
                when "11010000"=>return x"70";
                when "11010001"=>return x"3e";
                when "11010010"=>return x"b5";
                when "11010011"=>return x"66";
                when "11010100"=>return x"48";
                when "11010101"=>return x"03";
                when "11010110"=>return x"f6";
               when "11010111"=>return x"0e";
                when "11011000"=>return x"61";
                when "11011001"=>return x"35";
                when "11011010"=>return x"57";
                when "11011011"=>return x"b9";
                when "11011100"=>return x"86";
                when "11011101"=>return x"c1";
                when "11011110"=>return x"1d";
                when "11011111"=>return x"9e";
                when "11100000"=>return x"e1";
                when "11100001"=>return x"f8";
                when "11100010"=>return x"98";
                when "11100011"=>return x"11";
                when "11100100"=>return x"69";
                when "11100101"=>return x"d9";
                when "11100110"=>return x"8e";
                when "11100111"=>return x"94";
                when "11101000"=>return x"9b";
                when "11101001"=>return x"1e";
                when "11101010"=>return x"87";
                when "11101011"=>return x"e9";
                when "11101100"=>return x"ce";
                when "11101101"=>return x"55";
                when "11101110"=>return x"28";
                when "11101111"=>return x"df";
                when "11110000"=>return x"8c";
                when "11110001"=>return x"a1";
                when "11110010"=>return x"89";
                when "11110011"=>return x"0d";
                when "11110100"=>return x"bf";
                when "11110101"=>return x"e6";
                when "11110110"=>return x"42";
                when "11110111"=>return x"68";
                when "11111000"=>return x"41";
                when "11111001"=>return x"99";
                when "11111010"=>return x"2d";
                when "11111011"=>return x"0f";
                when "11111100"=>return x"b0";
                when "11111101"=>return x"54";
                when "11111110"=>return x"bb";
               when "11111111"=>return x"16";
                
                when others=> return  x"00";
    end case;
      end function sbox;
function inv_sbox( sa1:std_logic_vector(7 downto 0)) return std_logic_vector is

	
begin
case sa1 is
			when "00000000"=>return x"52";
			when "00000001"=>return x"09";
			when "00000010"=>return x"6A";
			when "00000011"=>return x"D5";
			when "00000100"=>return x"30";
			when "00000101"=>return x"36";
			when "00000110"=>return x"A5";
			when "00000111"=>return x"38";
			when "00001000"=>return x"BF";
			when "00001001"=>return x"40";
			when "00001010"=>return x"A3";
			when "00001011"=>return x"9E";
			when "00001100"=>return x"81";
			when "00001101"=>return x"F3";
			when "00001110"=>return x"D7";
			when "00001111"=>return x"FB";
			when "00010000"=>return x"7C";
			when "00010001"=>return x"E3";
			when "00010010"=>return x"39";
			when "00010011"=>return x"82";
			when "00010100"=>return x"9B";
			when "00010101"=>return x"2F";
			when "00010110"=>return x"FF";
			when "00010111"=>return x"87";
			when "00011000"=>return x"34";
			when "00011001"=>return x"8E";
			when "00011010"=>return x"43";
			when "00011011"=>return x"44";
			when "00011100"=>return x"C4";
			when "00011101"=>return x"DE";
			when "00011110"=>return x"E9";
			when "00011111"=>return x"CB";
			when "00100000"=>return x"54";
			when "00100001"=>return x"7B";
			when "00100010"=>return x"94";
			when "00100011"=>return x"32";
			when "00100100"=>return x"A6";
			when "00100101"=>return x"C2";
			when "00100110"=>return x"23";
			when "00100111"=>return x"3D";
			when "00101000"=>return x"EE";
			when "00101001"=>return x"4C";
			when "00101010"=>return x"95";
			when "00101011"=>return x"0B";
			when "00101100"=>return x"42";
			when "00101101"=>return x"FA";
			when "00101110"=>return x"C3";
			when "00101111"=>return x"4E";
			when "00110000"=>return x"08";
			when "00110001"=>return x"2E";
			when "00110010"=>return x"A1";
			when "00110011"=>return x"66";
			when "00110100"=>return x"28";
			when "00110101"=>return x"D9";				
			when "00110110"=>return x"24";
			when "00110111"=>return x"B2";
			when "00111000"=>return x"76";
			when "00111001"=>return x"5B";
			when "00111010"=>return x"A2";
			when "00111011"=>return x"49";
			when "00111100"=>return x"6D";
			when "00111101"=>return x"8B";
			when "00111110"=>return x"D1";
			when "00111111"=>return x"25";
			when "01000000"=>return x"72";
			when "01000001"=>return x"F8";
			when "01000010"=>return x"F6";
			when "01000011"=>return x"64";
			when "01000100"=>return x"86";
			when "01000101"=>return x"68";
			when "01000110"=>return x"98";
         when "01000111"=>return x"16";
			when "01001000"=>return x"D4";
			when "01001001"=>return x"A4";
			when "01001010"=>return x"5C";
			when "01001011"=>return x"CC";
			when "01001100"=>return x"5D";
			when "01001101"=>return x"65";
			when "01001110"=>return x"B6";
		   when "01001111"=>return x"92";
			when "01010000"=>return x"6C";
			when "01010001"=>return x"70";
			when "01010010"=>return x"48";
			when "01010011"=>return x"50";
			when "01010100"=>return x"FD";
			when "01010101"=>return x"ED";
			when "01010110"=>return x"b9";
			when "01010111"=>return x"da";
			when "01011000"=>return x"5e";
			when "01011001"=>return x"15";
			when "01011010"=>return x"46";
			when "01011011"=>return x"57";
			when "01011100"=>return x"a7";
			when "01011101"=>return x"8d";
			when "01011110"=>return x"9d";
			when "01011111"=>return x"84";
			when "01100000"=>return x"90";
			when "01100001"=>return x"d8";
			when "01100010"=>return x"ab";
			when "01100011"=>return x"00";
			when "01100100"=>return x"8c";
			when "01100101"=>return x"bc";
			when "01100110"=>return x"d3";
			when "01100111"=>return x"0a";
			when "01101000"=>return x"f7";
			when "01101001"=>return x"e4";
		   when "01101010"=>return x"58";
			when "01101011"=>return x"05";
			when "01101100"=>return x"b8";
			when "01101101"=>return x"b3";
			when "01101110"=>return x"45";
			when "01101111"=>return x"06";
			when "01110000"=>return x"d0";
			when "01110001"=>return x"2c";
			when "01110010"=>return x"1e";
			when "01110011"=>return x"8f";
			when "01110100"=>return x"ca";
			when "01110101"=>return x"3f";
			when "01110110"=>return x"0f";
		   when "01110111"=>return x"02";
			when "01111000"=>return x"c1";
			when "01111001"=>return x"af";
			when "01111010"=>return x"bd";
			when "01111011"=>return x"03";
			when "01111100"=>return x"01";
			when "01111101"=>return x"13";
			when "01111110"=>return x"8a";
			when "01111111"=>return x"6b";
			when "10000000"=>return x"3a";
			when "10000001"=>return x"91";
			when "10000010"=>return x"11";
			when "10000011"=>return x"41";
			when "10000100"=>return x"4f";
			when "10000101"=>return x"67";
			when "10000110"=>return x"dc";
			when "10000111"=>return x"ea";
			when "10001000"=>return x"97";
			when "10001001"=>return x"f2";
			when "10001010"=>return x"cf";
			when "10001011"=>return x"ce";
			when "10001100"=>return x"f0";
			when "10001101"=>return x"b4";
			when "10001110"=>return x"e6";
			when "10001111"=>return x"73";
			when "10010000"=>return x"96";
			when "10010001"=>return x"ac";
			when "10010010"=>return x"74";
			when "10010011"=>return x"22";
			when "10010100"=>return x"e7";
			when "10010101"=>return x"ad";
			when "10010110"=>return x"35";
			when "10010111"=>return x"85";
			when "10011000"=>return x"e2";
			when "10011001"=>return x"f9";
			when "10011010"=>return x"37";
			when "10011011"=>return x"e8";
			when "10011100"=>return x"1c";
			when "10011101"=>return x"75";
			when "10011110"=>return x"df";
			when "10011111"=>return x"6e";
			when "10100000"=>return x"47";
			when "10100001"=>return x"f1";
			when "10100010"=>return x"1a";
			when "10100011"=>return x"71";
			when "10100100"=>return x"1d";
			when "10100101"=>return x"29";
			when "10100110"=>return x"c5";
			when "10100111"=>return x"89";
			when "10101000"=>return x"6f";
			when "10101001"=>return x"b7";
			when "10101010"=>return x"62";
			when "10101011"=>return x"0e";
			when "10101100"=>return x"aa";
			when "10101101"=>return x"18";
			when "10101110"=>return x"be";
			when "10101111"=>return x"1b";
			when "10110000"=>return x"fc";
			when "10110001"=>return x"56";
			when "10110010"=>return x"3e";
			when "10110011"=>return x"4b";
			when "10110100"=>return x"c6";
			when "10110101"=>return x"d2";
			when "10110110"=>return x"79";
			when "10110111"=>return x"20";
			when "10111000"=>return x"9a";
			when "10111001"=>return x"db";
			when "10111010"=>return x"c0";
			when "10111011"=>return x"fe";
			when "10111100"=>return x"78";
			when "10111101"=>return x"cd";
			when "10111110"=>return x"5a";
			when "10111111"=>return x"f4";
			when "11000000"=>return x"1f";
			when "11000001"=>return x"dd";
			when "11000010"=>return x"a8";
			when "11000011"=>return x"33";
			when "11000100"=>return x"88";
			when "11000101"=>return x"07";
			when "11000110"=>return x"c7";
			when "11000111"=>return x"31";
			when "11001000"=>return x"b1";
			when "11001001"=>return x"12";
			when "11001010"=>return x"10";
			when "11001011"=>return x"59";
			when "11001100"=>return x"27";
			when "11001101"=>return x"80";
			when "11001110"=>return x"ec";
			when "11001111"=>return x"5f";
			when "11010000"=>return x"60";
			when "11010001"=>return x"51";
			when "11010010"=>return x"7f";
			when "11010011"=>return x"a9";
			when "11010100"=>return x"19";
			when "11010101"=>return x"b5";
			when "11010110"=>return x"4a";
		   when "11010111"=>return x"0d";
			when "11011000"=>return x"2d";
			when "11011001"=>return x"e5";
			when "11011010"=>return x"7a";
			when "11011011"=>return x"9f";
			when "11011100"=>return x"93";
			when "11011101"=>return x"c9";
			when "11011110"=>return x"9c";
			when "11011111"=>return x"ef";
			when "11100000"=>return x"a0";
			when "11100001"=>return x"e0";
			when "11100010"=>return x"3b";
			when "11100011"=>return x"4d";
			when "11100100"=>return x"ae";
			when "11100101"=>return x"2a";
			when "11100110"=>return x"f5";
			when "11100111"=>return x"b0";
			when "11101000"=>return x"c8";
			when "11101001"=>return x"eb";
			when "11101010"=>return x"bb";
			when "11101011"=>return x"3c";
			when "11101100"=>return x"83";
			when "11101101"=>return x"53";
			when "11101110"=>return x"99";
			when "11101111"=>return x"61";
			when "11110000"=>return x"17";
			when "11110001"=>return x"2b";
			when "11110010"=>return x"04";
			when "11110011"=>return x"7e";
			when "11110100"=>return x"ba";
			when "11110101"=>return x"77";
			when "11110110"=>return x"d6";
			when "11110111"=>return x"26";
			when "11111000"=>return x"e1";
			when "11111001"=>return x"69";
			when "11111010"=>return x"14";
			when "11111011"=>return x"63";
			when "11111100"=>return x"55";
			when "11111101"=>return x"21";
			when "11111110"=>return x"0c";
--			when "11111111"=>y<=x"16";
			
			when others=> return  x"7d";
end case;
  end function inv_sbox;
function inv_sub_bytes( sa:mat) return mat is
 variable p:mat; 
 begin
   p(0,0):=inv_sbox(sa(0,0));
   p(0,1):=inv_sbox(sa(0,1));
   p(0,2):=inv_sbox(sa(0,2));
   p(0,3):=inv_sbox(sa(0,3));
   p(1,0):=inv_sbox(sa(1,0));
   p(1,1):=inv_sbox(sa(1,1));
   p(1,2):=inv_sbox(sa(1,2));
   p(1,3):=inv_sbox(sa(1,3));
   p(2,0):=inv_sbox(sa(2,0));
   p(2,1):=inv_sbox(sa(2,1));
   p(2,2):=inv_sbox(sa(2,2));
   p(2,3):=inv_sbox(sa(2,3));
   p(3,0):=inv_sbox(sa(3,0));
   p(3,1):=inv_sbox(sa(3,1));
   p(3,2):=inv_sbox(sa(3,2));
   p(3,3):=inv_sbox(sa(3,3));
   
   return p;
  end function inv_sub_bytes;
  function sub_mix_columns( a,b,c,d:std_logic_vector) return std_logic_vector is
  variable p:std_logic_vector(7 downto 0);
  begin
  
  p(7):=a(4) xor a(5) xor a(6) xor b(4) xor b(6) xor b(7) xor c(4) xor c(5) xor c(7) xor d(4) xor d(7);
  
  p(6):=a(7) xor a(3) xor a(4) xor a(5) xor b(7) xor b(3) xor b(5) xor b(6) xor c(7) xor c(3) xor c(4) xor c(6) xor d(7) xor d(3) xor d(6);
  
  
  p(5):=a(7) xor a(6) xor a(2) xor a(7) xor a(3) xor a(4) xor b(7) xor b(6) xor b(2) xor b(4) xor b(5) xor c(7) xor c(6) xor c(2) xor c(7) xor c(3) xor c(5) xor d(7) xor d(6) xor d(2) xor d(5);
  
  p(4):=a(6) xor a(5) xor a(1) xor a(7) xor a(6) xor a(2) xor a(7) xor a(3) xor b(6) xor b(5) xor b(1) xor b(7) xor b(3) xor b(4) xor c(6) xor c(5) xor c(1) xor c(7) xor c(6) xor c(2) xor c(4) xor d(6) xor d(5) xor d(1) xor d(4);
  
  p(3):=a(7) xor a(5) xor a(0) xor a(6) xor a(1) xor a(7) xor a(2) xor b(7) xor b(5) xor b(0) xor b(7) xor b(2) xor b(3) xor c(7) xor c(5) xor c(0) xor c(6) xor c(1) xor c(3) xor d(7) xor d(5) xor d(0) xor d(3);
  
  p(2):=a(7) xor a(6) xor a(7) xor a(0) xor a(1) xor b(7) xor b(6) xor b(1) xor b(2) xor c(7) xor c(6) xor c(7) xor c(0) xor c(2) xor d(7) xor d(6) xor d(2);
  
  p(1):=a(6) xor a(5) xor a(7) xor a(6) xor a(7) xor a(0) xor b(6) xor b(5) xor b(7) xor b(0) xor b(1) xor c(6) xor c(5) xor c(7) xor c(6) xor c(1) xor d(6) xor d(5) xor d(1);
  
  p(0):=a(5) xor a(6) xor a(7) xor b(5) xor b(7) xor b(0) xor c(5) xor c(6) xor c(0) xor d(5) xor d(0);
 return p;
 end function sub_mix_columns;
  
  function inv_mix_columns( sa:mat) return mat is
 variable p:mat;
  begin
  p(0,0):=sub_mix_columns(sa(0,0),sa(1,0),sa(2,0),sa(3,0));
  p(1,0):=sub_mix_columns(sa(1,0),sa(2,0),sa(3,0),sa(0,0));
  p(2,0):=sub_mix_columns(sa(2,0),sa(3,0),sa(0,0),sa(1,0));
  p(3,0):=sub_mix_columns(sa(3,0),sa(0,0),sa(1,0),sa(2,0));
  
 p(0,1):=sub_mix_columns(sa(0,1),sa(1,1),sa(2,1),sa(3,1));
 p(1,1):=sub_mix_columns(sa(1,1),sa(2,1),sa(3,1),sa(0,1));
 p(2,1):=sub_mix_columns(sa(2,1),sa(3,1),sa(0,1),sa(1,1));
  p(3,1):=sub_mix_columns(sa(3,1),sa(0,1),sa(1,1),sa(2,1));
   
 p(0,2):=sub_mix_columns(sa(0,2),sa(1,2),sa(2,2),sa(3,2));
 p(1,2):=sub_mix_columns(sa(1,2),sa(2,2),sa(3,2),sa(0,2));
 p(2,2):=sub_mix_columns(sa(2,2),sa(3,2),sa(0,2),sa(1,2));
 p(3,2):=sub_mix_columns(sa(3,2),sa(0,2),sa(1,2),sa(2,2));
    
  p(0,3):=sub_mix_columns(sa(0,3),sa(1,3),sa(2,3),sa(3,3));
  p(1,3):=sub_mix_columns(sa(1,3),sa(2,3),sa(3,3),sa(0,3));
  p(2,3):=sub_mix_columns(sa(2,3),sa(3,3),sa(0,3),sa(1,3));
  p(3,3):=sub_mix_columns(sa(3,3),sa(0,3),sa(1,3),sa(2,3));
     

  
  
  
  return p;
  end function inv_mix_columns;
  function key_generation( k:std_logic_vector(127 downto 0); rcon:std_logic_vector(31 downto 0)) return std_logic_vector is
  variable p:std_logic_vector(127 downto 0);variable q:std_logic_vector(7 downto 0);
  begin
  p(127 downto 120):=sbox(k(31 downto 24));
  p(119 downto 112):=sbox(k(23 downto 16));
  p(111 downto 104):=sbox(k(15 downto 8));
  q:=p(127 downto 120);
  p(103 downto 96):=sbox(k(7 downto 0));
  p(127 downto 120):=p(119 downto 112);
  p(119 downto 112):=p(111 downto 104);
  p(111 downto 104):=p(103 downto 96);
  p(103 downto 96):=q;
  p(127 downto 96):=p(127 downto 96) xor rcon;
  p(127 downto 96):=p(127 downto 96) xor k(127 downto 96);
  p(95 downto 64):=p(127 downto 96) xor k(95 downto 64);
  p(63 downto 32):=p(95 downto 64) xor k(63 downto 32);
  p(31 downto 0):=p(63 downto 32) xor k(31 downto 0);
  
  return p;
      
      
      
      
      
      end function key_generation;
 function addroundkey(k:std_logic_vector(127 downto 0);m:mat) return mat is
    variable p:mat;
    begin
    p(0,0):=m(0,0) xor k(127 downto 120);
    p(1,0):=m(1,0) xor k(119 downto 112);
    p(2,0):=m(2,0) xor k(111 downto 104);
    p(3,0):=m(3,0) xor k(103 downto 96);
    p(0,1):=m(0,1) xor k(95 downto 88);
    p(1,1):=m(1,1) xor k(87 downto 80);
    p(2,1):=m(2,1) xor k(79 downto 72);
    p(3,1):=m(3,1) xor k(71 downto 64);
    p(0,2):=m(0,2) xor k(63 downto 56);
    p(1,2):=m(1,2) xor k(55 downto 48);
    p(2,2):=m(2,2) xor k(47 downto 40);
    p(3,2):=m(3,2) xor k(39 downto 32);
    p(0,3):=m(0,3) xor k(31 downto 24);
    p(1,3):=m(1,3) xor k(23 downto 16);
    p(2,3):=m(2,3) xor k(15 downto 8);
    p(3,3):=m(3,3) xor k(7 downto 0);
 return p;
 end function addroundkey;   
  

  
  begin

--sa(0,0)<=a(127 downto 120);sa(0,1)<=a(95 downto 88);sa(0,2)<=a(63 downto 56);sa(0,3)<=a(31 downto 24);
--sa(1,0)<=a(119 downto 112);sa(1,1)<=a(87 downto 80);sa(1,2)<=a(55 downto 48);sa(1,3)<=a(23 downto 16);
--sa(2,0)<=a(111 downto 104);sa(2,1)<=a(79 downto 72);sa(2,2)<=a(47 downto 40);sa(2,3)<=a(15 downto 8);
--sa(3,0)<=a(103 downto 96);sa(3,1)<=a(71 downto 64);sa(3,2)<=a(39 downto 32);sa(3,3)<=a(7 downto 0);




process(de)
variable rcon:row;variable sa:mat;variable sb:si;variable sq:row1;variable j:integer range 0 to 10:=10;variable sb1:mat;
begin
if de='1' then
rcon(0):=x"01000000";
rcon(1):=x"02000000";
rcon(2):=x"04000000";
rcon(3):=x"08000000";
rcon(4):=x"10000000";
rcon(5):=x"20000000";
rcon(6):=x"40000000";
rcon(7):=x"80000000";
rcon(8):=x"1b000000";
rcon(9):=x"36000000";
sa(0,0):=a(127 downto 120);sa(0,1):=a(95 downto 88);sa(0,2):=a(63 downto 56);sa(0,3):=a(31 downto 24);
sa(1,0):=a(119 downto 112);sa(1,1):=a(87 downto 80);sa(1,2):=a(55 downto 48);sa(1,3):=a(23 downto 16);
sa(2,0):=a(111 downto 104);sa(2,1):=a(79 downto 72);sa(2,2):=a(47 downto 40);sa(2,3):=a(15 downto 8);
sa(3,0):=a(103 downto 96);sa(3,1):=a(71 downto 64);sa(3,2):=a(39 downto 32);sa(3,3):=a(7 downto 0);
--sb(0):=addroundkey(key,sa);
sq(0):=key;
x1:for i in 0 to 9 loop
sq(i+1):=key_generation(sq(i),rcon(i));
end loop x1;
sb1:=addroundkey(sq(10),sa);
sb(37):=inv_sub_bytes(sb1);
sb(0):=inv_shift_rows(sb(37));


x2:for i in 0 to 8 loop
sb(4*i+1):=addroundkey(sq(10-i-1),sb(4*i));
sb(4*i+2):=inv_mix_columns(sb(4*i+1));
sb(4*i+3):=inv_sub_bytes(sb(4*i+2));

sb(4*i+4):=inv_shift_rows(sb(4*i+3));

end loop x2;
sb(39):=addroundkey(sq(0),sb(36));

b<=sb(39)(0,0)&sb(39)(1,0)&sb(39)(2,0)&sb(39)(3,0)&sb(39)(0,1)&sb(39)(1,1)&sb(39)(2,1)&sb(39)(3,1)&sb(39)(0,2)&sb(39)(1,2)&sb(39)(2,2)&sb(39)(3,2)&sb(39)(0,3)&sb(39)(1,3)&sb(39)(2,3)&sb(39)(3,3);
--b(127 downto 112)<=sb(2)(0,0)&sb(2)(1,0);
else
b<=(others=>'0');
end if;
end process;






























    



end Behavioral;
