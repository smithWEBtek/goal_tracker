class OmniAuthController < ApplicationController
  skip_before_action :require_login, only: [:facebook]

  def facebook
  end
end
