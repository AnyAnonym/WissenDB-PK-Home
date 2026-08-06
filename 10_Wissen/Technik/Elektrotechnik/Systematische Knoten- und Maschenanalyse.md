# Systematische Knoten- und Maschenanalyse

## Metadaten

- Bereich: Technik / Elektrotechnik
- Erstellt: 2026-08-06
- Zuletzt geändert: 2026-08-06
- Eintragstyp: Wissensnotiz
- Status: aktuell

## Zielprofil

- Gegenstand oder System: lineare elektrische Widerstandsnetzwerke
- Produkt oder Variante: ideale Spannungs- und Stromquellen
- Architektur oder Plattform: konzentrierte planare Schaltungsmodelle
- Zielgerät oder Zielgruppe: Elektrotechnik-Lernende auf HTL-Niveau
- Einsatzumgebung oder Verfahren: Knotenpotential- und Maschenstromverfahren
- Geltungsbereich: systematisches Aufstellen minimaler linearer Gleichungssysteme
- Ausdrückliche Ausschlüsse: nichtplanare Maschenanalyse und nichtlineare Bauteilgleichungen

## Kurzfassung

Knotenpotentialanalyse verwendet Knotenspannungen und die Knotenregel; die
Maschenstromanalyse verwendet Maschenströme und die Maschenregel. Eine zwischen zwei
Nichtbezugsknoten liegende ideale Spannungsquelle wird in der Knotenanalyse durch einen
Superknoten behandelt. Bei gemeinsam genutzten Widerständen ist der Zweigstrom die
algebraische Differenz der beteiligten Maschenströme.

## Knotenpotentialverfahren

1. Alle Bauteile, bekannten Werte und unbekannten Größen kennzeichnen.
2. Einen gut verbundenen Knoten als Bezugsknoten mit `0 V` wählen.
3. Die übrigen Knotenpotentiale relativ zum Bezugsknoten benennen.
4. Stromrichtungen und Spannungspolungen konsequent festlegen.
5. Für jeden unabhängigen unbekannten Knoten die Knotenregel aufstellen und
   Widerstandsströme etwa als `(v_k - v_m)/R` ausdrücken.
6. Das lineare Gleichungssystem lösen und danach die Zweigströme berechnen.

Eine ideale Spannungsquelle zwischen einem Knoten und dem Bezugsknoten legt das
Knotenpotential unmittelbar fest. Liegt die ideale Spannungsquelle dagegen zwischen zwei
Nichtbezugsknoten, ist der Strom durch die Quelle nicht direkt aus deren Spannung
bestimmbar; dann wird ein Superknoten verwendet.

## Superknoten

Ein Superknoten umfasst die beiden durch eine schwebende ideale Spannungsquelle
verbundenen Knoten und die Quelle selbst.

1. Die Knotenregel wird für die äußere Begrenzung des gesamten Superknotens
   aufgestellt; interne Ströme zwischen den eingeschlossenen Knoten fallen aus der Bilanz.
2. Zusätzlich wird die Spannungsquellen-Zwangsbedingung notiert, beispielsweise
   `v_2 - v_3 = 5 V`, wenn der Pluspol an Knoten 2 und der Minuspol an Knoten 3 liegt.
3. Beide Gleichungen werden gemeinsam mit den übrigen Knotengleichungen gelöst.

Im Bild `Supernode.png` werden die Knoten 2 und 3 samt 5-V-Quelle gemeinsam
bilanziert. Mit den eingezeichneten Stromrichtungen lautet die äußere Bilanz
`i_1 + i_4 = i_2 + i_3`; die Quellenbedingung ist `v_2 - v_3 = 5 V`.

## Maschenstromverfahren

Das Verfahren ist unmittelbar für planare Netzwerke geeignet, deren elementare Maschen
sich ohne Leiterkreuzung erkennen lassen.

1. Alle elementaren Maschen bestimmen. Eine Masche ist eine Schleife, die keine weitere
   Schleife enthält.
2. Für jede Masche einen Strom festlegen, zweckmäßig alle in derselben Drehrichtung.
3. Für jede Masche die Maschenregel anwenden und Bauteilspannungen durch die
   Maschenströme ausdrücken.
4. Liegt ein Widerstand `R` nur in Masche `k`, ist sein Spannungsabfall `R I_k`.
   Wird er von Masche `k` und `j` geteilt und sind beide Maschenströme gleichsinnig
   umlaufend definiert, lautet der Beitrag in Gleichung `k`: `R(I_k - I_j)`.
5. Gleichungssystem lösen; anschließend Zweigströme und Spannungen aus den
   Maschenströmen bestimmen.

### Zweimaschen-Beispiel aus dem Bild

`Kirchoffsches Gesetz Maschen Analyse.png` zeigt zwei im Uhrzeigersinn angenommene
Maschenströme `i_1` und `i_2`, die den Widerstand `R_3` gemeinsam benutzen. Mit den im
Bild gezeigten Quellpolungen entstehen:

- linke Masche: `-V_1 + i_1R_1 + (i_1 - i_2)R_3 = 0`,
- rechte Masche: `(i_2 - i_1)R_3 + i_2R_2 + V_2 = 0`.

Ein negatives Ergebnis für einen Maschen- oder Zweigstrom bedeutet, dass der wirkliche
Strom der angenommenen Pfeilrichtung entgegenläuft; es ist nicht automatisch ein
Rechenfehler.

## Wahl des Verfahrens

- Knotenanalyse ist oft kürzer, wenn wenige unbekannte Knotenpotentiale vorliegen oder
  viele Stromquellen vorhanden sind.
- Maschenanalyse ist oft kürzer, wenn das planare Netzwerk wenige Maschen und viele
  Spannungsquellen besitzt.
- Entscheidend ist die kleinere Zahl unabhängiger Unbekannter, nicht die optische Größe
  des Schaltbilds.

## Ergebniskontrolle

- Einheiten und Größenordnung prüfen.
- Knotenbilanzen mit den berechneten Strömen nachrechnen.
- Spannungsänderungen in mindestens einer geschlossenen Schleife kontrollieren.
- Bei rein resistiven Netzen die aufgenommene und abgegebene Gesamtleistung vergleichen.
- Grenzfälle wie `R → 0` oder `R → ∞` nur verwenden, wenn das Modell dabei sinnvoll
  bleibt.

## Bildauswertung

| Dateiname | Erfasster Inhalt |
|---|---|
| `Kirchoffsches Gesetz Maschen Analyse.png` | Zwei Maschen mit Quellen `V_1`, `V_2`, Widerständen `R_1`, `R_2`, gemeinsamem `R_3` und den daraus gebildeten Maschengleichungen. |
| `Supernode.png` | Superknoten aus Knoten 2 und 3 mit einer schwebenden 5-V-Quelle; gemeinsame äußere Strombilanz und zusätzliche Spannungsbedingung. |

## Herkunft

- Schulische OneDrive-Sammlung `Lernen/Elektrotechnik`, ausschließlich lesend
  ausgewertet am 2026-08-06
- Die zwei oben genannten PNG-Dateien wurden weder verändert noch verschoben oder in
  das Archiv kopiert.

## Quellen

- [MIT OpenCourseWare: Circuit Analysis using the Node and Mesh Methods](https://ocw.mit.edu/courses/6-071j-introduction-to-electronics-signals-and-measurement-spring-2006/resources/nodal_mesh_methd/) – Arbeitsschritte für Knoten- und Maschenanalyse, Superknoten und gemeinsame Widerstandszweige
- [MIT OpenCourseWare: Direct-Current Circuits](https://ocw.mit.edu/courses/8-02t-electricity-and-magnetism-spring-2005/resources/chap7dc_circuits/) – Kirchhoff-Regeln, Bezugsrichtungen und Kontrollstrategie

## Offene Fragen

- Die ursprünglichen Videos oder Urheber der Screenshots sind anhand der Bilddateien
  allein nicht zuverlässig bestimmbar.
