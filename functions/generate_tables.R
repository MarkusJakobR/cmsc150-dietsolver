generate_tables <- function(tableau_iter, basic_iter, output, session, input) {
  
  current_iter = reactiveVal(1)
  
  output$iter_buttons = renderUI({
    buttons = lapply(seq_along(tableau_iter), function(i) {
      actionButton(
        inputId = paste("btn_iter_", i),
        label = as.character(i),
        class = "btn btn_primary",
        style = "margin-right: 5px;"
      )
    })
    tagList(
      actionButton("prev_iter", "Prev", class = "btn btn-secondary"),
      buttons,
      actionButton("next_iter", "Next", class = "btn btn-secondary")
    )
  })
  
  observe({
    for (i in seq_along(tableau_iter)) {
      observeEvent(input[[paste0("btn_iter_", i)]], {
        current_iter(i)
      })
    }
  })
  
  observeEvent(input$next_iter, {
    new_iter = current_iter() + 1
    if (new_iter <= length(tableau_iter)) {
      current_iter(new_iter)
    }
  })
  
  observeEvent(input$prev_iter, {
    new_iter <- current_iter() - 1
    if (new_iter >= 1) {
      current_iter(new_iter)
    }
  })
  
  output$selected_tableau = renderTable({
    iter = current_iter()
    tableau_iter[[iter]]
  })
  
  output$selected_basic = renderTable({
    iter = current_iter()
    basic_iter[[iter]]
  })
  
  output$iter_title = renderUI({
    HTML(paste0(
      "<h4>Tableau and Basic Solution for each iteration</h4>"
    ))
  })
  
}