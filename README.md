# MwSt
Berechnung des Nettobetrags nach Abzug der Mehrwertsteuer 19%. Und die Ergebnisse in eine CSV-Datei exportieren.

# Testschritte:
- Geben Sie dafür Ihren Betrag in das dafür vorgesehene Feld ein.
- Drücken Sie die Taste Steuerabzug.
- Den Nettobetrag ohne MwSt. finden Sie im dafür vorgesehenen Feld.
- Drücken Sie die Taste In CSV-Datei speichern. 
  um die CSV-Datei in das Verzeichnis zu exportieren.
 
# achten Sie bitte darauf:
- Der Betrag soll ein positiver Wert sein, negative Werte werden nicht akzeptiert.
- Das Programm nur den Komma-Dezimaltrenner, der mit FormatSettings(de-DE) konform ist.
- Wenn das Verzeichnis nicht ausgewählt ist, wird die Datei in das Exe-Verzeichnis exportiert.

# Examples
- 'AbzugRech(100)'  will return '81'