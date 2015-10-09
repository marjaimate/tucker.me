class AddTokenToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :token, :string, index: true, uniq: true
  end
end
