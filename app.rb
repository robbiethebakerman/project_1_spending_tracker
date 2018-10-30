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
$alert_colour = 'green'
$alert_colour = 'red' if $budget_total.amount != nil && $budget_total.amount < Transaction.total_spent
if ($budget_total.amount != nil && $budget_total.alert_range != nil)
  budget_alert = $budget_total.amount - $budget_total.alert_range
  $alert_colour = 'orange' if budget_alert < Transaction.total_spent
  $alert_colour = 'red' if $budget_total.amount < Transaction.total_spent
end

# $alert_colour = 'green'
# $alert_colour = 'red' if $budget_total.amount != nil && $budget_total.amount < Transaction.total_spent

# budget_minus_alert_range = $budget_total.amount - $budget_total.alert_range if $budget_total.amount != nil && $budget_total.alert_range != nil
# $alert_colour = orange if $budget_total.amount != nil && $budget_total.alert_range != nil &&

get '/' do
  erb(:index)
end


# $alert_colour = 'green'
# # alert_range = $budget_total.alert_range
# # budget_amount = $budget_total.amount
# $alert_colour = 'orange' if ($budget_total.alert_range != nil) && ($budget_total.amount != nil) && ($budget_total.amount - $budget_total.alert_range < Transaction.total_spent)
# $alert_colour = 'red' if ($budget_total.alert_range = nil) && ($budget_total.amount != nil) && ($budget_total.amount < Transaction.total_spent)
# redirect to "/transactions"
