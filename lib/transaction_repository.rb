class TransactionRepository < BaseRepository
  @all_data = []
  @@model = Transaction

  self.define_finder_methods
end