class CustomerRepository

  def initialize
    @all_customers = []
    table_columns = ["id", "first_name", "last_name"]
    table_columns.each do |column|
      self.class.send(:define_method, "find_all_by_#{column}") do |value|
        check_all_records(column, value)
      end

      self.class.send(:define_method, "find_by_#{column}") do |value|
        check_all_records(column, value).first
      end
    end
  end

  def add(customer)
    @all_customers << customer
  end

  def all
    @all_customers
  end

  def random
    @all_customers.sample
  end

  private

  def check_all_records(column, value)
    @all_customers.select do |customer|
      customer.send(column).downcase == value.downcase
    end
  end
end

# metaprogramming -- create a method that will build the "find_by_X" method on the # fly when you input
# use the self.class.send within the metaprogramming to build them