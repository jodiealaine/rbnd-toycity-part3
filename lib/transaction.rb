class Transaction
	attr_reader :customer, :product, :id
	@@id = 0
	
	def initialize customer, product
		@customer = customer
		@product = product
		@id = transaction_id
	end

	private

	def transaction_id
		@@id += 1
	end

end