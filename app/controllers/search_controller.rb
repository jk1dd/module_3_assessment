class SearchController < ApplicationController
  def show
    @stores = Store.find_all(params[:zip])
    @total = Store.total(params[:zip])
  end
end
