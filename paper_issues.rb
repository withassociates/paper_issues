require 'bundler'
Bundler.require

class PaperIssues < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'secret'

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
    @issues = Pager.new { |page| client.issues repo, page: page }
    erb :issues, layout: :layout
  end


  error Octokit::NotFound do
    erb :repo_not_found, layout: :layout
  end

  error URI::InvalidURIError do
    erb :repo_not_found, layout: :layout
  end

  error do
    erb :whoops, layout: :layout
  end


  class Pager
    attr_reader :page_block

    def initialize &page_block
      @page_block = page_block
    end

    def each &block
      page = 1

      loop do
        items = page_block.call page

        if items.any?
          items.each &block
          page += 1
        else
          break
        end
      end
    end
  end


  private

  def client
    Octokit::Client.new oauth_token: session[:oauth_token]
  end

end
