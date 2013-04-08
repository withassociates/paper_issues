# Paper Issues

Printable versions of your GitHub issues to cut out and keep!

A [With Associates](http://withassociates.com) project.

## Getting Started

Clone the project to a suitable working directory and install its dependencies:

    cd ~/Sites
    git clone git@github.com:withassociates/paper_issues.git
    cd paper_issues
    gem install bundler
    bundle

Register a GitHub application for local development:

* Visit https://github.com/settings/applications/new
* Set `Main URL` and `Callback URL` to `http://localhost:5000/`
* Click `Register application`

Now create a file called `.env` in the app's working directory,
containing the GitHub client ID and secret:

    GITHUB_KEY='YOUR_CLIENT_ID'
    GITHUB_SECRET='YOUR_CLIENT_SECRET'

Now boot the app:

    foreman start

**Finally**, visit [http://localhost:5000/](http://localhost:5000/)
to see it in action.

### Viewing Private Repos

The app is running in development mode. If you try to visit a private
repo, you'll see a raw error for debugging. When the app is running in
production, users see a nicer error page, offering the option to authenticate.

To see the the real error page, stop the app and restart in production:

    RACK_ENV=production foreman start

Or, if you'd rather stay in development mode, you can authenticate with
GitHub by visiting
[http://localhost:5000/auth/github](http://localhost:5000/auth/github)

## Deploying

The app should deploy to Heroku with no problems.

If you're not too familiar with the Heroku deploy process,
follow these steps (replacing YOUR_APP with your chosen app name):

* Install the [Heroku Toolbelt](https://toolbelt.herokuapp.com/)
* In your app's directory, create a Heroku app:  
  `heroku apps:create YOUR_APP`
* Register a GitHub app, using `http://YOUR_APP.herokuapp.com/`
  as Main URL and Callback URL.
* Add the Client ID and Secret to your Heroku config:  
  `heroku config:add GITHUB_KEY='YOUR_ID' GITHUB_SECRET='YOUR_SECRET'`
* You should also configure a session secret:  
  `heroku config:add SESSION_SECRET=abc123`
* Push the app to Heroku:  
  `git push heroku master`
* Check it's worked:  
  `heroku open`

## Copyright

(The MIT License)

Copyright (c) 2013 [With Associates](http://withassociates.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
