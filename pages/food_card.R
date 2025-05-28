food_card <- function(food_id, food_name, food_img) {
  checkboxInput(food_id, food_name, value = FALSE)
}