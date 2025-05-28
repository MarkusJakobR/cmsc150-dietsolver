# Load packages

library(shiny)
library(bslib)

source("pages/vegetable_ui.R")
source("pages/meat_ui.R")
source("pages/fruit_ui.R")
source("pages/dairy_ui.R")
source("pages/soup_ui.R")
source("pages/baked_goods_ui.R")
source("pages/cereal_ui.R")
source("pages/grain_ui.R")
source("pages/misc_ui.R")
source("pages/all_ui.R")
source("pages/food_card.R")
source("functions/handle_add.R")
source("functions/food_ids.R")
source("functions/handle_all_reset.R")
source("functions/solve_food.R")

# Get the data

# IMPORTANT!!!
setwd("/Users/markusrecaplaza/Documents/CMSC/150/project/finalproject") #change the directory depending on the location of this folder

data <- read.csv("NutritionalValues.csv")
save(data, file = "NutritionalValues.RData")

# Load data

load("NutritionalValues.RData")

# Define UI

ui <- page_fluid(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  div(
    class="diet-solver-title",
    titlePanel("Diet Solver"),
  ),
  div(
    style = "padding: 10px; padding-top: 10px",
    layout_columns(
      accordion(
        accordion_panel(
          title="Vegetables",
          vegetable_ui()
        ),
        accordion_panel(
          title="Meat",
          meat_ui()
        ),
        accordion_panel(
          title="Fruits",
          fruit_ui()
        ),
        accordion_panel(
          title="Dairy",
          dairy_ui()
        ),
        accordion_panel(
          title="Soup",
          soup_ui()
        ),
        accordion_panel(
          title="Baked Goods",
          baked_goods_ui()
        ),
        accordion_panel(
          title="Cereals",
          cereal_ui()
        ),
        accordion_panel(
          title="Grain",
          grain_ui()
        ),
        accordion_panel(
          title="Misc",
          misc_ui()
        ),
        accordion_panel(
          title="All",
          all_ui()
        ),
      ),
      div(
        layout_columns(
          actionButton("check_all", "Check All", class="action-button-solving"),
          actionButton("reset_all", "Reset All", class="action-button-solving"),
          actionButton("solve", "Solve", class="action-button-solving"),
        ),
        layout_columns(
          
          div(
            htmlOutput("breakdown_text"),
            tableOutput("breakdown"),
            div(
              htmlOutput("init_title"),
              div(
                class="tableau_window",
                tableOutput("init_tableau"),
              ),
              htmlOutput("final_title"),
              div(
                class="tableau_window",
                tableOutput("final_tableau")
              ),
            ),
            div(
              htmlOutput("iter_title"),
              div(
                class="tableau_window",
                tableOutput("selected_tableau"),
              ),
              div(
                class="tableau_window",
                tableOutput("selected_basic"),
              ),
              div(
                class="tableau_window",
                uiOutput("iter_buttons"),
              ),
            ),
          ),
          
        ),
      ),
      col_widths = c(4,8)
    )
  )
)

server <- function(input, output, session) {
  
  reactive_values = reactiveValues(
    total_cost = 0,
    total_servings = 0,
    food_list = integer(0)
  )
  
  handle_add(input, reactive_values)
  
  handle_all_reset(input, session, output, reactive_values)
  
  solve_food(input, reactive_values, output, session)
}

shinyApp(ui = ui, server = server)