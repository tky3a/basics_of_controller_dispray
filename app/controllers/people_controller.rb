class PeopleController < ApplicationController
  def index
    @msg = 'Person.data.'
    @data = Person.all
  end

  def show
    @msg = "Index data."
    @data = Person.find(params[:id])
  end

  def add
    @msg = "新規データ作成"
    @person = Person.new
  end

  protect_from_forgery

  def create
    #　もしcreateにリクエスト(post)された場合の処理
    if request.post?
      Person.create(person_params)
    end
    redirect_to '/people'
  end

  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end



end
