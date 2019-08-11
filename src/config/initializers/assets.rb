Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')

webpack_manifest_path = Rails.root.join('public', 'assets', 'manifest.json')
Rails.application.config.assets.webpack_manifest =
  if File.exist?(webpack_manifest_path)
    JSON.parse(File.read(webpack_manifest_path))
  end
