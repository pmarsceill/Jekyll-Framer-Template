Framerjs Jekyll Demo Shell
==========================

## Prerequisites

To use this project you must have a working version of Ruby and Node installed. For more information on installing these on your machine checkout:

* [Ruby Version Manager](https://rvm.io/)
* [Node.js](http://nodejs.org/)

## Usage

### Setup local dev environment

After cloning / downloading:

* run `$ bundle install` to install Gem dependancies.
* run `$ npm install` to install Node Package dependancies.
* run `$ grunt` to begin default grunt task

The default `grunt` task will do the following:

1. Import compile the `app.coffee` file into `app.js`
2. Render the contents of `app.coffee` into the index.html file and hightlight the syntax
3. Compile the site into static html, css, and js into the `_site` directory
4. Watch for changes to `*.coffee`, `*.html`, `*.css` files and re-run steps 1-3 if changes are detected

If you wish to spin up a local webserver run the `$ grunt serve` command and a local webserver will start on `localhost:4000` with this project as it's root. This task will not watch for changes, but simply serve what has already been compiled. If you wish to setup your own custom webserver for editing purposes, it is recommended that you run `$ grunt` and then point your webserver (like MAMP or Anvil) to the `_site` directory.

### Import your project

Copy the `app.coffee`, `images/`, and `imported/` files from your `*.framer` project into the root of this project (overwriting any default files) and run `$ grunt` or `$ grunt serve`.

### Deploy demo site

The contents of the generated `_site` directory should be able to be put on any webserver for viewing.
