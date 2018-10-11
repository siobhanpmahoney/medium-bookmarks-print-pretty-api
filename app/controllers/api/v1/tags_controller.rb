class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Article.create(article_params)
    render json: @tag
  end

  def show
    @tag = Tag.find(params[:id])
    render json: @tag
  end


  private

  def tag_params
    params.require(:tag).permit(:name, article_ids: [],
      articles_attributes: [
        :title,
        :content,
        :date
      ]
    )
  end
end
