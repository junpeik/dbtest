class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search_word
      t.string :rel1
      t.string :rel2
      t.string :rel3
      t.string :rel4
      t.string :rel5

      t.timestamps null: false
    end
  end
end
