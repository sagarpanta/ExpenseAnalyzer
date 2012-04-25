class StaticPagesController < ApplicationController
  def home
	respond_to do |format|
			format.html # home.html.erb
	end
  end
end
