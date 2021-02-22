class TagsController < ApplicationController
  before_action :set_tags, only: %i[edit update destroy]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      redirect_to articles_path, notice: "#{@tag.description} adicionada com sucesso!"
    else
      flash.now[:alert] = @tag.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tags_params)
      redirect_to articles_path, notice: "#{@tag.description} atualizada com sucesso!"
    else
      flash.now[:alert] = @tag.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      redirect_to articles_path, notice: "#{@tag.description} excluída com sucesso!"
    else
      flash.now[:alert] = @tag.errors.full_messages.to_sentence
      redirect_to articles_path
    end
  end

  private

  def set_tags
    @tag = Tag.find(params[:id])
  end

  def tags_params
    params.require(:tag).permit(:description)
  end
end
