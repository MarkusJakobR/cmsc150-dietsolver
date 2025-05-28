source("pages/food_card.R")

misc_ui <- function() {
  div(
    food_card("add_spaghetti", "Spaghetti W/ Sauce", "brocolli.jpg"),
    food_card("add_pizza", "Pizza W/ Pepperoni", "brocolli.jpg"),
    food_card("add_taco", "Taco", "brocolli.jpg"),
    food_card("add_hamburger", "Hamburger W/ Toppings", "brocolli.jpg"),
    food_card("add_hotdog", "Hotdog, Plain", "brocolli.jpg"),
    food_card("add_rice_krispies", "Rice Krispies", "brocolli.jpg"),
    food_card("add_special_k", "Special K", "brocolli.jpg"),
    food_card("add_peanut_butter", "Peanut Butter", "brocolli.jpg"),
    food_card("add_popcorn", "Popcorn, Air-Popped", "brocolli.jpg"),
    food_card("add_potato_chips", "Potato Chips, BBQ flavor", "brocolli.jpg"),
    food_card("add_pretzels", "Pretzels", "brocolli.jpg"),
    food_card("add_tortilla", "Tortilla Chip", "brocolli.jpg"),
  )
}