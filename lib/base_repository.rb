class BaseRepository
  @all_data = []

  def initialize
    # TODO: Make these class method definitions instead of instance methods
    @model.columns.each do |column|
      self.class.send(:define_method, "find_all_by_#{column}") do |value|
        check_all_records(column, value)
      end

      self.class.send(:define_method, "find_by_#{column}") do |value|
        check_all_records(column, value).first
      end
    end
  end

  def self.add(item)
    @all_data << item
  end

  def self.all
    @all_data
  end

  def self.random
    @all_data.sample
  end

  private

  def metaclass
    class << self
      self
    end
  end

  def check_all_records(column, value)
    @all_data.select do |customer|
      customer.send(column).downcase == value.downcase
    end
  end
end