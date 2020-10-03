class TagsController < ApplicationController
  include TagsHelper

  before_action :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		flash.notice = "Tag #{@tag.title} updated!"
		@tag.update(tag_params)
		redirect_to tag_path(@tag)
	end
end
