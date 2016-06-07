class InvoiceItemRepository < BaseRepository
  @all_data = []
  @@model = InvoiceItem

  self.define_finder_methods
end