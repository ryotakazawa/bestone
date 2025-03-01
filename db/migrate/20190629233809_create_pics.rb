# frozen_string_literal: true

class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
