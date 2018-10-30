require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/categories_controller')
require_relative('controllers/sellers_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/budgets_controller')
require_relative('models/transaction')
require_relative('models/budget')

$budget_total = Budget.find_by_type('total')
$budget_total_amount = '0.00'
$budget_total_amount = '%.2f' % $budget_total.amount if $budget_total.amount != nil
$total_spent = '0.00'
$total_spent = '%.2f' % Transaction.total_spent if Transaction.total_spent != nil

get '/' do
  erb(:index)
end
