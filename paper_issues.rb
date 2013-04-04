require 'bundler'
Bundler.require

class PaperIssues < Sinatra::Base
  use Rack::Session::Cookie

  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'repo'
  end


  get '/' do
    erb :home, layout: :layout
  end

  get '/auth/github/callback' do
    token = request.env['omniauth.auth'].credentials.token
    origin = request.env['omniauth.origin']
    session[:oauth_token] = token
    redirect to origin || '/'
  end

  get '/redirect' do
    redirect to params[:path]
  end

  get '/token' do
    session[:oauth_token]
  end

  get '/*' do
    repo = params[:splat].first
    @issues = client.issues repo
    erb :issues, layout: :layout
  end

  error Octokit::NotFound do
    erb :repo_not_found, layout: :layout
  end


  private

  def client
    Octokit::Client.new oauth_token: session[:oauth_token]
  end

end
