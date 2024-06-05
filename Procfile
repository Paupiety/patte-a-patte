#lancer le serveur rails
web: rails server

#precompiler les assets
assets: bundle exec rake assets:precompile

#compiler les fichiers js
js: esbuild --watch --sourcemap --bundle --outdir=../app/assets/builds ./app/javascript/application.js

#compiler les fichiers css
css: esbuild --watch --bundle --minify --sourcemap --outfile=public/assets/stylesheets/application.css ./app/assets/stylesheets/application.css