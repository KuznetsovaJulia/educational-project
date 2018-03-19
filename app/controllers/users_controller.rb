class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @courses=current_user.courses
    end
    def create
        if captcha_confirmed?
            super
        else
            build_resource
            clean_up_passwords(resource)
            flash[:error] = "There was an error with the captcha code below. Please re-enter the code and click submit."
            render_with_scope :new
        end
    end
end
