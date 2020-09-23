# Sinatra - Glitch

[Glitch](https://glitch.com/) is a wonderful service which makes it easy to
get sites and applications up and running quickly.  Know what else is wonderful?
Ruby!  This repo is intended to provide a cairn for getting a Ruby app (in this
case [Sinatra](http://sinatrarb.com/)), running on Glitch.

## `glitch.json`

The `glitch.json` file tells Glitch how to setup and launch your application.
The format is standard
[JSON](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON),
and only has a few keys that I am aware of.

```json
{
  // What to run before the first time this app is launched?
  "install": "bundle install",
  // How to launch the app itself. $PORT is set at runtime.  It is almost
  // always 3000, but better safe than sorry.
  "start": "bundle exec rackup config.ru -p $PORT -s thin -o 0.0.0.0",
  // Which files to watch for changes?
  "watch": {
    // When to re-run the install.
    "install": {
      "include": [
        "^glitch\\.json$",
        "^Gemfile.lock",
        "^\\.env$"
      ]
    },
    "restart": {
      "exclude": [
        "^vendor/bundle"
      ],
      "include": [
        ".rb$"
      ]
    },
    "throttle": 1000
  }
}
```

On the front-end,

- Edit `views/index.html` to change the content of the webpage
- `public/client.js` is the javacript that runs when you load the webpage
- `public/style.css` is the styles for `views/index.html`
- Drag in `assets`, like images or music, to add them to your project

On the back-end,

- your app starts at `server.js`
- add frameworks and packages in `package.json`
- safely store app secrets in `.env` (nobody can see this but you and people you invite)

Click `Show` in the header to see your app live. Updates to your code will instantly deploy.


## Made by [Glitch](https://glitch.com/)

**Glitch** is the friendly community where you'll build the app of your dreams. Glitch lets you instantly create, remix, edit, and host an app, bot or site, and you can invite collaborators or helpers to simultaneously edit code with you.

Find out more [about Glitch](https://glitch.com/about).

( ᵔ ᴥ ᵔ )