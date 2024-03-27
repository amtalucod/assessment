class Users::RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if params[:user][:image].present?
          begin
            cloudinary_response = Cloudinary::Uploader.upload(params[:user][:image].tempfile)
            resource.image = cloudinary_response['secure_url']
            resource.save
          rescue => e
            # Handle error uploading image
            Rails.logger.error("Error uploading image: #{e.message}")
          end
        end
      end
    end
  end