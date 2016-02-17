class Customer
	attr_reader :name
	
	@@customers = []
	
	def initialize options={}
		@name = options[:name]
		add_to_customers
	end

	def purchase product
		Transaction.new self, product
	end

	def self.all
    @@customers
	end

	def self.find_by_name customer_name
		@@customers.any? {|customer| return customer if customer.name == customer_name}
		raise NoRecordFoundError, "'#{customer_name}' does not exist."
	end

	private

	def add_to_customers
		@@customers.any? {|customer| customer.name.include?(@name)} ? (raise DuplicateCustomerError, "'#{self.name}' already exists.") : @@customers << self
	end
end