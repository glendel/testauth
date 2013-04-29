class Users::SessionsController < Devise::SessionsController

def new
 resource = build_resource({})
 respond_to do |format|
      format.html { # index.html.erb
        if ( request.xhr? )
          render( { :partial => :layout => false } )
          return
        end
      }
      format.json { render json: @users }
    end
end

end
