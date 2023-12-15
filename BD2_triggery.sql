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
	SET 

END;