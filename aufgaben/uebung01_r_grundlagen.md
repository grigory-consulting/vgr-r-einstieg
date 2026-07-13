# Übung 1: R-Grundlagen und Arbeiten im Projekt

**Zugehöriger Foliensatz:** Teil I (RStudio, Projekte und Datenhaltung in R)

**Bearbeitungszeit:** etwa 25 Minuten

## Vorbereitung

1. Öffnen Sie `projekt/vgr-r-schulung.Rproj` in RStudio.
2. Öffnen Sie das Startskript `R/lab1_r_grundlagen.R`.
3. Führen Sie einzelne Zeilen mit **Strg + Enter** aus (macOS: **Cmd + Enter**).
4. Ergänzen Sie die Stellen mit `TODO`. Arbeiten Sie von oben nach unten.

## Aufgabe 1: R als Rechner und Objekte

Legen Sie drei Quartalswerte an:

```r
bws_be <- 165000
bws_f  <- 38000
bws_gi <- 120000
```

Berechnen und speichern Sie:

- die Summe der drei Werte als `quartalssumme`,
- den Mittelwert als `mittelwert`,
- eine einfache Hochrechnung auf vier Quartale als `jahreshochrechnung`.

Geben Sie alle drei Objekte in der Konsole aus.

**Selbstkontrolle:** `quartalssumme` ist 323.000 und die Hochrechnung ist
1.292.000.

## Aufgabe 2: Funktionen, Hilfe und Datentypen

Rufen Sie die Hilfe für `round()` mit `?round` auf. Runden Sie anschließend den
Mittelwert auf eine Nachkommastelle.

Legen Sie zusätzlich diese Objekte an:

```r
bereich_code <- "BE"
ist_freigegeben <- TRUE
stichtag <- as.Date("2024-12-31")
```

Prüfen Sie jedes Objekt mit `class()`. Ordnen Sie die Ergebnisse den Typen
`numeric`, `character`, `logical` und `Date` zu.

**Kurzfrage:** Woran erkennen Sie beim Funktionsaufruf, welche Werte Argumente
der Funktion sind?

## Aufgabe 3: Vektoren und fehlende Werte

Erzeugen Sie den Vektor:

```r
werte <- c(165000, NA, 38000, 120000)
```

1. Berechnen Sie zunächst `sum(werte)`. Was passiert?
2. Berechnen Sie die Summe erneut mit `na.rm = TRUE`.
3. Ermitteln Sie mit `is.na()` und `sum()`, wie viele Werte fehlen.
4. Ersetzen Sie `NA` nicht automatisch durch 0. Notieren Sie als Kommentar im
   Skript, warum das fachlich eine bewusste Entscheidung sein muss.

**Selbstkontrolle:** Die bereinigte Summe ist 323.000; genau ein Wert fehlt.

## Aufgabe 4: Faktor und Datum

Erzeugen Sie aus den Werten `BE`, `F`, `GI`, `BE` einen Faktor. Legen Sie die
erlaubten Stufen in dieser Reihenfolge fest: `A`, `BE`, `F`, `GI`, `OQ`.

```r
bereiche <- NULL  # TODO: mit factor() erzeugen
```

Geben Sie `bereiche` und `levels(bereiche)` aus. Welche zwei erlaubten Stufen
kommen in den Beobachtungen nicht vor?

Erzeugen Sie danach die vier Quartalsstichtage 31. März, 30. Juni,
30. September und 31. Dezember 2024:

```r
stichtage <- NULL  # TODO: mit as.Date() erzeugen
```

Leiten Sie mit `quarters(stichtage)` die Quartale ab. Das Ergebnis muss `Q1` bis
`Q4` enthalten.

## Aufgabe 5: Ein kleines Tibble verstehen

Erzeugen Sie ein Tibble mit den Bereichscodes `BE`, `F`, `GI` und den Werten
165000, 38000, 120000:

```r
bws <- NULL  # TODO: mit tibble::tibble() erzeugen
```

Prüfen Sie:

- `class(bws)`: Welche Tabellenklasse liegt vor?
- `nrow(bws)` und `ncol(bws)`: Wie viele Beobachtungen und Variablen gibt es?
- `names(bws)`: Wie heißen die Variablen?
- `bws$wert`: Welcher Vektor steckt in der Spalte `wert`?

Erklären Sie für die zweite Zeile in einem Satz: Was ist die Beobachtung, was
sind die Variablen?

## Aufgabe 6: Projekt und Skript prüfen

Führen Sie aus:

```r
getwd()
file.exists("data/lieferung_2024q4.csv")
```

`file.exists()` muss `TRUE` liefern. Falls nicht, öffnen Sie die Datei
`vgr-r-schulung.Rproj` erneut und wiederholen Sie die Prüfung.

Gliedern Sie Ihr Skript mit diesen Abschnittsmarken:

```r
# ---- 01 Objekte und Berechnungen ----
# ---- 02 Datentypen und Vektoren ----
# ---- 03 Faktor, Datum und Tibble ----
# ---- 04 Kontrollen ----
```

Führen Sie zum Schluss die Kontrollen im Startskript aus. Wenn keine
Fehlermeldung erscheint, stimmen die zentralen Ergebnisse.
