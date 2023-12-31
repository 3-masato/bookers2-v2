class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params[:content]
    @target = params[:target]
    @conditions = params[:conditions]

    puts params

    case @target
    when "user"
      @records = User.search_for(:name, @content, @conditions).with_relationships
    when "book"
      @records = Book.search_for(:title, @content, @conditions).with_details
    end
  end
end
