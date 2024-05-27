Rails.application.routes.draw do
      # Mount Api::V1::Users at a specific route
      mount Api::V1::Users => '/api'
    end
    