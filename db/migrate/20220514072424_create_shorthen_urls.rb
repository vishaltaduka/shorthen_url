class CreateShorthenUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shorthen_urls do |t|
      t.string :short_url
      t.datetime :expire_at
      t.string :original_url
      t.integer :no_of_clicks
      t.string :top_countries
      t.string :ip_address
      t.references :user
      t.timestamps
    end
  end
end
