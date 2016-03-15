class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(options = {})
    @id = options[:id]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @created_at = options[:created_at]
    @updated_at = options[:updated_at]
  end
end