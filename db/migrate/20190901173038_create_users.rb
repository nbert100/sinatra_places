class CreateUsers < ActiveRecord::Migration
  def change
    creat_table :users do |t|
      t.string :name 
      t.string :username
      t.string :password_digest
    end
  end
end
