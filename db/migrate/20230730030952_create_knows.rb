class CreateKnows < ActiveRecord::Migration[6.0]
  def change
    create_table :knows do |t|

      t.timestamps
    end
  end
end
