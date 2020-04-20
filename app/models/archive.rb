class Archive < ApplicationRecord
    belongs_to :dj, counter_cache: true
    before_save :write_attributes_from_mixcloud
  
    has_one_attached :image

    def show_url
      mixcloud_url || other_url
    end

    def mixcloud_image
      return nil unless mixcloud_meta

      mixcloud_meta.dig('image')
    end

    def mixcloud_embed
      return nil unless mixcloud_meta

      mixcloud_meta.dig('embed')
    end
  
    def write_attributes_from_mixcloud
      return unless mixcloud_url
      return if mixcloud_meta.present?

      begin
        url = "https://www.mixcloud.com/oembed/?url=#{mixcloud_url}&format=json"
        url = URI.parse(url)
        response = HTTParty.get(url)
        json = JSON.parse(response.body)
        self.mixcloud_meta = json
      rescue
        nil
      end
    end
end
