class ProductPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, product)
    @user = user
    @product = product
  end

  def edit?
    @user == @product.user
  end

  def destroy?
    @user == @product.user
  end
end
