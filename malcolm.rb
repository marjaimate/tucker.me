require "yaml"
require 'json'
require "cuba"
require "cuba/safe"
require "cuba/render"
require "erb"

class Quote
  attr_accessor :id, :text, :token
end

# Cuba Plugins
Cuba.use Rack::Session::Cookie, :secret => "SoLongAndThanksForAllTheFish!"
Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render

Cuba.define do
  on get do
    on "quotes" do
      # Index Page
      on root do
        render 'index'
      end

      # Show Quote
      on ":token" do |token|
        quote = YAML.load_file("quotes.yml").select {|q| q.token == token}.first
        render 'show', quote: quote
      end
    end

    # find a quote
    on "hit-me" do
      quote = YAML.load_file("quotes.yml").sample
      res.redirect "/quotes/#{quote.token}"
    end

    on root do
      render 'index'
    end
  end
end
