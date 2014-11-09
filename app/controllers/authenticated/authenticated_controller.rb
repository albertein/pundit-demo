class Authenticated::AuthenticatedController < ApplicationController
    before_action :authenticate_user!
end
