class AddPopularityToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :popularity, :string
  end
end
