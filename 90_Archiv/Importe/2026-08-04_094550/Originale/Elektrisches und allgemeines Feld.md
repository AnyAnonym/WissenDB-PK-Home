# Allgemeines und elektrisches Feld

## Kurzfassung

Ein Feld ordnet jedem Punkt eines Raumes eine physikalische Größe zu. In der
Elektrotechnik beschreibt das elektrische Feld, welche Kraft eine elektrische
Ladung an einem bestimmten Ort erfahren würde. Diese Notiz behandelt nur den
allgemeinen Feldbegriff und das elektrische Feld.

## Allgemeiner Feldbegriff

Ein Feld kann orts- und zeitabhängig sein. Es wird häufig in zwei Arten
eingeteilt:

- **Skalarfeld:** Jedem Ort wird eine Zahl zugeordnet, beispielsweise die
  Temperatur $T(x,y,z)$ oder das elektrische Potenzial $\varphi(x,y,z)$.
- **Vektorfeld:** Jedem Ort wird ein Vektor mit Betrag und Richtung zugeordnet,
  beispielsweise die elektrische Feldstärke $\vec{E}(x,y,z)$.

Ein Feld ist **homogen**, wenn die betrachtete Größe überall denselben Betrag
und dieselbe Richtung besitzt. Ändert sie sich von Ort zu Ort, ist das Feld
**inhomogen**.

## Elektrische Feldstärke

Die elektrische Feldstärke ist als Kraft pro positiver Probeladung definiert:

$$
\vec{E} = \frac{\vec{F}}{q}
$$

Dabei gilt:

| Größe | Bedeutung | Einheit |
|---|---|---|
| $\vec{E}$ | elektrische Feldstärke | $\mathrm{N/C}$ oder $\mathrm{V/m}$ |
| $\vec{F}$ | elektrische Kraft | $\mathrm{N}$ |
| $q$ | Probeladung | $\mathrm{C}$ |

Die Richtung von $\vec{E}$ entspricht der Kraftwirkung auf eine positive
Probeladung. Auf eine negative Ladung wirkt die Kraft in entgegengesetzter
Richtung.

## Feld einer Punktladung

Für eine Punktladung $Q$ im Abstand $r$ gilt in einem homogenen Medium:

$$
E = \frac{1}{4\pi\varepsilon}\cdot\frac{|Q|}{r^2}
$$

$\varepsilon$ ist die Permittivität des Mediums. Das Feld zeigt bei einer
positiven Ladung radial nach außen und bei einer negativen Ladung radial nach
innen.

## Überlagerung mehrerer Felder

Wirken mehrere Ladungen, werden ihre Feldstärken vektoriell addiert. Dieses
Prinzip heißt Superposition:

$$
\vec{E}_{\text{ges}} = \sum_{k=1}^{n} \vec{E}_k
$$

Dabei müssen sowohl Betrag als auch Richtung der einzelnen Feldvektoren
berücksichtigt werden.

## Homogenes Feld zwischen parallelen Platten

Zwischen zwei großen parallelen Platten ist das elektrische Feld abseits der
Ränder näherungsweise homogen. Für den Plattenabstand $d$ und die Spannung $U$
gilt:

$$
E = \frac{U}{d}
$$

Beispiel: Zwischen zwei Platten liegen $100\,\mathrm{V}$ bei einem Abstand von
$0{,}01\,\mathrm{m}$.

$$
E = \frac{100\,\mathrm{V}}{0{,}01\,\mathrm{m}}
  = 10\,000\,\mathrm{V/m}
$$

## Potenzial und Spannung

Das elektrische Potenzial $\varphi$ ist ein Skalarfeld. Die Spannung zwischen
zwei Punkten ist deren Potenzialdifferenz:

$$
U_{AB} = \varphi_A - \varphi_B
$$

Im homogenen Feld entlang der Feldrichtung gilt für den Betrag:

$$
U = E \cdot d
$$

Allgemein zeigt das elektrische Feld in die Richtung, in der das Potenzial am
stärksten abnimmt:

$$
\vec{E} = -\operatorname{grad}(\varphi)
$$

## Feldlinien

- Die Tangente an eine Feldlinie zeigt die Richtung der Feldstärke.
- Eine höhere Feldliniendichte steht für eine größere Feldstärke.
- Elektrische Feldlinien beginnen an positiven und enden an negativen Ladungen.
- Feldlinien schneiden sich nicht, weil das Feld an einem Ort nur eine eindeutige
  Richtung besitzen kann.

## Merksätze

- Ein Skalarfeld besitzt einen Wert, ein Vektorfeld zusätzlich eine Richtung.
- Das elektrische Feld beschreibt die Kraftwirkung auf elektrische Ladungen.
- Elektrische Feldstärken mehrerer Quellen werden vektoriell überlagert.
- Im homogenen Plattenfeld gilt näherungsweise $E = U/d$.

## Metadaten

- Bereich: Lernen / Technik / Elektrotechnik-Lehre
- Erstellt: 2026-08-03
- Überprüft: 2026-08-03
- Status: aktuell
