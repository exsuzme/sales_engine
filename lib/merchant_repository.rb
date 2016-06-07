class MerchantRepository < BaseRepository
  @all_data = []
  @@model = Merchant

  self.define_finder_methods

  def self.most_revenue(x)
    totals = self.all.sort_by do |merchant|
      # - makes invoice total negative so we can reverse sort
      # and get the highest number first
      -merchant.invoice_total
    end.shift(x)
  end
end