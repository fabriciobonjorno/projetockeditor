class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[edit update destroy show]
  before_action :load_tags, only: %i[edit new create update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      save_tags(@article)
      redirect_to articles_path, notice: "#{@article.title} criado com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit;end

  def show;end

  def update
    if @article.update(articles_params)
      save_tags(@article)
      redirect_to articles_path, notice: "#{@article.title} atualizado com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "#{@article.title} excluído com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def load_tags
    @tags = Tag.all
  end

  def save_tags(article)
    if params[:article].present? && params[:article][:tags].present?
      ArticleTag.where(article_id: article.id).destroy_all
      params[:article][:tags].split(",").each do |tag|
        ArticleTag.create(article_id: article.id, tag_id: tag)
      end
    end
  end

  def set_articles
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :body)
  end
end
