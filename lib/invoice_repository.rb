class InvoiceRepository < BaseRepository
  @all_data = []
  @@model = Invoice

  self.define_finder_methods

  def self.revenue(date)

  end

  def self.invoices_by_date(date)
    invoices = self.all.select do |invoice|
      date.to_s == Date.parse(invoice.created_at).to_s
    end
  end
end