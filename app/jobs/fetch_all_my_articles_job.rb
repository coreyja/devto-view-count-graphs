# frozen_string_literal: true

class FetchAllMyArticlesJob
  def perform
    paginated_fetch.each do |external_article|
      article = Article.from_api!(external_article)

      article.article_stats.from_api!(external_article)
    end
  end

  private

  def json
    JSON.parse(client.get('articles/me').body)
  end

  def paginated_fetch
    results = []
    page = 1

    loop do
      curr = json_for_page page

      break if curr.empty?

      results.concat(curr)
      page += 1
      sleep 1 # Be nice to the dev.to API. I got some 429s pretty quick
    end

    results
  end

  def json_for_page(page_num)
    resp = client.get('articles/me', page: page_num)

    raise 'bad-request maybe rate limited' unless resp.status == 200

    JSON.parse(resp.body)
  end

  def client
    Faraday.new(
      url: 'https://dev.to/api/',
      headers: { 'api-key' => ENV['DEV_TO_AUTH_TOKEN'] },
      params: { per_page: 100 }
    )
  end
end
