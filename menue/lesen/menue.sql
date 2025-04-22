CL SCR

PROMPT Datenbank fuer BuergerBus Vereine
PROMPT ==================================
PROMPT |       Menue - Daten lesen      |
PROMPT |================================|
PROMPT |                                |
PROMPT |(1) User anzeigen               |
PROMPT |                                |
PROMPT |(2) Verein anzeigen             |
PROMPT |                                |
PROMPT |(3) Fahrzeuge anzeigen          |
PROMPT |                                |
PROMPT |(4) Fahrer anzeigen             |
PROMPT |                                |
PROMPT |(5) Tickets anzeigen            |
PROMPT |                                |
PROMPT |(6) Linien anzeigen             |
PROMPT |                                |
PROMPT |(7) Haltestellen anzeigen       |
PROMPT |                                |
PROMPT |(8) Fahrplan anzeigen           |
PROMPT |                                |
PROMPT |(9) Bus Position anzeigen       |
PROMPT |                                |
PROMPT |(10) Passagier anzeigen         |
PROMPT |                                |
PROMPT |(0) Hauptmenue (zurueck)        |
PROMPT |                                |
PROMPT ==================================
ACCEPT selection PROMPT "Ihre Eingabe: "

@&pfad.\lesen\&selection..sql
