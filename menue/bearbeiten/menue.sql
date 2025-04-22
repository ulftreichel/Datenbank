CL SCR

PROMPT Datenbank fuer BuergerBus Vereine
PROMPT ==================================
PROMPT |    Menue - Daten bearbeiten    |
PROMPT |================================|
PROMPT |                                |
PROMPT |(1) User bearbeiten             |
PROMPT |                                |
PROMPT |(2) Verein bearbeiten           |
PROMPT |                                |
PROMPT |(3) Fahrzeuge bearbeiten        |
PROMPT |                                |
PROMPT |(4) Fahrer bearbeiten           |
PROMPT |                                |
PROMPT |(5) Tickets bearbeiten          |
PROMPT |                                |
PROMPT |(6) Linien bearbeiten           |
PROMPT |                                |
PROMPT |(7) Haltestellen bearbeiten     |
PROMPT |                                |
PROMPT |(8) Fahrplan bearbeiten         |
PROMPT |                                |
PROMPT |(9) Bus Position bearbeiten     |
PROMPT |                                |
PROMPT |(0) Hauptmenue (zurueck)        |
PROMPT |                                |
PROMPT ==================================
ACCEPT selection PROMPT "Ihre Eingabe: "

@&pfad.\bearbeiten\&selection..sql
