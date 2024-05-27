module Api
module V1
    class Users < Grape::API
      version 'v1', using: :path
      format :json
  
      resource :users do
        desc 'Return a list of users'
        get do
          User.all
        end
  
        desc 'Return a specific user'
        params do
          requires :id, type: Integer, desc: 'User ID'
        end
        route_param :id do
          get do
            User.find(params[:id])
          end
        end
  
        desc 'Create a new user'
        params do
          requires :name, type: String, desc: 'User name'
          requires :email, type: String, desc: 'User email'
        end
        post do
          User.create(name: params[:name], email: params[:email])
        end
  
        desc 'Update an existing user'
        params do
          requires :id, type: Integer, desc: 'User ID'
          optional :name, type: String, desc: 'User name'
          optional :email, type: String, desc: 'User email'
        end
        put ':id' do
          user = User.find(params[:id])
          user.update(name: params[:name], email: params[:email])
          user
        end
  
        desc 'Delete a user'
        params do
          requires :id, type: Integer, desc: 'User ID'
        end
        delete ':id' do
          user = User.find(params[:id])
          user.destroy
        end
      end
    end
  end
end