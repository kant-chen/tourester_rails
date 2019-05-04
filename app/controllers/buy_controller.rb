class BuyController < ApplicationController
  def submit
    puts "params is:#{params}"
    order = params['order']
    first_name = order['first_name']
    e_mail = order['e_mail']
    items = order['item']
    err_msg = []
    shopping_list = []
    items.each do |item, qty|
      if chk_stock_qty(item ,qty)
        item = item.to_s()
        puts "push {#{item}:#{qty}} to shopping_list"
        shopping_list.push(Hash[item, qty])
      else
        product = Product.find(item)
        err_msg.push("Product ID: #{item}, Product Name: #{product.product_name1} had been sold out!")
      end
    end
    if err_msg.length > 0
      render :json => {"message": err_msg}, :status => 200
      return
    end
    #add a customer to database
    new_customer = Customer.create(customer_name: first_name, email: e_mail, status: 'Y')
    puts "new_customer.id: #{new_customer.id}"
    #add a order to database
    new_order =  Orderd.create(customer_id: new_customer.id, status: 'Y')
    puts "new_order.id: #{new_order.id}"
    #add order list to database
    order_str = ""
    puts "order_lists is: #{shopping_list}"
    shopping_list.each do |order_item|
      product_id = order_item.keys[0]
      qty = order_item.values[0]
      puts "product_id is:#{product_id}"
      item = Product.find(product_id)
      OrderList.create(order_seq: new_order.id, product_id: product_id,
                        unit_price: item.unit_price, qty: qty,
                        amount: item.unit_price * qty,status: 'Y')
      #update  StockQty
      item.stock_qty -= qty
      item.save
      order_str += "\nProduct ID: #{item.id} Product Name: #{item.product_name1}\
                    Quntity: #{qty}"\
    end

    #add Sendmail to database
    l_content = "Dear #{first_name},\nOrder number:#{new_order.id} has been received.\n\
                 Your order list:#{order_str}"
    new_mail = SendMail.create(to_add: e_mail, title: "Order Confirmed",
                                article: l_content, status: 'N')
    render :json => {"message":"The order has been received!"}, :status => 200
  end

  def index
  end
  def chk_stock_qty(item, qty)
    #check if the stock is satisfied
    l_cnt = Product.where("id = ? AND stock_qty >= ?", item, qty).limit(1).length()
    puts "l_cnt = #{l_cnt}"
    if l_cnt > 0
      return true
    else
      return false
    end
  end
end
