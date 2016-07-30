100.times do
	product = Product.new
	product.name = Faker::Commerce.product_name
	product.price = Faker::Commerce.price
	product.unit = Faker::Number.between(10,100)
	product.in_stock = Faker::Boolean.boolean
	product.available_from = Faker::Date.between(3.months.ago, 3.months.from_now)
	product.category = Faker::Number.between(1,10)
	product.save
end

10.times do
category = Cat.new	
category.category_name = Faker::Commerce.department(1)
category.save
end

products = Product.pluck(:price,:unit)
@total = 0
products.each do |product|
	@total = @total + product[0] * product[1].to_i
end
puts total


	cats = Cat.pluck(:id)
	cats.each do |cat|
		puts "category = #{cat}"
		product = Product.where('category = ?', cat).to_a
		product.each do |p|
			puts p.name
		end
	end

20.times do
order = Order.new
order.order_date = Faker::Date.between(Date.today,2.months.ago)
order.order_number = Faker::Code.asin
order.save
end


50.times do
	litem = Lineitemnew.new
	litem.order_id = Faker::Number.between(1,20)
	litem.product_id = Product.where('available_from <= ?', Order.find(litem.order_id).order_date).sample.id
	litem.quantity = Faker::Number.between(1,10)
	litem.price = Product.find(litem.product_id).price
	litem.total_price = litem.quantity * litem.price
	litem.save
end

