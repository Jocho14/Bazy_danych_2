CREATE TRIGGER zwolnienie_pracownika
AFTER UPDATE
ON pracownicy
FOR EACH ROW
BEGIN
	IF NEW.data_zwolnienia IS NOT NULL THEN
		SET NEW.konto_aktywne = FALSE;
    END IF;
END;

CREATE TRIGGER kupno_produktow
AFTER INSERT
ON zamowienia_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie - NEW.ilosc
	WHERE produkty.id_produktu = NEW.id_produktu;
END;

CREATE TRIGGER cofniecie_kupna_produktow
AFTER DELETE
ON zamowienia_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie + OLD.ilosc
	WHERE produkty.id_produktu = OLD.id_produktu;
END;