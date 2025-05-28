source("pages/food_card.R")

meat_ui <- function() {
  div(
    food_card("add_roasted_chicken", "Roasted Chicken", "brocolli.jpg"),
    food_card("add_bologna", "Bologna, Turkey", "brocolli.jpg"),
    food_card("add_frankfurter", "Frankfurter, Beef", "brocolli.jpg"),
    food_card("add_ham", "Ham, Sliced, Extralean", "brocolli.jpg"),
    food_card("add_kielbasa", "Kielbasa, Prk", "brocolli.jpg"),
    food_card("add_pork", "Pork", "brocolli.jpg"),
    food_card("add_sardines", "Sardines in Oil", "brocolli.jpg"),
    food_card("add_tuna", "White Tuna in Water", "brocolli.jpg"),
    food_card("add_hamburger", "Hamburger W/Toppings", "brocolli.jpg"),
    food_card("add_hotdog", "Hotdog, Plain", "brocolli.jpg"),
  )
}