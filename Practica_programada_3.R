library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos"),
  
  sidebarLayout(
    sidebarPanel( 
      width = 4,
      br(),
      textInput(inputId = "nombre_evento",
                label = "Nombre del Evento:",
                placeholder = "Ej: Boda de María y Julio"),
      br(),
      selectInput(inputId = "tema_evento",
                  label = "Tema del Evento:", 
                  choices = c("Boda", "Fiesta de cumpleaños", "Conferencia", "Otro")),
      br(),
      numericInput(inputId = "numero_invitados", 
                   label = "Número de Invitados", 
                   value = 30,
                   min = 25,
                   max = 120),
      br(),
      selectInput(inputId = "provincia",
                  label = "Provincia:", 
                  choices = c("San José", "Cartago", "Alajuela", "Heredia", "Guanacaste", "Puntarenas", "Limón"))
    ),
    mainPanel(
      h2(strong("Vamos a planificar su día especial!"), align = "center",style = "color:blue"),
      tags$hr(style="border-color:blue;"),
      h3(strong ("Detalles del evento:"), width = 7),
      textOutput("nombre_del_evento"),
      hr(),
      textOutput("tema_del_evento"),
      hr(),
      textOutput("número_de_invitados"),
      textOutput("ubicación_provincia"),
    )
  )
)

server <- function(input, output) {
  
  output$nombre_del_evento <- renderText({paste0("Nombre del Evento: ",
                                              input$nombre_evento, ".")
})
  
  output$tema_del_evento <- renderText({paste0("Tema del Evento: ",
                                              input$tema_evento, ".")
})
  hr()
  output$número_de_invitados <- renderText({paste0("Número de invitados y ubicació: El evento ", input$tema_evento, " tendrá ",input$numero_invitados, " invitados y será llevado a cabo en ", input$provincia, ".")
                                              
})
  
}


shinyApp(ui, server)