class Transaction
	attr_reader :customer, :product, :id
	@@id = 0
	@@transactions = []
	
	def initialize customer, product
		@customer = customer
		@product = product
		@id = transaction_id 	
		add_transaction if make_transaction
	end

	def make_transaction
		check_stock? ? update_product_stock : (raise OutOfStockError, "'#{@product.title}' is out of stock.") 
	end

	def check_stock?
		@product.in_stock?
	end
	
	def update_product_stock
		@product.deduct_stock 1
	end

	def self.all
		@@transactions
	end	

	def self.purchases_by_customer customer
		@@transactions.map {|transaction| transaction if transaction.customer == customer}
	end

	def self.find transaction_id
		@@transactions.each {|transaction| return transaction if transaction.id == transaction_id }
		raise NoRecordFoundError, "'#{transaction_id}' does not exist."
	end

	private

	def transaction_id
		@@id += 1
	end

	def add_transaction
		@@transactions << self
	end

end