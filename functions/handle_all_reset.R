handle_all_reset <- function(input, session, output, reactive_values) {
  observeEvent(input$check_all, {
    lapply(names(food_ids), function(id) {
      updateCheckboxInput(session, id, value = TRUE)
    })
  })
  
  observeEvent(input$reset_all, {
    lapply(names(food_ids), function(id) {
      updateCheckboxInput(session, id, value = FALSE)
    })
    
    output$init_tableau = renderTable(NULL)
    output$final_tableau = renderTable(NULL)
    output$breakdown = renderTable(NULL)
    output$breakdown_text = renderUI(NULL)
    output$init_title = renderUI(NULL)
    output$final_title = renderUI(NULL)
    output$iter_title = renderUI(NULL)
    output$selected_tableau = renderTable(NULL)
    output$selected_basic = renderTable(NULL)
    output$iter_buttons = renderUI(NULL)
    
    reactive_values$total_cost = 0
    reactive_values$total_servings = 0
    reactive_values$results = NULL
  })
}