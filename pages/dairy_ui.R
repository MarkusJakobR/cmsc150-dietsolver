source("pages/food_card.R")

dairy_ui <- function() {
  div(
    food_card("add_butter", "Butter, Regular", "brocolli.jpg"),
    food_card("add_cheddar", "Cheddar Cheese", "brocolli.jpg"),
    food_card("add_whole_milk", "3.3% Fat, Whole Milk", "brocolli.jpg"),
    food_card("add_lowfat_milk", "2% Lowfat Milk", "brocolli.jpg"),
    food_card("add_skim_milk", "Skim Milk", "brocolli.jpg"),
    food_card("add_poach_eggs", "Poached Eggs", "brocolli.jpg"),
    food_card("add_scrambled_eggs", "Scrambled Eggs", "brocolli.jpg"),
  )
}