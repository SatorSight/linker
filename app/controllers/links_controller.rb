class LinksController < ApplicationController

  def create

  	redirect_path = { controller: 'main', action: 'index' }
  	redirect_path[:mine] = params[:mine] if params[:mine].present?

  	if value_not_empty?
	  	@link = Link.new link_params
	  	if @link.save
	  	  redirect_to redirect_path

	  	  # render json: { message: "success" }, status: 200
	  	else
	  	  redirect_path[:error] = 'yes'
	  	  redirect_to redirect_path
	  	end
  	else
  	  redirect_path[:error] = 'yes'
  	  redirect_to redirect_path
  	end
  end

  def destroy
  	@link = Link.find params[:id]
  	@link.destroy
  end

private

  def link_params
  	params.require(:link).permit(:value, :category_id, :user_id)
  end

  def value_not_empty?
  	params[:link][:value].present?
  end

end