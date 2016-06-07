class BaseRepository
  @all_data = []
  @@model = nil

  def self.define_finder_methods
    @@model.columns.each do |column|
      BaseRepository.create_find_all_by_method(column)
      BaseRepository.create_find_by_method(column)
    end
  end

  def self.add(*items)
    items.each do |item|
      @all_data << item
    end
  end

  def self.all
    @all_data
  end

  def self.random
    @all_data.sample
  end

  def self.clear
    @all_data = []
  end

  private

  def self.metaclass
    class << self
      self
    end
  end

  def BaseRepository.create_find_by_method(column)
    self.metaclass.instance_eval do
      define_method("find_by_#{column}") do |value|
        self.check_all_records(column, value).first
      end
    end
  end

  def BaseRepository.create_find_all_by_method(column)
    self.metaclass.instance_eval do
      define_method("find_all_by_#{column}") do |value|
        self.check_all_records(column, value)
      end
    end
  end


  def self.check_all_records(column, value)
    @all_data.select do |model|
      model.send(column).downcase == value.downcase
    end
  end
end