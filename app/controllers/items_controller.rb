class ItemsController < ApplicationController
  
  def index
    @items = Item.all.where.not(image: nil).paginate(page: params[:page], per_page: 3)
  end

  def new
    @item = Item.new
  end

  def show    
    if user_signed_in?
      @item = Item.find(params[:id])
    else
      redirect_to("/users/sign_in")
    end
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

  def take
    @item = Item.find(params[:id])
    @item.update_attribute(:taked, 1)
    @item.update_attribute(:taked_user, current_user.name)
    @item.update_attribute(:taked_date, DateTime.now)
    if @item.update(item_params_take)
      redirect_to("/items")
    else
      render("/items/#{@item.id}")
    end
  end

  private
    def item_params_take
      params.permit(:name, :description, :upload_date, :image, :taked, :taked_user, :taked_date)
    end
    def item_params
      params.require(:item).permit(:name, :description, :upload_date, :image, :taked, :taked_user, :taked_date)
    end
end
