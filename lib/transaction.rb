class Transaction
	attr_reader :customer, :product
	
	def initialize customer, product
		@customer = customer
		@product = product
	end

end