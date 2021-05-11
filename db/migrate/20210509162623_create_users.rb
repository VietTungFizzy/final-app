class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :password
    	t.string :email
      t.string :avatar
    	t.datetime :last_login
    	t.boolean :active, default: true

      	t.timestamps
    end
  end
end
