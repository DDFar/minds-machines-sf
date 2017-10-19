## Getting Started

### Get the source code
Make a directory for your project. Clone or download and extract this project in that directory.

```
bash
> git clone https://github.com/PredixDev/minds-machines-sf.git
> cd minds-machines-sf/Seed\ Apps/timeseries_seed_app
> npm install && bower install
```

### Install tools
If you don't have them already, you'll need node, bower and gulp to be installed globally on your machine.  

1. Install [node](https://nodejs.org/en/download/).  This includes npm - the node package manager.  
2. Install [bower](https://bower.io/) globally `npm install bower -g`  
3. Install [gulp](http://gulpjs.com/) globally `npm install gulp -g`  

## App setup

After navigating to the seed-app directory (timeseries_seed_app), install the dependencies.

```bash
> npm install
> bower install
```

To customize the application name do a global search and
replace of `your__app__title`.

`your__app__title` is the name used in user-facing files like `public/_index.html`.

## Running the app locally
The default gulp task will start a local web server.  Just run this command:
```
gulp
```
Browse to http://localhost:5000.
The app is already configured data to retrieve data from MMSanFrancisco time series instances.
Later you can connect your app to your personal instances of these services.
