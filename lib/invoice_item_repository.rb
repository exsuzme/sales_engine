class InvoiceItemRepository < BaseRepository
  @all_data = []
  def initialize
    @model = InvoiceItem
    super
  end
end