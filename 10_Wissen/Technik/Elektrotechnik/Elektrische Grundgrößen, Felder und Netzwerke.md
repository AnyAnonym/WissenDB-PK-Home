# Elektrische Grundgrößen, Felder und Netzwerke

## Kurzfassung

Elektrische Netzwerke werden mit Spannung, Stromstärke und Widerstand beschrieben. Das Ohmsche Gesetz beschreibt das Verhalten ohmscher Bauteile; die Kirchhoffschen Regeln folgen aus Ladungs- und Energieerhaltung und erlauben die Analyse verzweigter Schaltungen.

## Größen, Einheiten und Zusammenhänge

### Ladung und Strom

- Elektrische Ladung wird in Coulomb (`C`) angegeben, Strom in Ampere (`A`). Es gilt
  `1 C = 1 A s`.
- Der Augenblicksstrom ist die zeitliche Änderungsrate der übertragenen Ladung:
  `i(t) = dq(t)/dt`.
- Umgekehrt ist die im Zeitraum von `t0` bis `t1` übertragene Ladung
  `Δq = ∫[t0,t1] i(t) dt`. Bei konstantem Strom folgt `Δq = I · Δt`.

### Spannung und elektromotorische Kraft

- Die Spannung `u_ab` ist die elektrische Potentialdifferenz zwischen zwei Punkten
  `a` und `b`. Sie beschreibt Energie beziehungsweise Arbeit pro Ladung. Wird `W_ab`
  als die zur gewählten Richtung `b → a` gehörende Arbeit definiert, gilt
  `u_ab = dW_ab/dq`. Daher gilt `1 V = 1 J/C = 1 W/A`.
- Eine elektromotorische Kraft (EMK, englisch `emf`, häufig `ε`) ist trotz des Namens
  keine mechanische Kraft. Sie beschreibt die Energie, die eine Quelle pro Ladung
  bereitstellt. Bei einer idealen Quelle entspricht die Klemmenspannung der EMK; bei
  einer realen belasteten Quelle kann sie wegen des Innenwiderstands davon abweichen.
- Die in `EMF_Voltage-Erklärung.png` notierte Ableitung nach der Zeit wäre Leistung,
  nicht Spannung. Fachlich richtig ist für Spannung beziehungsweise EMK – jeweils mit
  festgelegter Bezugsrichtung – die Ableitung der Arbeit nach der Ladung: `dW/dq`.

### Leistung und Energie

- Leistung ist die zeitliche Änderungsrate der Energie: `p(t) = dW/dt`; ihre Einheit
  ist Watt mit `1 W = 1 J/s`.
- Für ein Zweipolelement gilt bei zusammenpassenden Bezugspfeilen
  `p(t) = u(t) · i(t)`. Nach der passiven Vorzeichenkonvention bedeutet `p > 0`, dass
  das Element Energie aufnimmt; `p < 0` bedeutet Energieabgabe.
- Die in einem Zeitintervall umgesetzte Energie ist
  `ΔW = ∫[t0,t1] p(t) dt = ∫[t0,t1] u(t)i(t) dt`. Bei konstanter Leistung gilt
  `ΔW = P · Δt`.

## Schreibweisen richtig einordnen

- In vielen Schaltungslehren stehen Großbuchstaben wie `V` und `I` für konstante
  Gleichgrößen und Kleinbuchstaben wie `v(t)` und `i(t)` für zeitabhängige
  Augenblickswerte. Im deutschsprachigen Raum ist für Spannung häufig `U` oder `u(t)`
  üblich. Diese Groß-/Kleinschreibung ist eine Konvention des jeweiligen Dokuments,
  keine allgemeine SI-Regel.
- `Q` und `q` bedeuten nicht allgemein „große“ und „kleine“ Ladung. Sinnvoll ist eine
  explizite Definition, zum Beispiel `q(t)` für einen zeitabhängigen Ladungszustand und
  `ΔQ` für die insgesamt übertragene Ladung eines festgelegten Intervalls.
- Einheitensymbole sind davon zu unterscheiden: `V`, `A`, `C`, `W` und `J` bleiben
  unabhängig von einer Zeitabhängigkeit unverändert und werden nicht wie Variablen
  umgedeutet.

## Fachzuordnung

Elektrotechnik ist im schulischen Kontext ein eigener technischer Fachbereich und wird deshalb nicht unter Physik geführt. Die Stundentafel verteilt elektrotechnische Inhalte insbesondere auf Energiesysteme, Automatisierungstechnik, Antriebstechnik, Industrieelektronik, Laboratorium sowie Werkstätte und Produktionstechnik.

## Grundideen

- Spannung beschreibt einen Energieunterschied pro Ladung, Stromstärke den Ladungsfluss pro Zeit und Widerstand die Hemmung dieses Flusses.
- Das Ohmsche Gesetz gilt für Bauteile beziehungsweise Betriebsbereiche mit proportionalem Zusammenhang zwischen Spannung und Strom. Nicht jedes Bauteil ist ohmsch.
- Elektrische Felder ordnen jedem Ort eine Wirkung auf eine Probeladung zu. Feldlinien sind ein Anschauungsmodell, keine materiellen Bahnen.
- Feldbegriffe aus Gravitation und Elektrizitätslehre lassen sich strukturell vergleichen, unterscheiden sich aber unter anderem durch mögliche Vorzeichen und Anziehungs- beziehungsweise Abstoßungswirkung.

## Netzwerkregeln

### Knotenregel

An einem Knoten kann sich im stationären Fall keine Ladung dauerhaft ansammeln. Deshalb wird eine Strombilanz mit einer konsequenten Vorzeichenkonvention aufgestellt.

### Maschenregel

Entlang eines geschlossenen Umlaufs gleichen sich Spannungsanstiege und Spannungsabfälle aus. Die Vorzeichen ergeben sich aus Umlaufrichtung und Polung der Bauteile.

### Unbelasteter Spannungsteiler

Bei in Reihe liegenden Widerständen fließt derselbe Strom. Für drei Widerstände
`R1`, `R2` und `R3` an der Eingangsspannung `U` ergibt sich die Spannung über `R3` zu

`U3 = U · R3 / (R1 + R2 + R3)`.

Das gilt für einen unbelasteten Abgriff. Liegt eine Last parallel zu `R3`, muss zunächst
der Parallelersatz von `R3` und der Last gebildet werden; die einfache Formel mit dem
ursprünglichen `R3` ist dann nicht mehr gültig.

## Lösungsschema

1. Schaltung übersichtlich zeichnen und Größen benennen.
2. Stromrichtungen und Maschenrichtungen frei, aber konsequent festlegen.
3. Bauteilgleichungen sowie unabhängige Knoten- und Maschengleichungen aufstellen.
4. Das entstehende Gleichungssystem lösen.
5. Negative Resultate als Hinweis auf die tatsächliche Gegenrichtung interpretieren, nicht automatisch als Fehler.
6. Einheiten, Leistungsbilanz und Grenzfälle prüfen.

## Herkunft und abgedeckter Umfang

- `Ohmsches Gesetz.md`: Zusammenhang und Gültigkeitsbereich ohmscher Bauteile
- `1. Kirchhoffscher Satz - Knotenregel.md`: Strombilanz an Verzweigungen
- `2. Kirchhoffscher Satz - Maschenregel.md`: Spannungsbilanz in geschlossenen Umläufen
- `Elektrisches und allgemeines Feld.md`: Feldbegriff und Einordnung elektrischer Felder
- `HTL_Elektrotechnik-Stundentafel.pdf`: schulische Zuordnung zur Elektrotechnik
- `EMF_Voltage-Erklärung.png`: Spannung, Volt und elektromotorische Kraft; die im Bild
  gezeigte Zeitableitung wurde fachlich zu `dW/dq` korrigiert
- `I_vs_i.png`: Groß-/Kleinschreibung für konstanten beziehungsweise zeitabhängigen
  Strom als Lehrkonvention
- `V_vs_v.png`: Groß-/Kleinschreibung für konstante beziehungsweise zeitabhängige
  Spannung als Lehrkonvention
- `Q_vs_q.png`: Ladung als Zeitintegral des Stroms und eine bildinterne
  Groß-/Kleinschreibkonvention
- `Power_and_Energy_Verhältniss.png`: `p = dW/dt`, `p = ui` und Energie als
  Zeitintegral der Leistung
- `Spannungs-Teiler.png`: Reihenschaltung und Spannungsteiler über drei Widerstände

Die für das Verständnis und die Netzwerkanalyse nötigen Begriffe, Voraussetzungen,
Vorzeichenregeln und Arbeitsschritte sind oben vollständig zusammengeführt.

Die PNG-Dateien stammen aus der schulischen OneDrive-Sammlung
`Lernen/Elektrotechnik` und wurden am 2026-08-06 ausschließlich lesend ausgewertet.
Sie wurden weder verändert noch verschoben oder in das Archiv kopiert.

## Quellen

- [BIPM: The International System of Units (SI), 9. Auflage, Fassung 2026](https://www.bipm.org/en/publications/si-brochure) – SI-Einheiten und Beziehungen für Joule, Watt, Coulomb und Volt
- [IEC Electropedia: instantaneous power](https://www.electropedia.org/iev/iev.nsf/display?ievref=131-11-30&openform=) – Augenblicksleistung eines Zweipols als Produkt aus Spannung und Strom mit festgelegten Bezugsrichtungen
- [MIT OpenCourseWare: Direct-Current Circuits](https://ocw.mit.edu/courses/8-02t-electricity-and-magnetism-spring-2005/resources/chap7dc_circuits/) – EMK als Arbeit pro Ladung, Kirchhoff-Regeln und Spannungsteiler
- [NIST Guide to the SI, Chapter 10](https://www.nist.gov/pml/special-publication-811/nist-guide-si-chapter-10-more-printing-and-using-symbols-and-numbers) – Unterscheidung von Größen-, Variablen- und Einheitensymbolen

## Metadaten

- Bereich: Technik / Elektrotechnik
- Erstellt: 2026-08-04
- Zuletzt geändert: 2026-08-06
- Überprüft: 2026-08-06
- Status: aktuell
