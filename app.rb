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

$alert_colour = '#8ED580'
$alert_message = 'You are safely within budget!'
if $budget_total.amount != nil && $budget_total.amount < Transaction.total_spent
  $alert_colour = '#FA7672'
  $alert_message = '!!! YOU ARE OVER YOUR BUDGET !!!'
end
if ($budget_total.amount != nil && $budget_total.alert_range != nil)
  budget_alert = $budget_total.amount - $budget_total.alert_range
  if budget_alert < Transaction.total_spent
    $alert_colour = '#F9BB6D'
    $alert_message = 'Careful!! You are nearly reaching your budget!!'
  end
  if $budget_total.amount < Transaction.total_spent
    $alert_colour = '#FA7672'
    $alert_message = '!!! YOU ARE OVER YOUR BUDGET !!!'
  end
end

get '/' do
  erb(:index)
end
