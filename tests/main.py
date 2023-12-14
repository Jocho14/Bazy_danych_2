"""
INSTRUKCJA
1. pip install psycopg2
2. Zmień na odpowiednie ścieżki do plików .sql (w sekcji ścieżki do plików SQL)
"""
import psycopg2
import time


def execute_sql_from_file(cursor, file_path):
    """Wykonuje skrypt SQL z podanego pliku."""
    with open(file_path, 'r') as file:
        sql_script = file.read()
    cursor.execute(sql_script)


def sequence_exists(cursor, sequence_name):
    """Sprawdza, czy sekwencja istnieje w bazie danych."""
    cursor.execute("SELECT EXISTS(SELECT * FROM pg_class WHERE relkind = 'S' AND relname = %s)", (sequence_name,))
    return cursor.fetchone()[0]

def main():
    # Parametry połączenia
    host = "localhost"
    dbname = "bazaDanych"
    user = "postgres"
    password = "postgres"

    # Lista ścieżek do plików SQL
    sql_file_paths = ['C:/Users/HP/Desktop/bazaDanychPliki/randomData/uzytkownicy.sql',
                      'C:/Users/HP/Desktop/bazaDanychPliki/randomData/klienci.sql',
                      'C:/Users/HP/Desktop/bazaDanychPliki/randomData/zamowienia.sql']

    # Scieżka do pliku czyszczącego dane
    sql_delete_data_path = 'C:/Users/HP/Desktop/bazaDanychPliki/BD2_clear_data.sql'

    try:
        # Nawiązanie połączenia
        conn = psycopg2.connect(host=host, dbname=dbname, user=user, password=password)
        cursor = conn.cursor()

        with open(sql_delete_data_path, 'r') as file:
            for line in file:
                line = line.strip()  # Usunięcie białych znaków na początku i na końcu linii
                if not line:  # Pomiń puste linie
                    continue
                # Sprawdzenie czy linia zawiera 'ALTER SEQUENCE'
                if 'ALTER SEQUENCE' in line:
                    sequence_name = line.split()[2]  # Założenie, że nazwa sekwencji jest trzecim słowem
                    if sequence_exists(cursor, sequence_name):
                        cursor.execute(line)
                else:
                    cursor.execute(line)

            # Zatwierdzenie transakcji
        conn.commit()

        for file_path in sql_file_paths:
            start_time = time.time()

            # Wykonanie skryptu z każdego pliku
            execute_sql_from_file(cursor, file_path)

            # Zatwierdzenie transakcji
            conn.commit()

            end_time = time.time()
            print(f"Czas wykonania skryptu z {file_path}: {end_time - start_time} sekund.")

    except Exception as e:
        print(f"Wystąpił błąd: {e}")
    finally:
        # Zamknięcie połączenia i kursora
        if conn is not None:
            cursor.close()
            conn.close()


if __name__ == "__main__":
    main()
