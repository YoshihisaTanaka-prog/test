class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text    :text
      t.string  :title
      t.timestamps null: false
    end
  end
end
