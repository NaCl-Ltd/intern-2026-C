class TagsController < ApplicationController
  def show
    @tag = Tag.find_by!(name: params[:name])
    @microposts = @tag.microposts
  end
end