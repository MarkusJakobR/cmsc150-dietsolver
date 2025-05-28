source("pages/food_card.R")

cereal_ui <- function() {
  div(
    food_card("add_capn_crunch", "Cap'N Crunch", "brocolli.jpg"),
    food_card("add_cheerios", "Cheerios", "brocolli.jpg"),
    food_card("add_cornflks_kelloggs", "Corn Flakes, Kellogg's", "brocolli.jpg"),
    food_card("add_raisinbrn_kelloggs", "Raisin Bran Kelloggs", "brocolli.jpg"),
    food_card("add_rice_krispies", "Rice Krispies", "brocolli.jpg"),
    food_card("add_special_k", "Special K", "brocolli.jpg"),
    food_card("add_oatmeal", "Oatmeal", "brocolli.jpg"),
    food_card("add_maltomeal", "Malt-O-Meal, Choco", "brocolli.jpg"),
  )
}