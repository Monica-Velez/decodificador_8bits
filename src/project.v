library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DECODIFICADOR_8BITS is
    Port (
        BIN : in STD_LOGIC_VECTOR(7 downto 0);

        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end DECODIFICADOR_8BITS;

architecture Funcional of DECODIFICADOR_8BITS is

    signal numero : INTEGER range 0 to 255;
    signal unidades : INTEGER range 0 to 9;
    signal decenas : INTEGER range 0 to 9;
    signal centenas : INTEGER range 0 to 2;

begin

    numero <= to_integer(unsigned(BIN));

    unidades <= numero mod 10;
    decenas <= (numero / 10) mod 10;
    centenas <= numero / 100;

    process(unidades, decenas, centenas)
    begin

        case unidades is
            when 0 => HEX0 <= "1000000";
            when 1 => HEX0 <= "1111001";
            when 2 => HEX0 <= "0100100";
            when 3 => HEX0 <= "0110000";
            when 4 => HEX0 <= "0011001";
            when 5 => HEX0 <= "0010010";
            when 6 => HEX0 <= "0000010";
            when 7 => HEX0 <= "1111000";
            when 8 => HEX0 <= "0000000";
            when 9 => HEX0 <= "0010000";
            when others => HEX0 <= "1111111";
        end case;

        case decenas is
            when 0 => HEX1 <= "1000000";
            when 1 => HEX1 <= "1111001";
            when 2 => HEX1 <= "0100100";
            when 3 => HEX1 <= "0110000";
            when 4 => HEX1 <= "0011001";
            when 5 => HEX1 <= "0010010";
            when 6 => HEX1 <= "0000010";
            when 7 => HEX1 <= "1111000";
            when 8 => HEX1 <= "0000000";
            when 9 => HEX1 <= "0010000";
            when others => HEX1 <= "1111111";
        end case;

        case centenas is
            when 0 => HEX2 <= "1000000";
            when 1 => HEX2 <= "1111001";
            when 2 => HEX2 <= "0100100";
            when others => HEX2 <= "1111111";
        end case;

    end process;

end Funcional;
