#SIMPLEX FUNCTION
SimplexMin <- function(tableau) {
  
  #TAKES THE VALUES OF ROW AND COLUMN OF THE TABLEAU
  numrow = nrow(tableau)
  numcol = ncol(tableau)
  
  tableau_iter = list()
  basic_iter = list()
  
  # MINIMIZATION METHOD
  
  iter = 0
  max_iter = 9999
  no_valid = FALSE

    while(any(tableau[numrow, -numcol] < 0) && iter < max_iter) {

      pc = which.min((tableau[numrow, 1:numcol - 1]))
      
      tr = tableau[1:(numrow - 1), numcol] / tableau[1:(numrow - 1), pc]
      tr[tr <= 0] = Inf
      
      if(all(is.infinite(tr))) {
        no_valid = TRUE
        break
      }
      pr = which.min(tr)
      
      tableau[pr,] = tableau[pr,] / tableau[pr,pc]
      
      for(i in 1:numrow) {
        
        if(i != pr) {
          NR = tableau[i,pc] * tableau[pr,]
          tableau[i,] = tableau[i,] - NR
        }
      }
      
      iter = iter + 1
      
      tableau_iter = append(tableau_iter, list(tableau))
      basic_curr = matrix(c(tableau[numrow, -(numcol - 1)]), 1, numcol - 1, TRUE)
      basic_iter = append(basic_iter, list(basic_curr))
  }
  
  basic = matrix(c(tableau[numrow, -(numcol - 1)]), 1, numcol - 1, TRUE)
  
  # if reached max iterations, then there could be no solution
  if (iter >= max_iter) {
    labellist = list(finalTableau = tableau, basicSolution = basic, Z = tableau[numrow, numcol], is_solve = FALSE)
    return(labellist)
  }
  # if test ratio is not valid
  else if(no_valid) {
    labellist = list(finalTableau = tableau, basicSolution = basic, Z = tableau[numrow, numcol], is_solve = FALSE, is_not_valid = TRUE)
  }
  # did not reach max iterations, there is a solution
  else {
    labellist = list(finalTableau = tableau, basicSolution = basic, Z = tableau[numrow, numcol], is_solve = TRUE, tableau_iter = tableau_iter, basic_iter = basic_iter)
    return(labellist)
  }
}
