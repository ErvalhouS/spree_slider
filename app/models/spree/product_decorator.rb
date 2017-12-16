Spree::Product.class_eval do
  has_many :slides, dependent: :destroy
  after_update :destroy_slides_if_deleted

  def destroy_slides_if_deleted
    slides.map{|slide| slide.update_attributes(published: false)} if slides && deleted_at
  end
end
