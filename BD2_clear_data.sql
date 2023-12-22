DELETE FROM zwroty_produkty;

DELETE FROM zamowienia_produkty;

DELETE FROM uzytkownicy_adresy;

DELETE FROM uzytkownicy_adresy_email;

DELETE FROM uzytkownicy_numery_telefonu;


DELETE FROM produkty;
ALTER SEQUENCE produkty_id_produktu_seq RESTART;

DELETE FROM producenci;
ALTER SEQUENCE producenci_id_producenta_seq RESTART;

DELETE FROM kategorie;
ALTER SEQUENCE kategorie_id_kategorii_seq RESTART;

DELETE FROM rozmiary;
ALTER SEQUENCE rozmiary_id_rozmiaru_seq RESTART;


DELETE FROM zwroty;
ALTER SEQUENCE zwroty_id_zwrotu_seq RESTART;

DELETE FROM zamowienia;
ALTER SEQUENCE zamowienia_id_zamowienia_seq RESTART;


DELETE FROM klienci;
ALTER SEQUENCE klienci_id_klienta_seq RESTART;

DELETE FROM pracownicy;
ALTER SEQUENCE pracownicy_id_pracownik_seq RESTART;


DELETE FROM adresy;
ALTER SEQUENCE adresy_id_adresu_seq RESTART;

DELETE FROM adresy_email;
ALTER SEQUENCE adresy_email_id_email_seq RESTART;

DELETE FROM numery_telefonu;
ALTER SEQUENCE numery_telefonu_id_telefonu_seq RESTART;

DELETE FROM uzytkownicy;
ALTER SEQUENCE uzytkownicy_id_uzytkownika_seq RESTART;
