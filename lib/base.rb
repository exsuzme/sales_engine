class Base
  def initialize(options = {})
    self.class.columns.each do |column|
      value = options[column]
      self.instance_variable_set("@#{column.to_s}", value)
      self.class.class_eval { attr_reader column }
    end
  end
end