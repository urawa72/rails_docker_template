 require "open-uri"

 module WebpackBundleHelper

   # js用ヘルパー
  def javascript_bundle_tag(entry, **options)
    path = asset_bundle_path("#{entry}.js")

     options = {
      src: path,
      defer: true,
    }.merge(options)

     options.delete(:defer) if options[:async]

     javascript_include_tag "", **options
  end

   # css用ヘルパー
  def stylesheet_bundle_tag(entry, **options)
    path = asset_bundle_path("#{entry}.css")

     options = {
      href: path,
    }.merge(options)

     stylesheet_link_tag "", **options
  end

   private

   def dev_manifest
    host = "http://#{request.host}:3035/public"
    manifest = JSON.parse(OpenURI.open_uri("http://#{request.host}:3035/public/assets/manifest.json").read)
    [host, manifest]
  end

   def pro_manifest
    host = Rails.application.config.action_controller.asset_host
    manifest = Rails.application.config.assets.webpack_manifest
    [host, manifest]
  end

   def asset_bundle_path(entry, **options)
    host, manifest = dev_manifest if Rails.env.development?
    host, manifest = pro_manifest if Rails.env.production?
    asset_path("#{host}/assets/" + manifest.fetch(entry), **options)
  end
end
