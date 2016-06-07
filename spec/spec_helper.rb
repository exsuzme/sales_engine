Dir.glob(File.expand_path("../../lib/*.rb", __FILE__)).each do |file|
  require file
end

RSpec.configure do |config|
  config.after do |config|
    repositories = [CustomerRepository, InvoiceRepository, InvoiceItemRepository, ItemRepository, MerchantRepository, TransactionRepository]
    repositories.each do |repository|
      repository.clear
    end
  end
end