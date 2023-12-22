INSERT INTO kategorie (kategoria)
VALUES
    ('bielizna'),
    ('bluzki'),
	('spodnie'),
    ('nakrycia głowy');

INSERT INTO producenci (producent)
VALUES
    ('Cotton World'),
    ('Cropp'),
    ('Helikon-Tex');

INSERT INTO rozmiary (rozmiar)
VALUES
    ('S'),
    ('M'),
    ('L'),
    ('XL'),
    ('XXL');

INSERT INTO produkty (id_producenta, id_kategorii, id_rozmiaru, nazwa, opis, ilosc_w_magazynie, cena_netto_sprzedazy, procent_vat_sprzedazy)
VALUES
    (1, 1, 2, 'Bielizna męska', 'Wytrzymała bielizna męska w przystepnej cenie. Wykonane z bawełny.', 100, 15.00, 23.00),
    (2, 2, 2, 'Koszulka męska zabawna rybacka', 'Wspaniałej jakości koszulka męska z napisem "Fish fear me, women want me!". Doskonały prezent na dzień chłopaka. Wykonana z mieszanki bawełny i poliestru.',24 , 50.00, 23.00),
    (3, 3, 3, 'Spodnie outdoorowe UTP czarne', 'Wytrzymałe i wygodne spodnie outdoorowe marki Helikon-Tex. Wykonane z patentowanego materiału Rip-Stop, zdolnego wytrzymać nawet najbardziej nieprzebytą dzicz.', 16, 300.00, 23.00),
    (3, 4, 2, 'Czapka patrolówka', 'Wygodna czapka chroniąca przed słońcem polskiej firmy Helikon-Tex. Wykonana z patentowanego matriału Rip-Stop. Posaida regulowane zapięcie na rzep.', 10, 35.00, 23.00);
