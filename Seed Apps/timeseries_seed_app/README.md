# seed-app

## App setup

Change directory into this seed app, then install dependencies.
```bash
> git clone https://github.com/PredixDev/minds-machines-sf.git
> cd minds-machines-sf/Seed\ Apps/timeseries_seed_app
> yarn install && bower install
```

To customize the application name do a global search and
replace of `seed__app` and `your__app__title`.

`seed__app` is the name used in `package.json`, `bower.json` and
other internal files.

`your__app__title` is the name used in user-facing files like `public/_index.html`.

## Running the app locally
The default gulp task will start a local web server.  Just run this command:
```
gulp
```
Browse to http://localhost:5000.
The app is already configured data to retrieve data from MMSanFrancisco time series instances.
Later you can connect your app to your personal instances of these services.

## Running in Predix Cloud
With a few commands you can build a distribution version of the app, and deploy it to the cloud.

### Create a distribution version
Use gulp to create a distribution version of your app, which contains vulcanized files for more efficient serving.
You will need to run this command every time before you deploy to the Cloud.
```
gulp dist
```
