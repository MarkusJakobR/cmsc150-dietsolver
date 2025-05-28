handle_add <- function(input, selected_foods) {
  observe({

    checked_buttons <- grep("^add_", names(input), value = TRUE)
    
    for (btn_id in checked_buttons) {
      
      row_idx = food_ids[[btn_id]]
      
      if (!is.null(row_idx)) {
        # if checkbox is checked
        if (input[[btn_id]]) {
          
          selected_foods$food_list = unique(c(selected_foods$food_list, row_idx))
          # if checkbox is unchecked
        } else {
          selected_foods$food_list = setdiff(selected_foods$food_list, row_idx)
        }
      }
    }

  })
}