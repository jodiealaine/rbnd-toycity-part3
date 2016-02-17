class Customer
	attr_reader :name
	
	@@customers = []
	
	def initialize options={}
		@name = options[:name]
		add_to_customers
	end

	def self.all
    @@customers
	end

	private

	def add_to_customers
		@@customers << self
	end
end