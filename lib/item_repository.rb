class ItemRepository < BaseRepository
  @all_data = []
  @@model = Item

  self.define_finder_methods
end