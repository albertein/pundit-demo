class Authenticated::AuthenticatedController < ApplicationController
  include Pundit
  before_action :authenticate_user!
  after_action :verify_policy_scoped, :only => [:index, :show, :edit, :update, :destroy]
  after_action :verify_authorized, :except => :index

end
