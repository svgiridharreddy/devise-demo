class UserMailer < Devise::Mailer
	helper :application
	include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
	default template_path: 'devise/mailer'
	# Overrides same inside Devise::Mailer
  def confirmation_instructions(record, token, opts={})
		binding.pry
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def unlock_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  private
  ##
  # Sets organization of the user if available
  def set_organization_of(user)
    @organization = user.organization rescue nil
  end

end
