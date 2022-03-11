require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      # css,jsのファイルは作成せず
      g.assets false
      # コントローラー作成時にconfig/routes.rbが書き換えられないようにする。
      # g.skip_routes false
      # テストファイルは作成せず
      g.test_framework false
      # ヘルパーファイルも作成せず
      g.helper false
    end
        # 追加
    # Railsアプリのタイムゾーン(default 'UTC')
    config.time_zone = 'Tokyo'
    # データベースの読み書きに使用するタイムゾーン(:local | :utc(default))
    config.active_record.default_timezone = :local

    # i18nで使われるデフォルトのロケールファイルの指定(default :en)
    config.i18n.default_locale = :ja

    # $LOAD_PATHにautoload pathを追加しない(Zeitwerk有効時false推奨)
    config.add_autoload_paths_to_load_path = false

    # config.autoload_paths += %W(#{config.root}/lib)
    config.api_only = true
  end
end
