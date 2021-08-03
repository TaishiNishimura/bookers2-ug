class SearchsController < ApplicationController
	def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif
        User.where('name LIKE ?', '%'+content+'%')
      elsif
      	User.where('name LIKE ?', content+'%')
      elsif
      	User.where('name LIKE ?', '%'+content)
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif
        Book.where('title LIKE ?', '%'+content+'%')
      elsif
      	Book.where('title LIKE ?', content+'%')
      elsif
      	Book.where('title LIKE ?', '%'+content)
      end
    end
  end
end
