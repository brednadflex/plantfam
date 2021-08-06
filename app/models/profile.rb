class Profile < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:first_name, :last_name]

  belongs_to :user
  has_many :availabilities
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    "#{first_name} #{last_name}"
  end

  # upload profile image to cloudinary.
  def add_profile_img!(file, options = {overwrite: false, ext_id: ""})
    return nil unless file.present?

    # delete current image if
    Cloudinary::Api.delete_resources([profile_img]) if options[:overwrite] && profile_img.present?
    # upload new image
    cl_info = cloudinary_upload(file, generate_public_id("profile", options))
    update!(profile_img: cl_info["public_id"])
  end

  # upload banner to cloudinary. By default random banner will be uploaded
  def add_banner_img!(file, options = {overwrite: false, ext_id: ""})
    # random banner
    no_banner = !file.present? && !banner_img.present?
    file = 'https://source.unsplash.com/random/900×250/?plants' if no_banner
    return nil unless file.present?

    # delete existing
    Cloudinary::Api.delete_resources([banner_img]) if options[:overwrite] && banner_img.present?
    # upload
    cl_info = cloudinary_upload(file, generate_public_id("banner", options))
    update!(banner_img: cl_info["public_id"])
  end

  def delete_banner_img!
    Cloudinary::Api.delete_resources([banner_img]) if banner_img.present?
    update!(banner_img: "")
  end

  def delete_profile_img!
    Cloudinary::Api.delete_resources([profile_img]) if profile_img.present?
    update!(profile_img: "")
  end

  private

  def generate_public_id(category, options)
    # public ID without timestamp to allow automatic overwriting when seeding
    timestamp = !options[:overwrite] ? DateTime.now.strftime("%Y%m%dT%H%M%S") : ""
    "#{user.email.gsub(/[.+]/, '-').gsub(/@/, '_')}-#{category[0]}#{options[:ext_id]}#{timestamp}"
  end

  def cloudinary_upload(file, public_id, folder = "")
    Cloudinary::Uploader.upload(file, folder: folder, public_id: public_id, overwrite: true)
  end
end
