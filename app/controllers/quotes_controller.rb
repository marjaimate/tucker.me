class QuotesController < ApplicationController
  def index
  end

  def show
    @quote = Quote.find_by token: params[:id]
  end

  def hit_me
    redirect_to quote_path(Quote.all.sample.token)
  end
end
