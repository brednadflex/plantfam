class Profile < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    "#{first_name} #{last_name}"
  end

  # upload profile image to cloudinary.
  def add_profile_img!(file, manual_upload = true)
    return nil unless file.present?

    Cloudinary::Api.delete_resources([profile_img]) if manual_upload
    cl_info = cloudinary_upload(file, generate_public_id("profile", manual_upload))
    update!(profile_img: cl_info["public_id"])
  end

  # upload banner to cloudinary. By default random banner will be uploaded
  def add_banner_img!(file, manual_upload = true)
    no_banner = !file.present? && !banner_img.present?
    file = 'https://source.unsplash.com/random/900×250/?plants' if no_banner
    return nil unless file.present?

    Cloudinary::Api.delete_resources([banner_img]) if manual_upload
    cl_info = cloudinary_upload(file, generate_public_id("banner", manual_upload))
    update!(banner_img: cl_info["public_id"])
  end

  def remove_images!
    prefix = public_id_generate_public_id("...", false)[0..-2]
    Cloudinary::Api.delete_resources(prefix)
    update!(profile_img: "", banner_img: "")
  end

  private

  def generate_public_id(category, manual_upload = true)
    timestamp = manual_upload ? DateTime.now.strftime("%Y%m%dT%H%M%S") : ""
    "#{user.email.gsub(/[.]/, '-').gsub(/@/, '_')}-#{category[0]}#{timestamp}"
  end

  def cloudinary_upload(file, public_id, folder = "")
    Cloudinary::Uploader.upload(file, folder: folder, public_id: public_id, overwrite: true)
  end
end
