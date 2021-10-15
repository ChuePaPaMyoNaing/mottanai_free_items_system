class ItemsController < ApplicationController
  def index
    @items = Item.all.where.not(image: nil)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id    
    if @item.save
      redirect_to("/items/#{@item.id}")
    else
      render("items/new")
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to("/items/#{@item.id}")
    else
      render("items/edit")
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to("/items")
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :upload_date, :image)
    end
end
