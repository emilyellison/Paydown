class AddGraduateAndBenefactorToUser < ActiveRecord::Migration
  def change
    add_column :users, :graduate, :boolean, default: false
    add_column :users, :benefactor, :boolean, default: false
  end
end
