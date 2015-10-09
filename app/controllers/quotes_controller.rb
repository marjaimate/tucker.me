class QuotesController < ApplicationController
  def index
  end

  def show
    @quote = Quote.find_by token: params[:id]
  end
end
