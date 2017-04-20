class Gallery < ActiveRecord::Base
  # attr_accessible :name, :photo, :photo_original_w, :photo_original_h, :photo_box_w, :photo_crop_x, :photo_crop_y, :photo_crop_w, :photo_crop_h, :photo_aspect
  has_attached_file :photo, :styles => {:thumb => '50x50', :medium => '100x100'}
  crop_attached_file :photo

  validates_attachment :photo, :content_type => { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }, :size => { in: 0..8.megabytes }
end
