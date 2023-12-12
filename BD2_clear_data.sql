DELETE FROM zwroty;
ALTER SEQUENCE zwroty_id_zwrotu_seq RESTART;

DELETE FROM zamowienia_produkty;

DELETE FROM zamowienia;
ALTER SEQUENCE zamowienia_id_zamowienia_seq RESTART;

DELETE FROM produkty;
ALTER SEQUENCE produkty_id_produkt_seq RESTART;

DELETE FROM kategorie;
ALTER SEQUENCE kategorie_id_kategoria_seq RESTART;

DELETE FROM producenci;
ALTER SEQUENCE producenci_id_producent_seq RESTART;

DELETE FROM rozmiary;
ALTER SEQUENCE rozmiary_id_rozmiar_seq RESTART;


DELETE FROM osoby_adresy;

DELETE FROM adresy;
ALTER SEQUENCE adresy_id_adres_seq RESTART;

DELETE FROM uzytkownicy;
ALTER SEQUENCE uzytkownicy_id_osoba_seq RESTART;

DELETE FROM klienci;
ALTER SEQUENCE klienci_id_klient_seq RESTART;