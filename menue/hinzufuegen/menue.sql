CL SCR

PROMPT Datenbank fuer BuergerBus Vereine
PROMPT ==================================
PROMPT |    Menue - Daten hinzufuegen   |
PROMPT |================================|
PROMPT |                                |
PROMPT |(1) User anlegen                |
PROMPT |                                |
PROMPT |(2) Verein hinzufuegen          |
PROMPT |                                |
PROMPT |(3) Fahrzeuge hinzufuegen       |
PROMPT |                                |
PROMPT |(4) Fahrer hinzufuegen          |
PROMPT |                                |
PROMPT |(5) Tickets hinzufuegen         |
PROMPT |                                |
PROMPT |(6) Linien hinzufuegen          |
PROMPT |                                |
PROMPT |(7) Haltestellen hinzufuegen    |
PROMPT |                                |
PROMPT |(8) Fahrplan hinzufuegen        |
PROMPT |                                |
PROMPT |(9) Bus Position hinzufuegen    |
PROMPT |                                |
PROMPT |(10) Passagier hinzufuegen      |
PROMPT |                                |
PROMPT |(0) Hauptmenue (zurueck)        |
PROMPT |                                |
PROMPT ==================================
ACCEPT selection PROMPT "Ihre Eingabe: "

@&pfad.\hinzufuegen\&selection..sql
