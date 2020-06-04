class PartnersController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  def index

  end
  private
  def skip_pundit?

  end
end
