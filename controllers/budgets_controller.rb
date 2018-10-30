require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')
require_relative('../models/budget')

get "/budget/set/:type" do
  @budget = Budget.find_by_type(params[:type])
  erb(:"budgets/edit")
end

post "/budget/set/:id/:type" do
  budget = Budget.new(params)
  budget.update_amount()
  $budget_total_amount = '0.00'
  $budget_total_amount = '%.2f' % budget.amount if budget.amount != nil
  redirect to "/"
end
