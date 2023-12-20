CREATE USER guest;

CREATE USER client LOGIN PASSWORD 'access';

CREATE USER admin SUPERUSER LOGIN PASSWORD 'admin';

<<<<<<< HEAD
GRANT
SELECT
  ON TABLE produkty,
  rozmiary,
  producenci,
  kategorie,
  detale_produktow TO guest;

GRANT
SELECT
  ON ALL TABLES IN SCHEMA "public" TO client;
=======

GRANT SELECT ON TABLE produkty, rozmiary, producenci, kategorie, detale_produktow TO guest;

GRANT SELECT ON ALL TABLES IN SCHEMA "public" TO client;
>>>>>>> 7e23f40c08b40b0a37309e5cb340a2a4939b045d

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
<<<<<<< HEAD
),
logowanie(
  arg_login VARCHAR(64),
  arg_haslo VARCHAR(64)
) TO client,
guest;

GRANT
INSERT
  ON TABLE klienci TO guest,
  client;

GRANT
INSERT
  ON TABLE zamowienia,
  zamowienia_produkty TO client;
=======
) TO client, guest;

GRANT INSERT ON TABLE klienci TO guest, client;

GRANT INSERT ON TABLE zamowienia, zamowienia_produkty TO client;
>>>>>>> 7e23f40c08b40b0a37309e5cb340a2a4939b045d
