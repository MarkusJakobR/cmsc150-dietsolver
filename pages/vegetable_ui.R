source("pages/food_card.R")

vegetable_ui <- function() {
  div(
    food_card("add_brocolli", "Frozen Broccoli", "brocolli.jpg"),
    food_card("add_carrot", "Carrots, Raw", "carrot.jpg"),
    food_card("add_celery", "Celery, Raw", "celery.jpg"),
    food_card("add_corn", "Frozen Corn", "corn.jpg"),
    food_card("add_lettuce", "Lettuce, Iceberg, Raw", "lettuce.jpg"),
    food_card("add_potato", "Potatoes, Baked", "potato.jpg"),
    food_card("add_tofu", "Tofu", "tofu.jpg")
  )
}