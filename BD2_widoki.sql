CREATE VIEW historia_zamowien AS
SELECT
    zamowienia.id_zamowienia,
    zamowienia.id_klienta,
    produkty.nazwa_produktu,
    zamowienia.data_zlozenia_zamowienia
FROM
    zamowienia
JOIN
    zamowienia_produkty ON zamowienia.id_zamowienia = zamowienia_produkty.id_zamowienia
JOIN
    produkty ON zamowienia_produkty.id_produktu = produkty.id_produktu;
