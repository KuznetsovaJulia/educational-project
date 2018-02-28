class UserController < ApplicationController
    before_filter :authenticate_user!
    def create
        if method_to_check_captcha
            super
        else
            build_resource
            clean_up_passwords(resource)
            flash[:error] = "There was an error with the captcha code below. Please re-enter the code and click submit."
            render_with_scope :new
        end
    end
end
