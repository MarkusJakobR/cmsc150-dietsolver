source("pages/food_card.R")

fruit_ui <- function() {
  div(
    food_card("add_pepper", "Peppers, Sweet, Raw", "brocolli.jpg"),
    food_card("add_tomato", "Tomato, Red, Ripe, Raw", "brocolli.jpg"),
    food_card("add_apple", "Apple, Raw, W/Skin", "brocolli.jpg"),
    food_card("add_banana", "Banana", "brocolli.jpg"),
    food_card("add_grapes", "Grapes", "brocolli.jpg"),
    food_card("add_kiwi", "Kiwifruit, Raw, Fresh", "brocolli.jpg"),
    food_card("add_orange", "Oranges", "brocolli.jpg"),
    food_card("add_apple_pie", "Apple Pie", "brocolli.jpg"),
  )
}