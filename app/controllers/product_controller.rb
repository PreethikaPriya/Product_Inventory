class ProductController < ApplicationController
  def detail
  	@products = Product.all
  	@total_product_price = Product.pluck(:price).inject(:+)	
  	
  	product_quantities = Product.pluck(:price,:unit)
	  @total = 0
  	product_quantities.each do |product|
	   @total = @total + product[0] * product[1].to_i
	   end
	#puts total
  end


  def asc_price
  @asc_products = Product.order(:price)
  end

  def des_price
  @dsc_products = Product.order('price DESC')
  end



  def in_stock
  @products = Product.where('in_stock = ?',true)
  #@products = Product.where(in_stock: true)
  @count = Product.where('in_stock = ?',true).count
  end

  def out_stock
  @products = Product.where('in_stock = ?' ,false)
  @count = Product.where('in_stock = ?',false).count
  end

  def available
  @products = Product.where('available_from <= ?', Date.today)
  end

  def not_available
  @products = Product.where('available_from > ?', Date.today)	
  end

  def prod_cat
  	@cats = Cat.pluck(:id)
  end

  def orders_placed
    @orders = Order.all
  end

  def line_item_details
    @orders = Order.pluck(:id)
  end

  def recent_order
    @orders = Order.order('order_date DESC').limit(10)
  end
end
