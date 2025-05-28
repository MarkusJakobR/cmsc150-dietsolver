source("functions/simplex.R")
source("functions/table_breakdown.R")
source("functions/generate_tables.R")

solve_food <- function(input, reactive_values, output, session) {
  
  observeEvent(input$solve, {

    foods = data[reactive_values$food_list,]
    
    # if there are no foods selected
    if (nrow(foods) == 0) {
      output$breakdown_text = renderUI({
        HTML(paste0(
          "<h4>There are no selected foods.</h4>"
        ))
      })
      return()
    }
    
    minServing = 0
    maxServing = 10

    count_foods = length(foods$Foods)
    
    # 11 tabulated nutrients
    num_nutrients = 11
    
    # 2 slacks each per nutrient + 1 slack per count of food for the serving size constraint + rhs
    num_slacks = (2 * num_nutrients) + (count_foods) + 1
    # columns for the coefficient of the foods + slacks
    # numcol = count_foods + num_slacks
    numcol = count_foods + 1
    # slacks + the z equation
    numrow = num_slacks

    init_tableau = matrix(0, nrow=numrow, ncol=numcol, TRUE)
    # constraints of each nutrient
    rhs = c(1900, -2250, 0, -300, 0, -65, 0, -2400, 0, -300, 25, -100, 50, -100, 5000, -50000, 50, -20000, 800, -1600, 10, -30)
    serving_idx = (2 * num_nutrients) + 1

    # setting up the coefficients of the foods
    # negative coeff for constraints with >=
    
    for (i in 1:count_foods) {
      init_tableau[1,i] = foods$Calories[i]
      init_tableau[2,i] = -foods$Calories[i]
      init_tableau[3,i] = foods$Cholesterol[i]
      init_tableau[4,i] = -foods$Cholesterol[i]
      init_tableau[5,i] = foods$Total_Fat[i]
      init_tableau[6,i] = -foods$Total_Fat[i]
      init_tableau[7,i] = foods$Sodium[i]
      init_tableau[8,i] = -foods$Sodium[i]
      init_tableau[9,i] = foods$Carbohydrates[i]
      init_tableau[10,i] = -foods$Carbohydrates[i]
      init_tableau[11,i] = foods$Dietary_Fiber[i]
      init_tableau[12,i] = -foods$Dietary_Fiber[i]
      init_tableau[13,i] = foods$Protein[i]
      init_tableau[14,i] = -foods$Protein[i]
      init_tableau[15,i] = foods$Vit_A[i]
      init_tableau[16,i] = -foods$Vit_A[i]
      init_tableau[17,i] = foods$Vit_C[i]
      init_tableau[18,i] = -foods$Vit_C[i]
      init_tableau[19,i] = foods$Calcium[i]
      init_tableau[20,i] = -foods$Calcium[i]
      init_tableau[21,i] = foods$Iron[i]
      init_tableau[22,i] = -foods$Iron[i]
      
      # set up the rhs for each serving constraint
      init_tableau[serving_idx, i] = -1
      init_tableau[serving_idx, numcol] = -maxServing
      serving_idx = serving_idx + 1
      
      # z equation (remove the dollar sign)
      price = as.numeric(sub("\\$","",foods$Price.Serving[i]))
      init_tableau[numrow,i] = price
    }
    
    # placing the constraints of the nutrients to the rhs
    for (i in 1:(length(rhs))) {
      init_tableau[i, numcol] = rhs[i]
    }
    
    transposed_tableau = t(init_tableau)
    transposed_tableau[numcol,] = transposed_tableau[numcol,] * (-1)

    new_numcol = ncol(transposed_tableau) + nrow(transposed_tableau)
    new_numrow = nrow(transposed_tableau)
    solve_tableau = matrix(0, nrow=new_numrow, ncol=new_numcol, TRUE)
    
    sol_col = transposed_tableau[, numrow]
    transposed_tableau[,numrow] = 0

    solve_tableau[, 1:(ncol(transposed_tableau))] = transposed_tableau
    solve_tableau[,new_numcol] = sol_col
    
    row_idx = 1
    for (i in (ncol(transposed_tableau)):(new_numcol - 1)) {
      solve_tableau[row_idx, i] = 1
      row_idx = row_idx + 1
    }

    colnames(solve_tableau) = c(paste0("S_", 1:(ncol(transposed_tableau) - 1)), paste0("x_", 1:(nrow(transposed_tableau) - 1)), "Z", "Solution")

    output$init_tableau = renderTable({solve_tableau})
    output$init_title = renderUI({
      HTML(
        paste0("<h4>Initial Tableau</h4>")
      )
    })

    # get the results of the simplex (labeled list)
    results = SimplexMin(solve_tableau)
    
    # check if there is a solution, if not print that it is infeasible
    if (results$is_solve == FALSE) {
      if (results$is_not_valid == TRUE) {
        output$breakdown_text = renderUI({
          HTML(paste0(
            "<h4>The problem is infeasible. There is no valid pivot row.</h4>"
          ))
        })
      }
      else {
        output$breakdown_text = renderUI({
          HTML(paste0(
            "<h4>The problem is infeasible. It has reached max iterations</h4>"
          ))
        })
      }
      return()
    }
    
    table_breakdown = TableBreakdown(results, ncol(transposed_tableau), (new_numcol - 1), foods)
    
    reactive_values$total_cost = table_breakdown$total_cost
    reactive_values$total_servings = table_breakdown$total_servings
    
    output$breakdown_text = renderUI({
      if (length(foods) != 0) {
        HTML(paste0(
          "<h4>The Optimized Menu:</h4>",
          "<p>The cost of this optimal diet is <b>$", reactive_values$total_cost, "</b> per day.</p>",
          "<h4>The Solution and Cost Breakdown by Food:</h4>"
        ))
      } else {
        HTML(paste0(
          "<h4>There are no selected foods.</h4>",
        ))
      }
      
    })
    output$breakdown = renderTable({table_breakdown$table})
    output$final_tableau = renderTable(results$finalTableau)
    output$final_title = renderUI({
      HTML(paste0(
        "<h4>Final Tableau</h4>"
      ))
    })
    
    generate_tables(results$tableau_iter, results$basic_iter, output, session, input)
    
    
  })
}