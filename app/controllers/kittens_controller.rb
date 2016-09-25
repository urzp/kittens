class KittensController < ApplicationController
  def	index
    @kittens = Kitten.all
  end

  def	show
    @kitten = Kitten.find(params[:id])
  end

  def	new
    @kitten = Kitten.new
  end

  def	create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "New citten created"
      redirect_to @kitten
    else
      render 'new'
    end
  end

  def	edit

  end

  def	update

  end

  def	destroy

  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age)
  end

end
