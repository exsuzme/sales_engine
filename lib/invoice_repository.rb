class InvoiceRepository < BaseRepository
  @all_data = []

  def initialize
    @model = Invoice
    super
  end
end