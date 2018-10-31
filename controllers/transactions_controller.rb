require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')
require_relative('../models/budget')

get "/transactions" do
  @transactions = Transaction.all_formatted()
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/index")
end

get "/transactions/detail/:id" do
  id = params[:id]
  @transaction = Transaction.find_formatted(id)
  @category = @transaction.find_category
  @seller = @transaction.find_seller
  erb(:"transactions/show")
end

get "/transactions/new" do
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/new")
end

get "/transactions/edit/:id" do
  @transaction = Transaction.find_formatted_for_html_edit_form(params[:id])
  @category = @transaction.find_category
  @seller = @transaction.find_seller
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/edit")
end

get "/transactions/delete/:id" do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/destroy")
end

get "/transactions/filtered/category/:category_id" do
  @category = Category.find(params[:category_id])
  @transactions = Transaction.all_formatted_filtered_category(params[:category_id])
  erb(:"transactions/filtered_by_category")
end

get "/transactions/filtered/seller/:seller_id" do
  @seller = Seller.find(params[:seller_id])
  @transactions = Transaction.all_formatted_filtered_seller(params[:seller_id])
  erb(:"transactions/filtered_by_seller")
end

post "/transactions/create" do
  transaction = Transaction.new(params)
  transaction.save()
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
  redirect to "/transactions"
end

post "/transactions/update/:id" do
  transaction = Transaction.new(params)
  transaction.update()
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
  redirect to "/transactions"
end

post "/transactions/delete/:id" do
  transaction = Transaction.find(params[:id])
  transaction.delete()
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
  redirect to "/transactions"
end

post "/transactions/filtered/category" do
  category_id = params[:category_id]
  redirect to "/transactions/filtered/category/#{category_id}"
end

post "/transactions/filtered/seller" do
  seller_id = params[:seller_id]
  redirect to "/transactions/filtered/seller/#{seller_id}"
end
