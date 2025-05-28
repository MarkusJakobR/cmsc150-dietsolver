TableBreakdown <- function(results, start_col, end_col, foods) {
  
  print(foods$Foods)
  count_foods = length(foods$Foods)
  serving_size = c()
  print("start_col")
  print(start_col)
  print("end_col")
  print(end_col)
  
  for (j in start_col:(end_col-1)) {
    serving_size = c(serving_size, round(results$basicSolution[1,j], 2))
    print(j)
  }
  
  print(serving_size)
  # calculating for the total cost and total servings
  cost = c()
  total_cost = 0
  total_servings = 0
  for (i in 1:length(serving_size)) {
    # idx = 
    serving = sub("^([0-9]+(\\.[0-9]+)?|[0-9]+/[0-9]+).*", "\\1", foods$Serving.Size[i])
    price = as.numeric(sub("\\$","",foods$Price.Serving[i]))
    
    if (grepl("/", serving)) {
      serving = eval(parse(text = serving))
    } else {
      serving = as.numeric(serving)
    }
    total_servings = total_servings + (serving * serving_size[i])
    cost = c(cost, round((price * serving_size[i]), 2))
    total_cost = total_cost + (price * serving_size[i])
  }
  
  breakdown = data.frame(
    Food = foods$Foods,
    Serving_Size = serving_size,
    Cost = cost
  )
  
  breakdown = subset(breakdown, Serving_Size > 0)
  
  labellist = list(table = breakdown, total_servings = total_servings, total_cost = round(total_cost, 2))
  return(labellist)
  
}