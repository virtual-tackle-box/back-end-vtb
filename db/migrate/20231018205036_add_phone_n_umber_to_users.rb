class AddPhoneNUmberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phon_number, :string
  end
end
