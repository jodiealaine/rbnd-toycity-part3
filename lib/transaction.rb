class Transaction
	attr_reader :customer, :product, :id
	@@id = 0
	
	def initialize customer, product
		@customer = customer
		@product = product
		@id = transaction_id 	
		make_transaction
	end

	def make_transaction
		check_stock? ? update_product_stock : (raise OutOfStockError, "#{@product.title} is out of stock.") 
	end

	def check_stock?
		@product.in_stock?
	end
	
	def update_product_stock
		@product.deduct_stock 1
	end

	private

	def transaction_id
		@@id += 1
	end

end