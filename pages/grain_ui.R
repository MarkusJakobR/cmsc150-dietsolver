source("pages/food_card.R")

grain_ui <- function() {
  div(
    food_card("add_couscous", "Couscous", "brocolli.jpg"),
    food_card("add_white_rice", "White Rice", "brocolli.jpg"),
    food_card("add_macaroni", "Macaroni, Cooked", "brocolli.jpg"),
    food_card("add_tortilla", "Tortilla Chip", "brocolli.jpg"),
    food_card("add_oatmeal", "Oatmeal", "brocolli.jpg"),
  )
}