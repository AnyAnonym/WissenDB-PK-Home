# Lineare Netzwerke, Quellen und Ersatzschaltungen

## Metadaten

- Bereich: Technik / Elektrotechnik
- Erstellt: 2026-08-06
- Zuletzt geändert: 2026-08-06
- Eintragstyp: Wissensnotiz
- Status: aktuell

## Zielprofil

- Gegenstand oder System: lineare elektrische Zweipol- und Widerstandsnetzwerke
- Produkt oder Variante: ideale unabhängige und linear abhängige Quellen
- Architektur oder Plattform: konzentrierte Schaltungsmodelle
- Zielgerät oder Zielgruppe: Elektrotechnik-Lernende auf HTL-Niveau
- Einsatzumgebung oder Verfahren: Gleichstrom-Netzwerkanalyse
- Geltungsbereich: lineare Schaltungen und ihre Klemmenbeziehungen
- Ausdrückliche Ausschlüsse: nichtlineare Kennlinien, verteilte Leitungen und Leistungsüberlagerung

## Kurzfassung

In linearen Netzwerken skalieren und addieren sich Spannungs- und Stromantworten.
Dadurch sind Überlagerung sowie Thévenin- und Norton-Ersatzschaltungen möglich.
Unabhängige Quellen werden bei Teilrechnungen auf null gesetzt; abhängige Quellen
bleiben aktiv. Quellenumwandlungen sind nur dann zulässig, wenn die Klemmenkennlinie
des betrachteten Zweipols erhalten bleibt.

## Unabhängige und abhängige Quellen

- Eine ideale unabhängige Spannungs- oder Stromquelle gibt ihren Wert unabhängig von
  anderen Schaltungsgrößen vor. Im Schaltbild wird sie üblicherweise als Kreis
  dargestellt.
- Eine abhängige oder gesteuerte Quelle hängt von einer anderen Spannung oder einem
  anderen Strom der Schaltung ab. Das übliche Symbol ist eine Raute. Beispiele sind
  eine spannungsgesteuerte Spannungsquelle `u_s = μu_x` oder eine
  stromgesteuerte Stromquelle `i_s = βi_x`.
- Eine abhängige Quelle kann Teil eines linearen Modells sein, wenn ihre Steuerbeziehung
  linear ist. Sie ist kein zusätzlicher frei wählbarer Eingang, sondern eine
  Zwangsbeziehung innerhalb des Modells.

## Linearität

Eine Abbildung von Quellen auf eine gesuchte Spannung oder einen gesuchten Strom ist
linear, wenn sie beide Bedingungen erfüllt:

- Homogenität: Wird jede Anregung mit `k` multipliziert, wird auch die Antwort mit `k`
  multipliziert.
- Additivität: Die Antwort auf die Summe zweier Anregungen ist die Summe der beiden
  Einzelantworten.

Zusammengefasst gilt `T(k1x1 + k2x2) = k1T(x1) + k2T(x2)`. Ein Netzwerk aus
konstanten Widerständen und linear gesteuerten Quellen erfüllt diese Bedingung. Eine
Leistung `p = ui` ist dagegen ein Produkt zweier Größen und darf nicht durch einfaches
Addieren von Quellenbeiträgen überlagert werden. Erst Spannungen und Ströme vollständig
bestimmen, danach die Leistung berechnen.

### Rückwärtsskalieren als Rechenhilfe

Ist die Schaltung linear, darf eine zweckmäßige Ausgangsgröße angenommen und die dazu
nötige Quelle rückwärts berechnet werden. Erzeugt beispielsweise die Annahme
`i_o = 1 A` den nötigen Quellenwert `I_s = 5 A`, die tatsächliche Quelle beträgt aber
`15 A`, dann ist der Skalierungsfaktor `k = 15/5 = 3` und damit
`i_o = 3 · 1 A = 3 A`. Dieses Vorgehen ist nur bei unveränderter linearer Schaltung
zulässig.

## Überlagerungsprinzip

Für jede unabhängige Quelle wird eine Teilrechnung durchgeführt:

1. Eine unabhängige Quelle bleibt aktiv; alle anderen unabhängigen Quellen werden auf
   null gesetzt.
2. Eine ideale Spannungsquelle mit `0 V` wird zum Kurzschluss, eine ideale Stromquelle
   mit `0 A` zum Leerlauf.
3. Abhängige Quellen bleiben aktiv, weil ihre Werte weiterhin von Schaltungsgrößen
   abhängen.
4. Der gesuchte Spannungs- oder Strombeitrag wird mit seiner Bezugsrichtung notiert.
5. Alle Beiträge werden algebraisch addiert.

## Parallele Stromquellen zusammenfassen

Ideale Stromquellen dürfen algebraisch zusammengefasst werden, wenn sie exakt zwischen
demselben Knotenpaar liegen. Eine Bezugsrichtung wird positiv gewählt; gleichgerichtete
Werte werden addiert, entgegengerichtete subtrahiert. So ergeben eine Quelle von `4 A`
in positiver Richtung und eine Quelle von `2 A` in Gegenrichtung eine Ersatzquelle von
`2 A` in positiver Richtung. Die Bedingung „gleiches Knotenpaar“ ist wesentlich.

## Quellenumwandlung

Eine ideale Spannungsquelle `U_s` in Reihe mit `R` besitzt an ihren Klemmen dieselbe
Strom-Spannungs-Beziehung wie eine ideale Stromquelle `I_s = U_s/R` parallel zu
demselben `R`. Umgekehrt gilt `U_s = I_sR`.

Die Umwandlung erhält nur das von außen beobachtete Verhalten am gewählten Klemmenpaar.
Interne Zweigströme oder -spannungen der beiden Darstellungen müssen nicht übereinstimmen.

## Thévenin- und Norton-Ersatz

Ein lineares Netzwerk kann an einem festgelegten Klemmenpaar ersetzt werden durch:

- Thévenin: ideale Spannungsquelle `U_Th` in Reihe mit `R_Th`,
- Norton: ideale Stromquelle `I_N` parallel zu `R_N`.

Dabei gelten `R_N = R_Th`, `U_Th = U_OC` und bei passender Bezugsrichtung
`I_N = I_SC`; außerdem `U_Th = I_NR_Th`. `U_OC` ist die Leerlaufspannung und
`I_SC` der Kurzschlussstrom am betrachteten Port.

### Sichere Bestimmung

1. Last am Port entfernen und die Leerlaufspannung bestimmen:
   `U_Th = U_OC`.
2. Besitzt das Netzwerk nur unabhängige Quellen, diese auf null setzen und den vom Port
   gesehenen Ersatzwiderstand berechnen: unabhängige Spannungsquellen kurzschließen,
   unabhängige Stromquellen öffnen.
3. Abhängige Quellen niemals deaktivieren. Sind sie vorhanden, eine Testspannung oder
   einen Teststrom am Port anlegen und `R_Th = U_Test/I_Test` bestimmen. Alternativ kann
   bei einer linearen Portkennlinie das Verhältnis aus Leerlaufspannung und passend
   orientiertem Kurzschlussstrom verwendet werden.
4. Quellen wieder aktivieren und Vorzeichen sowie Klemmenbezug prüfen.

## Bildauswertung

| Dateiname | Erfasster Inhalt |
|---|---|
| `Independent_vs_Dependent.png` | Kreisförmige unabhängige 12-V-Quelle im Vergleich zu einer rautenförmigen, von `3V_x` abhängigen Spannungsquelle. |
| `LINEARITY.png` | Homogenität: Verdopplung einer Quellenspannung von 12 V auf 24 V verdoppelt bei unveränderter linearer Schaltung den berechneten Ausgangsstrom. |
| `LINEARITY-Beispiel.png` | Rückwärtsrechnung mit angenommenem `i_o = 1 A`; aus `I_s = 5 A` für die Annahme und tatsächlichen 15 A folgt der Faktor 3 und `i_o = 3 A`. |
| `Superposition_oder_Überlagerungsprinzip.png` | Ablauf der Überlagerung: jeweils nur eine unabhängige Quelle aktiv lassen, Teilantwort berechnen und alle Teilantworten addieren. |
| `Zusammenfügen-zweier-Stromquellen.png` | Zwei parallele, entgegengesetzte Stromquellen mit 4 A und 2 A werden algebraisch zu 2 A zusammengefasst. |
| `Source-Transformation.png` | Äquivalenz von Spannungsquelle mit Serienwiderstand und Stromquelle mit Parallelwiderstand; `U_s = I_sR`. |
| `Satz-von-Thevenin.png` | Komplexes lineares Netzwerk am Port A–B wird auf `U_Th` und `R_Th` reduziert. |
| `Satz-von-Thevenin_Schritte.png` | Für Netzwerke ohne abhängige Quellen: unabhängige Quellen deaktivieren, `R_Th` bestimmen, Quellen aktivieren und die Leerlaufspannung `U_AB = U_Th` berechnen. |

## Herkunft

- Schulische OneDrive-Sammlung `Lernen/Elektrotechnik`, ausschließlich lesend
  ausgewertet am 2026-08-06
- Die acht oben genannten PNG-Dateien wurden weder verändert noch verschoben oder in
  das Archiv kopiert.

## Quellen

- [MIT OpenCourseWare: Superposition, Thévenin and Norton](https://ocw.mit.edu/courses/6-002-circuits-and-electronics-spring-2007/resources/6002_l3/) – Linearität, Homogenität, Überlagerung sowie Thévenin- und Norton-Ersatz
- [MIT OpenCourseWare: Circuit Abstractions](https://ocw.mit.edu/courses/6-01sc-introduction-to-electrical-engineering-and-computer-science-i-spring-2011/pages/unit-3-circuits/circuit-abstractions/) – Klemmenersatz linearer Schaltungen und Anwendungszweck der Überlagerung
- [MIT OpenCourseWare: Introduction to Electric Power Systems, Kapitel 1](https://live.ocw.mit.edu/courses/6-061-introduction-to-electric-power-systems-spring-2011/d79822ef5fbdb21b1c44e1b3b8282453_MIT6_061S11_ch1.pdf) – unabhängige und abhängige Quellen sowie lineare Widerstandsmodelle

## Offene Fragen

- Die ursprünglichen Videos oder Urheber der Screenshots sind anhand der Bilddateien
  allein nicht zuverlässig bestimmbar.
