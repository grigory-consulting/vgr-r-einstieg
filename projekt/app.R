# Übung 7 - Backup-Eingabemaske (Shiny)
# Teil VIII: Dokumentation, R-Glossar/-Bibliothek, Shiny-Backup-UI
#
# Minimale Shiny-App für die Vertretung: Eine Laien-Oberfläche, die die
# Lieferung einliest, je Jahr und Bereich die Quartalswerte anzeigt, als
# Zeitreihe zeichnet und das gefilterte Ergebnis als CSV exportiert.
#
# Start aus dem Projektordner labs/projekt/:
#   shiny::runApp("app.R")
# oder in RStudio: app.R öffnen und auf "Run App" klicken.
#
# Die App ist eigenständig und benötigt keine Datei außerhalb des Projekts.

suppressPackageStartupMessages({
  library(shiny)
  library(dplyr)
  library(readr)
  library(ggplot2)
})

# Daten einmal beim App-Start laden. Pfad relativ zum Projektordner.
DATENPFAD <- "data/lieferung_2024q4.csv"
lieferung <- readr::read_csv(DATENPFAD, show_col_types = FALSE)

jahre_verfuegbar    <- sort(unique(lieferung$jahr))
bereiche_verfuegbar <- lieferung |>
  dplyr::distinct(.data$bereich_code, .data$bereich_name) |>
  dplyr::arrange(.data$bereich_code)

# Auswahlliste: Anzeige "Code - Name", Wert = Code
bereich_auswahl <- stats::setNames(
  bereiche_verfuegbar$bereich_code,
  paste0(bereiche_verfuegbar$bereich_code, " - ", bereiche_verfuegbar$bereich_name)
)

ui <- fluidPage(
  titlePanel("VGR-Backup: Quartalswerte je Bereich"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "jahr", "Jahr",
        choices  = jahre_verfuegbar,
        selected = max(jahre_verfuegbar)
      ),
      selectInput(
        "bereich", "Wirtschaftsbereich",
        choices  = bereich_auswahl,
        selected = unname(bereich_auswahl[1])
      ),
      actionButton("anzeigen", "Anzeigen", class = "btn-primary"),
      tags$hr(),
      downloadButton("download", "Gefiltertes Ergebnis als CSV"),
      tags$hr(),
      helpText(
        "Diese Maske ist die Notlösung für die Vertretung. Sie liest die",
        "Lieferung", code(DATENPFAD), "und filtert ohne R-Kenntnisse."
      )
    ),
    mainPanel(
      h4(textOutput("ueberschrift")),
      tableOutput("tabelle"),
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {

  # Reaktiver Auszug: erst nach Klick auf "Anzeigen" neu berechnen.
  auszug <- eventReactive(input$anzeigen, {
    lieferung |>
      dplyr::filter(
        .data$jahr == as.numeric(input$jahr),
        .data$bereich_code == input$bereich
      ) |>
      dplyr::arrange(.data$quartal)
  }, ignoreNULL = FALSE)

  output$ueberschrift <- renderText({
    df <- auszug()
    if (nrow(df) == 0) {
      return("Keine Daten für diese Auswahl.")
    }
    jahreswert <- sum(df$wert, na.rm = TRUE)
    paste0(
      df$bereich_name[1], " (", input$bereich, "), Jahr ", input$jahr,
      " - Jahressumme ",
      format(jahreswert, big.mark = ".", decimal.mark = ",", nsmall = 1),
      " Mio. EUR"
    )
  })

  output$tabelle <- renderTable({
    auszug() |>
      dplyr::transmute(
        Quartal     = .data$quartal,
        `Wert (Mio. EUR)` = .data$wert
      )
  })

  output$plot <- renderPlot({
    df <- auszug()
    validate(need(nrow(df) > 0, "Keine Daten zum Zeichnen."))
    ggplot(df, aes(x = factor(.data$quartal), y = .data$wert, group = 1)) +
      geom_line(color = "#21303f", linewidth = 1) +
      geom_point(color = "#21303f", size = 3) +
      labs(
        title = paste0("Quartalsverlauf ", df$bereich_name[1], " ", input$jahr),
        x = "Quartal", y = "Wert (Mio. EUR)"
      ) +
      theme_minimal(base_size = 14)
  })

  output$download <- downloadHandler(
    filename = function() {
      paste0("vgr_", input$bereich, "_", input$jahr, ".csv")
    },
    content = function(file) {
      readr::write_csv(auszug(), file)
    }
  )
}

shinyApp(ui, server)
