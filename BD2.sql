CREATE TABLE klienci (
  id_klient SERIAL PRIMARY KEY,
  id_osoba INTEGER NOT NULL
);

CREATE TABLE zamowienia (
  id_zamowienia SERIAL PRIMARY KEY,
  id_klienta INTEGER NOT NULL,
  data_zlozenia_zamowienia DATE NOT NULL,
  data_przyjecia_zamowienia DATE,
  data_wysylki DATE,
  data_oplacenia DATE,
  cena_zakupu DECIMAL(10, 2) NOT NULL
);

CREATE TABLE adresy (
  id_adres SERIAL PRIMARY KEY,
  miejscowosc VARCHAR(50) NOT NULL,
  ulica VARCHAR(50),
  nr_domu VARCHAR(10) NOT NULL,
  nr_lokalu VARCHAR(10),
  kod_pocztowy CHAR(6) NOT NULL,
  "Column" INTEGER
);

CREATE TABLE kategorie (
  id_kategoria SERIAL PRIMARY KEY,
  nazwa_kategorii VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE produkty (
  id_produkt SERIAL PRIMARY KEY,
  id_producent INTEGER NOT NULL,
  id_kategoria INTEGER NOT NULL,
  id_rozmiar INTEGER NOT NULL,
  nazwa_produktu VARCHAR(45),
  opis VARCHAR(200),
  cena_netto_sprzedazy DECIMAL(10, 2),
  procent_vat_sprzedazy DECIMAL(10, 2)
);

CREATE TABLE pracownicy (
  id_pracownik SERIAL PRIMARY KEY,
  id_osoba INTEGER NOT NULL,
  konto_aktywne BIT NOT NULL,
  data_zatrudnienia DATE,
  data_zwolnienia DATE
);

CREATE TABLE zwroty (
  id_zwrotu SERIAL PRIMARY KEY,
  id_powiazanego_zamowienia INTEGER NOT NULL,
  data_zlozenia DATE NOT NULL,
  data_realizacji DATE
);

CREATE TABLE uzytkownicy (
  id_osoba SERIAL PRIMARY KEY,
  Login VARCHAR(64) NOT NULL UNIQUE,
  Haslo VARCHAR(64) NOT NULL,
  Imie VARCHAR(20),
  Nazwisko VARCHAR(50)
);

CREATE TABLE osoby_adresy (
  id_osoba INTEGER NOT NULL,
  id_adres INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_adres)
);

CREATE TABLE producenci (
  id_producent SERIAL PRIMARY KEY,
  nazwa VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE adresy_email (
  id_email SERIAL PRIMARY KEY,
  email VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE numery_telefonu (
  id_telefon SERIAL PRIMARY KEY,
  numer_telefonu INTEGER NOT NULL UNIQUE
);

CREATE TABLE numery_telefonu_osoby (
  id_osoba INTEGER NOT NULL,
  id_telefon INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_telefon)
);

CREATE TABLE adresy_email_osoby (
  id_osoba INTEGER NOT NULL,
  id_email INTEGER NOT NULL,
  PRIMARY KEY (id_osoba, id_email)
);

CREATE TABLE zamowienia_produkty (
  id_zamowienia INTEGER NOT NULL,
  id_produkt INTEGER NOT NULL,
  ilosc INTEGER NOT NULL,
  cena_produktu DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_zamowienia, id_produkt)
);

CREATE TABLE zwroty_produkty (
  id_zwrotu INTEGER NOT NULL,
  id_produktu INTEGER NOT NULL,
  ilosc INTEGER NOT NULL,
  cena DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_zwrotu, id_produktu)
);

CREATE TABLE rozmiary (
  id_rozmiar SERIAL PRIMARY KEY,
  rozmiar VARCHAR(10) NOT NULL UNIQUE
);

ALTER TABLE klienci ADD CONSTRAINT FKKlienci734610 FOREIGN KEY (id_osoba) REFERENCES uzytkownicy (id_osoba);

ALTER TABLE pracownicy ADD CONSTRAINT FKPracownicy613837 FOREIGN KEY (id_osoba) REFERENCES uzytkownicy (id_osoba);

ALTER TABLE osoby_adresy ADD CONSTRAINT FKOsoby_Adre117052 FOREIGN KEY (id_osoba) REFERENCES uzytkownicy (id_osoba);

ALTER TABLE osoby_adresy ADD CONSTRAINT FKOsoby_Adre207878 FOREIGN KEY (id_adres) REFERENCES adresy (id_adres);

ALTER TABLE numery_telefonu_osoby ADD CONSTRAINT "FKNumery tel83454" FOREIGN KEY (id_telefon) REFERENCES numery_telefonu (id_telefon);

ALTER TABLE numery_telefonu_osoby ADD CONSTRAINT "FKNumery tel222680" FOREIGN KEY (id_osoba) REFERENCES uzytkownicy (id_osoba);

ALTER TABLE adresy_email_osoby ADD CONSTRAINT "FKAdresy ema219072" FOREIGN KEY (id_email) REFERENCES adresy_email (id_email);

ALTER TABLE adresy_email_osoby ADD CONSTRAINT "FKAdresy ema416738" FOREIGN KEY (id_osoba) REFERENCES uzytkownicy (id_osoba);

ALTER TABLE zamowienia ADD CONSTRAINT FKZamowienia604264 FOREIGN KEY (id_klienta) REFERENCES klienci (id_klient);

ALTER TABLE zamowienia_produkty ADD CONSTRAINT FKZamowienia899522 FOREIGN KEY (id_zamowienia) REFERENCES zamowienia (id_zamowienia);

ALTER TABLE zamowienia_produkty ADD CONSTRAINT FKZamowienia303091 FOREIGN KEY (id_produkt) REFERENCES produkty (id_produkt);

ALTER TABLE zwroty_produkty ADD CONSTRAINT FKZwrot_Prod755279 FOREIGN KEY (id_zwrotu) REFERENCES zwroty (id_zwrotu);

ALTER TABLE zwroty_produkty ADD CONSTRAINT FKZwrot_Prod905821 FOREIGN KEY (id_produktu) REFERENCES produkty (id_produkt);

ALTER TABLE zwroty ADD CONSTRAINT FKZwrot600624 FOREIGN KEY (id_powiazanego_zamowienia) REFERENCES zamowienia (id_zamowienia);

ALTER TABLE produkty ADD CONSTRAINT FKProdukty909807 FOREIGN KEY (id_kategoria) REFERENCES kategorie (id_kategoria);

ALTER TABLE produkty ADD CONSTRAINT FKProdukty16635 FOREIGN KEY (id_producent) REFERENCES producenci (id_producent);

ALTER TABLE produkty ADD CONSTRAINT FKProdukty440814 FOREIGN KEY (id_rozmiar) REFERENCES rozmiary (id_rozmiar));
