source("pages/food_card.R")

baked_goods_ui <- function() {
  div(
    food_card("add_bagel", "Bagels", "brocolli.jpg"),
    food_card("add_wheat_bread", "Wheat Bread", "brocolli.jpg"),
    food_card("add_white_bread", "White Bread", "brocolli.jpg"),
    food_card("add_oatmeal_cookies", "Oatmeal Cookies", "brocolli.jpg"),
    food_card("add_apple_pie", "Apple Pie", "brocolli.jpg"),
    food_card("add_chocochip_cookies", "Chocolate Chip Cookies", "brocolli.jpg"),
  )
}