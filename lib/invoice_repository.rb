class InvoiceRepository < BaseRepository
  @all_data = []
  @@model = Invoice

  self.define_finder_methods
end