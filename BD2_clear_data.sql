-- Skrypt czyszczący dane ze wszystkich tabel bazy danych i resetujący automatyczne id nadawane wpisom

-- Wyczyść dane z tabeli `kategorie`
DELETE FROM kategorie;

-- Zresetuj sekwencję generującą ID dla tabeli `kategorie`
ALTER SEQUENCE seq_kategorie_id RESTART;

-- Wyczyść dane z tabeli `producenci`
DELETE FROM producenci;

-- Zresetuj sekwencję generującą ID dla tabeli `producenci`
ALTER SEQUENCE seq_producenci_id RESTART;

-- Wyczyść dane z tabeli `rozmiary`
DELETE FROM rozmiary;

-- Zresetuj sekwencję generującą ID dla tabeli `rozmiary`
ALTER SEQUENCE seq_rozmiary_id RESTART;

-- Wyczyść dane z tabeli `adresy`
DELETE FROM adresy;

-- Zresetuj sekwencję generującą ID dla tabeli `adresy`
ALTER SEQUENCE seq_adresy_id RESTART;

-- Wyczyść dane z tabeli `uzytkownicy`
DELETE FROM uzytkownicy;

-- Zresetuj sekwencję generującą ID dla tabeli `uzytkownicy`
ALTER SEQUENCE seq_uzytkownicy_id RESTART;

-- Wyczyść dane z tabeli `klienci`
DELETE FROM klienci;

-- Zresetuj sekwencję generującą ID dla tabeli `klienci`
ALTER SEQUENCE seq_klienci_id RESTART;

-- Wyczyść dane z tabeli `zamowienia`
DELETE FROM zamowienia;

-- Zresetuj sekwencję generującą ID dla tabeli `zamowienia`
ALTER SEQUENCE seq_zamowienia_id RESTART;

-- Wyczyść dane z tabeli `zamowienia_produkty`
DELETE FROM zamowienia_produkty;

-- Zresetuj sekwencję generującą ID dla tabeli `zamowienia_produkty`
ALTER SEQUENCE seq_zamowienia_produkty_id RESTART;

-- Wyczyść dane z tabeli `zwroty`
DELETE FROM zwroty;

-- Zresetuj sekwencję generującą ID dla tabeli `zwroty`
ALTER SEQUENCE seq_zwroty_id RESTART;
