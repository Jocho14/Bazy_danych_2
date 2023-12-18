CREATE TRIGGER tri_zwolnienie_pracownika
AFTER UPDATE
ON pracownicy
FOR EACH ROW
BEGIN
	IF NEW.data_zwolnienia IS NOT NULL THEN
		UPDATE pracownicy
		SET NEW.konto_aktywne = FALSE
		WHERE id_pracownik = NEW.id_pracownik;
    END IF;
END;

CREATE TRIGGER tri_kupno_produktow
AFTER INSERT
ON zamowienia_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie - NEW.ilosc
	WHERE produkty.id_produktu = NEW.id_produktu;
END;

CREATE TRIGGER tri_cofniecie_kupna_produktow
AFTER DELETE
ON zamowienia_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie + OLD.ilosc
	WHERE produkty.id_produktu = OLD.id_produktu;
END;

CREATE TRIGGER tri_zwrot_produktow
AFTER INSERT
ON zwroty_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie + NEW.ilosc
	WHERE produkty.id_produktu = NEW.id_produktu;
END;

CREATE TRIGGER tri_cofniecie_zwrot_produktow
AFTER DELETE
ON zwroty_produkty
FOR EACH ROW
BEGIN
	UPDATE produkty 
	SET produkty.ilosc_w_magazynie = produkty.ilosc_w_magazynie - OLD.ilosc
	WHERE produkty.id_produktu = OLD.id_produktu;
END;


CREATE OR REPLACE FUNCTION wylicz_cene_zamowienia() RETURNS TRIGGER AS $$
DECLARE
  total_amount DECIMAL(10, 2);
BEGIN
  SELECT SUM(cena_produktu * ilosc) INTO total_amount
  FROM zamowienia_produkty
  WHERE id_zamowienia = NEW.id_zamowienia;

  UPDATE zamowienia
  SET cena_zakupu = total_amount
  WHERE id_zamowienia = NEW.id_zamowienia;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tri_cena_zamowienia
AFTER INSERT OR UPDATE ON zamowienia_produkty
FOR EACH ROW EXECUTE FUNCTION wylicz_cene_zamowienia();