class User < ApplicationRecord
  enum preferred_theme: { dark: 'dark', light: 'light' }
end
