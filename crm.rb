# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# Fake contacts

brian = Contact.create("Brian","Du","brian.bh.du@gmail.com","loves to code")
jade = Contact.create("Jade","Tang","yuiii1012@gmail.com","hates to do chores")
pritam = Contact.create("Pritam","Das","pritam.das@gmail.com","goes to Carribean Queen everyday")
gordan = Contact.create("Gordon","Lee","gordon.lee@gmail.com","way too tall")
mina = Contact.create("Mina","Mikhail","mina.mikhail@bitmaker.com","educates struggling students")

get '/' do
  @crm_app_name = "Welcome!"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
