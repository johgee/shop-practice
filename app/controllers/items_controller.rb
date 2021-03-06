class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.as_json
  end

  def create
    item = Item.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url],
    )
    item.save
    render json: item.as_json
  end

  def show
    item = Item.find_by(id: params[:id])
    render json: item.as_json
  end

  def update
    item = Item.with_deleted.find_by(id: params[:id])
    item.name = params[:name] || item.name
    item.price = params[:price] || item.price
    item.description = params[:description] || item.description
    item.image_url = params[:image_url] || item.image_url
    item.deleted_at = params[:deleted_at] || item.deleted_at
    item.save
    render json: item.as_json
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.delete_comment = params[:delete_comment] || item.delete_comment
    item.save
    item.destroy
    render json: { message: "item successfully destroy." }
  end
end
