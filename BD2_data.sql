INSERT INTO kategorie (nazwa_kategorii)
VALUES
    ('odzież'),
    ('obuwie'),
    ('akcesoria'),
    ('zabawki');

INSERT INTO producenci (nazwa)
VALUES
    ('Nike'),
    ('Adidas'),
    ('New Balance'),
    ('Converse'),
    ('Puma'),
    ('Vans'),
    ('Tommy Hilfiger'),
    ('Calvin Klein');

INSERT INTO rozmiary (rozmiar)
VALUES
    ('S'),
    ('M'),
    ('L'),
    ('XL'),
    ('XXL');

INSERT INTO adresy (miejscowosc, ulica, nr_domu, nr_lokalu, kod_pocztowy)
VALUES
    ('Warszawa', 'Aleja Jerozolimskie 142', '123', '456', '00-734'),
    ('Wrocław', 'ul. Świdnicka 25', '123', '456', '50-021'),
    ('Kraków', 'ul. Floriańska 45', '123', '456', '31-004'),
    ('Gdańsk', 'ul. Długa 1', '123', '456', '80-802');

INSERT INTO uzytkownicy (imie, nazwisko, login, haslo)
VALUES
    ('Jan', 'Kowalski', 'jankowalski', 'pass123'),
    ('Anna', 'Nowak', 'annanowak', 'pass456'),
    ('Paweł', 'Zieliński', 'pawełzieliński', 'pass789'),
    ('Magdalena', 'Wiśniewska', 'magdawisniewska', 'pass1011');

INSERT INTO klienci (id_osoba)
VALUES
    (1),
    (2),
    (3),
    (4);

INSERT INTO zamowienia (id_klienta, data_zlozenia_zamowienia, cena_zakupu)
VALUES
    (1, '2023-05-04', 123.45),
    (2, '2023-06-01', 456.78),
    (3, '2023-07-08', 789.10),
    (4, '2023-08-15', 101.12);

INSERT INTO produkty (id_producent, id_kategoria, id_rozmiar, nazwa_produktu, opis, cena_netto_sprzedazy, procent_vat_sprzedazy)
VALUES
    (7, 1, 1, 'Torebka damska', 'Elegancka torebka damska renomowanej marki Tommy Hilfiger. Wykonana z wysokiej jakości skóry.', 250.00, 23.00),
    (8, 1, 2, 'Spodnie jeansowe', 'Markowe spodnie jeansowe renomowanej marki Calvin Klein. Wykonane z trwałego i wygodnej tkaniny.', 125.00, 23.00),
    (1, 2, 3, 'Rzepy', 'Markowe buty sportowe renomowanej marki Nike. Idealne na co dzień i do uprawiania sportu.', 150.00, 23.00),
    (2, 2, 4, 'Skarpety zimowe', 'Komfortowe skarpety zimowe renomowanej marki Adidas. Wykonane z ciepłego i przyjemnego dla skóry materiału.', 35.00, 23.00),
    (3, 3, 1, 'Męska bluza', 'Gładka bluza męska renomowanej marki New Balance. Wykonana z miękkiego i przyjemnego dla skóry materiału.', 120.00, 23.00),
    (4, 4, 2, 'Czapka z daszkiem', 'Czapa z daszkiem renomowanej marki Converse. Idealna na rower, rolki lub inne sportowe aktywności.', 50.00, 23.00),
    (5, 5, 3, 'Plecak szkolny', 'Plecak szkolny renomowanej marki Puma. Wyposażony w wiele praktycznych kieszeni i przegród.', 80.00, 23.00),
    (6, 6, 4, 'Ręcznik plażowy', 'Ręcznik plażowy renomowanej marki Vans. Wykonany z miękkiej i szybkoschnącej tkaniny.', 45.00, 23.00);

INSERT INTO osoby_adresy (id_osoba, id_adres)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);
