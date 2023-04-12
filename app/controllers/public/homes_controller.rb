class Public::HomesController < ApplicationController
  def top
    @genres = Genre.only_active.includes(:hobbies)
    #@items = Item.recommended
  end
end
