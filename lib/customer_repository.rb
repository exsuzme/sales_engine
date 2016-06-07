class CustomerRepository < BaseRepository
  @all_data = []
  @@model = Customer

  self.define_finder_methods
end
