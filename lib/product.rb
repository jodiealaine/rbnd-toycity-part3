class Product
	attr_reader :title
	@@products = []

	def initialize options={}
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
	end

	private

	def add_to_products
		@@products.any? {|t| t.title.include?(@title)} ? (raise DuplicateProductError, "#{@title} already exists.") : @@products << self 
	end
end