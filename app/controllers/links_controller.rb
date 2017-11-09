class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

  	redirect_path = { controller: 'main', action: 'index' }
  	redirect_path[:mine] = params[:mine] if params[:mine].present?

  	if value_not_empty?

		link = params[:link][:value]
		if link.include? 'http'
			link.sub! 'https', ''
			link.sub! 'http', ''
			link.sub! '://', ''
			params[:link][:value] = link
		end

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

    redirect_path = { controller: 'main', action: 'index' }
    redirect_to redirect_path
  end

  def detail
    @link = Link.find params[:id]

    render :layout => false
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(user_params)

    redirect_path = { controller: 'main', action: 'index' }
    redirect_to redirect_path
  end


private

  def link_params
  	params.require(:link).permit(:value, :category_id, :user_id)
  end

  def value_not_empty?
  	params[:link][:value].present?
  end

  def user_params
    params[:link].permit(:value, :comment)
  end


end