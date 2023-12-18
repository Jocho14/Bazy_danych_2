CREATE OR REPLACE FUNCTION dodaj_uzytkownika( --100% nie działa
  login VARCHAR(64),
  haslo VARCHAR(64),
  imie VARCHAR(20),
  nazwisko VARCHAR(50),
  adres VARCHAR(255),
  email VARCHAR(64),
  numer_telefonu INTEGER
)
RETURNS VOID
AS
$$
BEGIN

  -- Dodaj użytkownika do tabeli uzytkownicy
  INSERT INTO uzytkownicy (
    login,
    haslo,
    imie,
    nazwisko
  ) VALUES (
    login,
    haslo,
    imie,
    nazwisko
  );

  -- Pobierz identyfikator użytkownika
  SELECT id_uzytkownika
  FROM uzytkownicy
  WHERE login = login
  INTO id_uzytkownika;

  -- Dodaj adres do tabeli adresy
  IF adres IS NOT NULL THEN
    INSERT INTO adresy (
      miejscowosc,
      ulica,
      nr_domu,
      nr_lokalu,
      kod_pocztowy
    ) VALUES (
      adres_miejscowosc,
      adres_ulica,
      adres_nr_domu,
      adres_nr_lokalu,
      adres_kod_pocztowy
    );

    SELECT id_adresu
    FROM adresy
    WHERE miejscowosc = adres_miejscowosc
      AND ulica = adres_ulica
      AND nr_domu = adres_nr_domu
      AND nr_lokalu = adres_nr_lokalu
      AND kod_pocztowy = adres_kod_pocztowy
    INTO id_adresu;

    INSERT INTO uzytkownicy_adresy (
      id_uzytkownika,
      id_adresu
    ) VALUES (
      id_uzytkownika,
      id_adresu
    );
  END IF;

  -- Dodaj adres email do tabeli adresy_email
  IF email IS NOT NULL THEN
    INSERT INTO adresy_email (
      email
    ) VALUES (
      email
    );

    SELECT id_email
    FROM adresy_email
    WHERE email = email
    INTO id_email;

    INSERT INTO uzytkownicy_adresy_email (
      id_uzytkownika,
      id_email
    ) VALUES (
      id_uzytkownika,
      id_email
    );
  END IF;

  -- Dodaj numer telefonu do tabeli numery_telefonu
  IF numer_telefonu IS NOT NULL THEN
    INSERT INTO numery_telefonu (
      numer_telefonu
    ) VALUES (
      numer_telefonu
    );

    SELECT id_telefonu
    FROM numery_telefonu
    WHERE numer_telefonu = numer_telefonu
    INTO id_telefonu;

    INSERT INTO uzytkownicy_numery_telefonu (
      id_uzytkownika,
      id_telefonu
    ) VALUES (
      id_uzytkownika,
      id_telefonu
    );
  END IF;

END;
$$
LANGUAGE plpgsql;
