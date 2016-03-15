require_relative "./base_repository"

class CustomerRepository < BaseRepository
  def initialize
    @table_columns = ["id", "first_name", "last_name", "created_at", "updated_at"]
    super
  end
end
