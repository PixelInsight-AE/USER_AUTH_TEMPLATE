class AddAttributesToCardsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :image_url, :string
    add_column :cards, :description, :string
    add_column :cards, :meaning_up, :string
    add_column :cards, :meaning_rev, :string
    add_column :cards, :astrology, :string
    add_column :cards, :element, :string
    add_column :cards, :numerology, :string
    add_column :cards, :user_thoughts, :string
    add_column :cards, :user_feeling, :boolean
    add_column :cards, :major_minor, :boolean
  end
end
