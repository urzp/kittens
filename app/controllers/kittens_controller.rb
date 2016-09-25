class KittensController < ApplicationController
  def	index
    @kittens = Kitten.all
  end

  def	show
    @kitten = Kitten.find(params[:id])
  end

  def	new
    @kitten = Kitten.new
    @label = "Create new kitten"
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
    @kitten = Kitten.find(params[:id])
    @label = "Save kitten"
  end

  def	update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Profile updated"
      redirect_to @kitten
    else
      flash[:danger] = "There is some problem"
      render 'edit'
    end
  end

  def	destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten deleted."
    redirect_to kittens_url
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age)
  end

end
