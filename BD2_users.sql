CREATE USER guest;

GRANT SELECT ON TABLE produkty, rozmiary, producenci, kategorie, detale_produktow TO guest;

CREATE USER client;

GRANT SELECT ON DATABASE sklep TO client;

GRANT INSERT ON zamowienia, zamowienia_produkty, zwroty, zwroty_produkty TO client; --not finished - waiting for procedures

