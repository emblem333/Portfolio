class Public::HomesController < ApplicationController
  def top
    #@genres = Genre.only_active.includes(:hobbies)
    #@items = Item.recommended
  end
  
  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = search_for(@model, @content, @method)
  end
  
  
end
