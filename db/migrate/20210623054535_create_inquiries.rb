class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :mail_address
      t.integer :category
      t.text :content

      t.timestamps
    end
  end
end
