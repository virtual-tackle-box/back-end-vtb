class FixPhoneNumberTypo < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :phon_number, :phone_number
  end
end
