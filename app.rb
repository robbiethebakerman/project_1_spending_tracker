require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/categories_controller')
require_relative('controllers/sellers_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/budgets_controller')
require_relative('models/transaction')
require_relative('models/budget')

set :budget_total, Budget.find_by_type('total')
set :budget_total_amount, '0.00'
set :budget_total_amount, '%.2f' % settings.budget_total.amount if settings.budget_total.amount != nil
set :total_spent, '0.00'
set :total_spent, '%.2f' % Transaction.total_spent if Transaction.total_spent != nil

get '/' do
  erb(:index)
end
