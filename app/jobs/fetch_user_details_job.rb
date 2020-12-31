class FetchUserDetailsJob
  extend Memoist

  def perform
    user.update!(
      name: me_json['name'],
      profile_image_url: profile_image_json['profile_image'],
      profile_image_90_url: profile_image_json['profile_image_90']
    )
  end

  private

  memoize def user
    User
      .create_with(name: me_json['name'])
      .create_or_find_by(dev_to_username: me_json['username'])
  end

  memoize def me_json
    resp = client.get 'users/me'

    raise 'Request Failed' unless resp.status == 200

    JSON.parse(resp.body)
  end

  memoize def profile_image_json
    resp = client.get "profile_images/#{me_json['username']}"

    raise 'Request Failed' unless resp.status == 200

    JSON.parse(resp.body)
  end

  def client
    Faraday.new(
      url: 'https://dev.to/api/',
      headers: { 'api-key' => ENV['DEV_TO_AUTH_TOKEN'] }
    )
  end
end
