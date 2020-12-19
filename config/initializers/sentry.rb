# frozen_string_literal: true

if ENV['RAILS_SENTRY_DSN'].present?
  Sentry.init do |config|
    config.dsn = ENV['RAILS_SENTRY_DSN']
    config.breadcrumbs_logger = [:active_support_logger]
  end
end
