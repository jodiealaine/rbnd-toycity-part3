class Transaction
	attr_reader :customer, :product, :id, :status
	@@id = 0
	
	def initialize customer, product
		@customer = customer
		@product = product
		@id = transaction_id
		@status = transaction_successful?  	
	end

	def transaction_successful?
		true unless complete_transaction == false
	end

	def complete_transaction
		check_stock? ? update_product_stock : false 
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