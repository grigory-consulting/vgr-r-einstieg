# VGR-R-Glossar (gemeinsame Bibliothek)

Dieses Glossar ist die gemeinsame Wissensablage des Teams. Es sammelt
wiederkehrende Stolperfallen aus der VGR-Aufbereitung mit R und die jeweils
erprobte Lösung samt Codeschnipsel. Bei jedem neuen Fall: einen Abschnitt nach
demselben Muster ergänzen (Problem, Symptom, Lösung, Codeschnipsel). So findet
auch die Vertretung schnell die richtige Vorgehensweise.

## Schnellübersicht

| Stichwort               | Problem (kurz)                                  | Lösung (kurz)                                   |
|-------------------------|-------------------------------------------------|-------------------------------------------------|
| Dezimalkomma-Import     | Werte werden als Text statt Zahl eingelesen     | `read_csv2()` bzw. `locale(decimal_mark = ",")` |
| Klassifikationswechsel  | Alter Code splittet in mehrere neue Bereiche    | Korrespondenztabelle joinen, `wert * anteil`    |
| Override-Tabelle        | Manuelle Korrekturen gehen beim Re-Run verloren | Overrides separat halten und über Join setzen   |
| Join-Schlüsseltreue     | Zeilen verdoppeln/verschwinden nach dem Join    | Schlüssel prüfen, `relationship`/`anti_join`    |

---

## 1. Dezimalkomma-Import

**Problem.** Eine deutschsprachige CSV nutzt Komma als Dezimaltrennzeichen
(`6313,5`) und Semikolon als Spaltentrenner. `readr::read_csv()` erwartet aber
Punkt und Komma. Folge: Die Spalte `wert` landet als Text, jede Rechnung
schlägt fehl.

**Symptom.** `wert` ist `<chr>` statt `<dbl>`; `sum(wert)` wirft einen Fehler
oder liefert `NA`.

**Lösung.** Den deutschen Locale explizit setzen. Entweder `read_csv2()`
(Semikolon + Komma als Standard) oder `read_delim()` mit eigenem `locale()`.

```r
library(readr)

# Variante A: deutsche CSV (Semikolon-getrennt, Komma als Dezimalzeichen)
d <- read_csv2("data/lieferung_de.csv", show_col_types = FALSE)

# Variante B: Locale explizit
d <- read_delim(
  "data/lieferung_de.csv",
  delim  = ";",
  locale = locale(decimal_mark = ",", grouping_mark = "."),
  show_col_types = FALSE
)

# Prüfen: ist wert numerisch?
stopifnot(is.numeric(d$wert))
```

---

## 2. Klassifikationswechsel (Gliederungsänderung)

**Problem.** Eine Gliederungsänderung löst einen Sammelbereich auf, zum
Beispiel `GI` -> `G`, `H`, `I`. Die alte Lieferung kennt nur `GI`, die neue
verlangt die drei Einzelbereiche. Der Wert muss anhand fester Anteile
aufgeteilt werden.

**Symptom.** Nach der Umstellung fehlen `G`/`H`/`I`, oder die Summe stimmt nicht
mehr mit der Bruttowertschöpfung überein.

**Lösung.** Die Korrespondenztabelle (`alt_code`, `neu_code`, `neu_name`,
`anteil`) joinen und den Wert mit dem Anteil multiplizieren. Codes ohne Splitt
stehen 1:1 mit `anteil = 1` darin.

```r
library(dplyr)
library(readr)

daten <- read_csv("data/lieferung_2024q4.csv", show_col_types = FALSE)
korr  <- read_csv("data/klassifikation_korrespondenz.csv", show_col_types = FALSE)

neu <- daten |>
  inner_join(korr, by = c("bereich_code" = "alt_code")) |>
  mutate(wert = wert * anteil) |>
  select(jahr, quartal, bereich_code = neu_code, bereich_name = neu_name, wert)

# Plausibilität: Summe je Quartal bleibt erhalten (Anteile addieren zu 1)
stopifnot(all(korr$anteil > 0))
```

---

## 3. Override-Tabelle (manuelle Korrekturen)

**Problem.** Eine Fachabteilung meldet nachträglich einen korrigierten Wert.
Wird er direkt im Skript hart überschrieben, geht die Korrektur beim nächsten
Re-Run verloren und ist nicht nachvollziehbar.

**Symptom.** Korrekturen verschwinden nach erneutem Lauf; niemand weiß mehr,
warum ein Wert vom Quellsystem abweicht.

**Lösung.** Overrides in einer eigenen, dokumentierten Tabelle halten (mit
Begründung und Datum) und am Ende per Join setzen. Das Quellskript bleibt
unverändert und reproduzierbar.

```r
library(dplyr)

# Overrides als eigene, versionierte Tabelle (hier inline als Beispiel)
overrides <- tibble::tribble(
  ~jahr, ~quartal, ~bereich_code, ~wert_neu, ~grund,           ~datum,
  2024,  4,        "BE",          168000.0,  "Nachmeldung FB3", "2025-01-15"
)

ergebnis <- daten |>
  left_join(overrides, by = c("jahr", "quartal", "bereich_code")) |>
  mutate(wert = dplyr::coalesce(wert_neu, wert)) |>
  select(-wert_neu, -grund, -datum)
```

---

## 4. Join-Schlüsseltreue

**Problem.** Beim Verbinden zweier Lieferungen (`left_join`/`inner_join`)
verdoppeln sich Zeilen oder verschwinden, weil der Schlüssel nicht eindeutig
ist (zum Beispiel doppelte `bereich_code` je Quartal) oder Codes nicht passen.

**Symptom.** Zeilenzahl nach dem Join ist größer/kleiner als erwartet;
Summen weichen ohne erkennbaren Grund ab.

**Lösung.** Schlüsseleindeutigkeit vor dem Join prüfen, `relationship` in
dplyr setzen (warnt bei unerwarteten n:m-Beziehungen) und mit `anti_join`
suchen, welche Schlüssel nicht treffen.

```r
library(dplyr)

# 1) Schlüssel eindeutig? (keine Dubletten je Schlüsselkombination)
stopifnot(
  nrow(distinct(alt, jahr, quartal, bereich_code)) == nrow(alt)
)

# 2) Join mit erwarteter Beziehung (warnt bei Verstoß)
verbunden <- left_join(
  alt, neu,
  by = c("jahr", "quartal", "bereich_code"),
  relationship = "one-to-one"
)

# 3) Welche Schlüssel passen NICHT zusammen?
fehlend <- anti_join(alt, neu, by = c("jahr", "quartal", "bereich_code"))
print(fehlend)
```
