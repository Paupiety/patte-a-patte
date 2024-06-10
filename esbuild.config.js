const esbuild = require("esbuild");
const path = require("path");
const tailwindcss = require("tailwindcss");
const autoprefixer = require("autoprefixer");

const outdir = 'public/assets';
// Configuration principale pour le point d'entrée JavaScript principal
esbuild
  .build({
    entryPoints: ["app/javascript/application.js"],
    outfile: `${outdir}/application.js`,
    bundle: true,
    minify: process.env.RAILS_ENV === "production",
    loader: { ".js": "jsx" },
    define: { "process.env.NODE_ENV": '"production"' },
  })
  .catch(() => process.exit(1));

// Configuration pour les fichiers JavaScript personnalisés
esbuild
  .build({
    entryPoints: ["app/javascript/custom/**/*.js"],
    outdir: outdir,
    bundle: true,
    minify: process.env.RAILS_ENV === "production",
    loader: { ".js": "js" },
    define: { "process.env.NODE_ENV": '"production"' },
  })
  .catch(() => process.exit(1));

// Configuration pour compiler les fichiers CSS
esbuild
  .build({
    entryPoints: ["app/stylesheets/application.css"],
    outfile: `${outdir}/application.css`,
    bundle: true,
    minify: process.env.RAILS_ENV === "production",
    loader: { ".css": "css" },
  })
  .catch(() => process.exit(1));
