class AddAssociationCategoryToLinks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :links, :category, index: true
  end
end