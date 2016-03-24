class CustomerRepository < BaseRepository
  @all_data = []

  def initialize
    @model = Customer
    super
  end
end
