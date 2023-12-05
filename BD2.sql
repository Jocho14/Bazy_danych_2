CREATE TABLE Klienci (
  id_klient SERIAL PRIMARY KEY,
  id_osoba INTEGER NOT NULL
);

CREATE TABLE Zamowienia (
  id_zamowienia SERIAL PRIMARY KEY,
  id_klienta INTEGER NOT NULL,
  data_zlozenia_zamowienia DATE NOT NULL,
  data_przyjecia_zamowienia DATE,
  data_wysylki DATE,
  data_oplacenia DATE,
  cena_zakupu DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Adresy (
  id_adres SERIAL PRIMARY KEY,
  miejscowosc VARCHAR(50) NOT NULL,
  ulica VARCHAR(50),
  nr_domu VARCHAR(10) NOT NULL,
  nr_lokalu VARCHAR(10),
  kod_pocztowy CHAR(6) NOT NULL,
  "Column" INTEGER
);

CREATE TABLE Kategorie (
  id_kategoria SERIAL PRIMARY KEY,
  nazwa_kategorii VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE Produkty (
  id_produkt SERIAL PRIMARY KEY,
  id_producent INTEGER NOT NULL,
  id_kategoria INTEGER NOT NULL,
  id_rozmiar INTEGER NOT NULL,
  nazwa_produktu VARCHAR(45),
  opis VARCHAR(200),
  cena_netto_sprzedazy DECIMAL(10, 2),
  procent_vat_sprzedazy DECIMAL(10, 2)
);

CREATE TABLE Pracownicy (
  id_pracownik SERIAL PRIMARY KEY,
  id_osoba INTEGER NOT NULL,
  konto_aktywne BIT NOT NULL,
  data_zatrudnienia DATE,
  data_zwolnienia DATE
);

CREATE TABLE Zwrot (
  id_zwrotu SERIAL PRIMARY KEY,
  id_powiazanego_zamowienia INTEGER NOT NULL,
  data_zlozenia DATE NOT NULL,
  data_realizacji DATE
);

CREATE TABLE Uzytkownik (
  id_osoba SERIAL PRIMARY KEY,
  Login VARCHAR(64) NOT NULL UNIQUE,
  Haslo VARCHAR(64) NOT NULL,
  Imie VARCHAR(20),
  Nazwisko VARCHAR(50)
);

CREATE TABLE Osoby_Adresy (
  id_osoba INTEGER NOT NULL,
  id_adres INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_adres)
);

CREATE TABLE Producent (
  id_producent SERIAL PRIMARY KEY,
  nazwa VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE "Adresy email" (
  id_email SERIAL PRIMARY KEY,
  email VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE "Numery telefonu" (
  id_telefon SERIAL PRIMARY KEY,
  numer_telefonu INTEGER NOT NULL UNIQUE
);

CREATE TABLE "Numery telefonu_Osoby" (
  id_osoba INTEGER NOT NULL,
  id_telefon INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_telefon)
);

CREATE TABLE "Adresy email_Osoby" (
  id_osoba INTEGER NOT NULL,
  id_email INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_email)
);

CREATE TABLE Zamowienia_Produkty (
  id_zamowienia INTEGER NOT NULL,
  id_produkt INTEGER NOT NULL,
  ilosc INTEGER NOT NULL,
  cena_produktu DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_zamowienia, id_produkt)
);

CREATE TABLE Zwrot_Produkty (
  id_zwrotu INTEGER NOT NULL,
  id_produktu INTEGER NOT NULL,
  ilosc INTEGER NOT NULL,
  cena DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_zwrotu, id_produktu)
);

CREATE TABLE Rozmiar (
  id_rozmiar SERIAL PRIMARY KEY,
  rozmiar VARCHAR(10) NOT NULL UNIQUE
);

CREATE VIEW "View" AS
SELECT data_zwolnienia
FROM Pracownicy;

ALTER TABLE Klienci ADD CONSTRAINT FKKlienci734610 FOREIGN KEY (id_osoba) REFERENCES Uzytkownik (id_osoba);

ALTER TABLE Pracownicy ADD CONSTRAINT FKPracownicy613837 FOREIGN KEY (id_osoba) REFERENCES Uzytkownik (id_osoba);

ALTER TABLE Osoby_Adresy ADD CONSTRAINT FKOsoby_Adre117052 FOREIGN KEY (id_osoba) REFERENCES Uzytkownik (id_osoba);

ALTER TABLE Osoby_Adresy ADD CONSTRAINT FKOsoby_Adre207878 FOREIGN KEY (id_adres) REFERENCES Adresy (id_adres);

ALTER TABLE "Numery telefonu_Osoby" ADD CONSTRAINT "FKNumery tel83454" FOREIGN KEY (id_telefon) REFERENCES "Numery telefonu" (id_telefon);

ALTER TABLE "Numery telefonu_Osoby" ADD CONSTRAINT "FKNumery tel222680" FOREIGN KEY (id_osoba) REFERENCES Uzytkownik (id_osoba);

ALTER TABLE "Adresy email_Osoby" ADD CONSTRAINT "FKAdresy ema219072" FOREIGN KEY (id_email) REFERENCES "Adresy email" (id_email);

ALTER TABLE "Adresy email_Osoby" ADD CONSTRAINT "FKAdresy ema416738" FOREIGN KEY (id_osoba) REFERENCES Uzytkownik (id_osoba);

ALTER TABLE Zamowienia ADD CONSTRAINT FKZamowienia604264 FOREIGN KEY (id_klienta) REFERENCES Klienci (id_klient);

ALTER TABLE Zamowienia_Produkty ADD CONSTRAINT FKZamowienia899522 FOREIGN KEY (id_zamowienia) REFERENCES Zamowienia (id_zamowienia);

ALTER TABLE Zamowienia_Produkty ADD CONSTRAINT FKZamowienia303091 FOREIGN KEY (id_produkt) REFERENCES Produkty (id_produkt);

ALTER TABLE Zwrot_Produkty ADD CONSTRAINT FKZwrot_Prod755279 FOREIGN KEY (id_zwrotu) REFERENCES Zwrot (id_zwrotu);

ALTER TABLE Zwrot_Produkty ADD CONSTRAINT FKZwrot_Prod905821 FOREIGN KEY (id_produktu) REFERENCES Produkty (id_produkt);

ALTER TABLE Zwrot ADD CONSTRAINT FKZwrot600624 FOREIGN KEY (id_powiazanego_zamowienia) REFERENCES Zamowienia (id_zamowienia);

ALTER TABLE Produkty ADD CONSTRAINT FKProdukty909807 FOREIGN KEY (id_kategoria) REFERENCES Kategorie (id_kategoria);

ALTER TABLE Produkty ADD CONSTRAINT FKProdukty16635 FOREIGN KEY (id_producent) REFERENCES Producent (id_producent);

ALTER TABLE Produkty ADD CONSTRAINT FKProdukty440814 FOREIGN KEY (id_rozmiar) REFERENCES Rozmiar (id_rozmiar));
