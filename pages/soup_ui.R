source("pages/food_card.R")

soup_ui <- function() {
  div(
    food_card("add_chicknoodle_soup", "Chicken Noodle Soup", "brocolli.jpg"),
    food_card("add_spltpeaham_soup", "Split Pea & Ham Soup", "brocolli.jpg"),
    food_card("add_vegetbeef_soup", "Vegetable Beef Soup", "brocolli.jpg"),
    food_card("add_neweng_clamchwd", "New England Clam Chowder Soup", "brocolli.jpg"),
    food_card("add_tomato_soup", "Tomato Soup", "brocolli.jpg"),
    food_card("add_neclamchwd_wmilk", "New England Clam Chowder Soup W/ Milk", "brocolli.jpg"),
    food_card("add_crmmshrm_wmilk", "Cream of Mushroom Soup W/ Milk", "brocolli.jpg"),
    food_card("add_beanbacn_soup", "Bean Bacon Soup W/ Water", "brocolli.jpg"),
  )
}