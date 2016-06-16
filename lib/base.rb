class Base
  def initialize(options = {})
    self.class.columns.each do |column|
      value = options[column]
      self.instance_variable_set("@#{column.to_s}", value)
      self.class.class_eval { attr_reader column }
    end
  end

  def self.create(options = {})
    instance = self.new(options)
    repository.add(instance)
    instance
  end

  def save
    self.repository.add(self)
    self
  end

  private

  def self.repository
    # we need to make the string an array for inject to work
    # this method is a workaround for
    # constantize since that is a rails thing
    ["#{self}Repository"].inject(Object) do |memo,name|
      memo = memo.const_get(name)
      memo
    end
  end

  def self.validates_presence_of(options=[])
    @@presence_columns = options
  end
end