CREATE USER guest;

GRANT SELECT ON TABLE produkty, rozmiary, producenci, kategorie, detale_produktow TO guest;

CREATE USER client LOGIN PASSWORD 'access';

GRANT SELECT ON DATABASE sklep TO client;

GRANT EXECUTE ON FUNCTION dodaj_uzytkownika(
  arg_login VARCHAR(64),
  arg_haslo VARCHAR(64),
  arg_imie VARCHAR(20),
  arg_nazwisko VARCHAR(50),
  arg_email VARCHAR(64),
  arg_numer_telefonu INTEGER,
  arg_adres_miejscowosc VARCHAR(50),
  arg_adres_ulica VARCHAR(50),
  arg_adres_nr_domu VARCHAR(10),
  arg_adres_nr_lokalu VARCHAR(10),
  arg_adres_kod_pocztowy VARCHAR(6)
) TO client;

GRANT INSERT ON TABLE klienci, zamowienia, zamowienia_produkty TO client;

CREATE USER admin SUPERUSER LOGIN PASSWORD 'admin';
