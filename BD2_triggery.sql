CREATE TRIGGER zwolnienie_pracownika
AFTER UPDATE
ON pracownicy
FOR EACH ROW
BEGIN
	IF NEW.konto_aktywne <> OLD.konto_aktywne AND NEW.konto_aktywne IS FALSE THEN
		SET NEW.data_zwolnienia = CURRENT_DATE;
    END IF;
END;