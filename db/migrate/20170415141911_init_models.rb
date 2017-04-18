# rubocop:disable all
class InitModels < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string        :name,    null:  false
      t.string        :email,   null:  false, index: :unique
      t.text          :body
      t.integer  :lock_version
      t.timestamps
    end

    create_table :roles do |t|
      t.string      :title,   null:  false
      t.text        :body
      t.timestamps
    end
    
    create_table :people_roles, id: false do |t|
      t.references    :person, null:  false
      t.references    :role,   null:  false, index: true
    end

    add_index :people_roles, [:person_id, :role_id], unique: true

    create_table :notes do |t|
      t.references    :notable,  polymorphic:  true,  index:  true
      t.references    :author,   index:        true
      t.string        :title,    null:         false
      t.text          :body
      t.integer  :lock_version
      t.timestamps
    end

    create_table :appointments do |t|
      t.string    :title,      null:  false
      t.text      :body
      t.datetime  :when
      t.datetime  :deleted_at
      t.integer :lock_version
      t.timestamps
    end

    create_table :attendants do |t|
      t.references :appointment
      t.references :person, index: true
      t.timestamps
    end

    add_index :attendants, [:appointment_id, :person_id], unique: true
  end
end
