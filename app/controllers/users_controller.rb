class UsersController < ApplicationController

	require 'digest/md5'
	include ApplicationHelper

  def index
  	@users = User.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  	user = User.new(params['user'])
  	user.activation_key = random_string(16)
  	if user.save
  		flash['success'] = "<b>Thanks for signing up!</b> You'll soon be getting an email with instructions to activate your account."
  		ActionMailer::Base.mail(:from => "postmaster@sandbox73116.mailgun.org", :to => user.email, :subject => "Activate your Todo 2.0 account", :body => "Thanks for signing up for Todo 2.0! Click the link below to activate your account, or copy and paste the address into your address bar if the link doesn't work.\n\nhttp://localhost:3000/activate?key=#{user.activation_key}").deliver
  		redirect_to :root
  	else
  		flash['error'] = "<p><b>Uh oh! Some things went wrong:</b></p>"
  		user.errors.full_messages.each do |error|
  			flash['error'] += "<p>#{error}.</p>"
  		end
  		redirect_to :back
  	end
  end

  def activate
  	if user = User.find_by_activation_key(params['key'])
  		if user.activated == true
  			flash['error'] = "That account has already been activated!"
  			redirect_to :root
  		else
  			user.activated = true
	  		if user.save
	  			flash['success'] = "The account with email #{user.email} was successfully activated!"
	  			redirect_to :root
	  		else
	  			render text: "ERROR BITCH! #{user.errors.full_messages}"
	  		end
	  	end
  	else
  		flash['error'] = "There was no record found with that activation key!"
  		redirect_to :root
  	end
  end

end
