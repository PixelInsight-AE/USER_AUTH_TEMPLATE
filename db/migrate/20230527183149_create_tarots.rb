class CreateTarots < ActiveRecord::Migration[7.0]
  def change
    create_table :tarots do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :meaning_up
      t.string :meaning_rev
      t.string :astrology
      t.string :element
      t.string :numerology
      t.string :user_thoughts
      t.boolean :user_feeling
      t.boolean :major_minor

      t.timestamps
    end
  end
end
