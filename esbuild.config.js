const esbuild = require('esbuild')
const path = require('path')
const tailwindcss = require('tailwindcss')
const autoprefixer = require('autoprefixer')

esbuild.build({
  entryPoints: ['application.js'],
  bundle: true,
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  plugins: [
    {
      name: 'css',
      setup(build) {
        build.onLoad({ filter: /\.css$/ }, async (args) => {
          const fs = require('fs').promises
          const contents = await fs.readFile(args.path, 'utf8')
          const postcss = require('postcss')
          const result = await postcss([tailwindcss, autoprefixer])
            .process(contents, { from: args.path, to: 'app/assets/builds/application.css' })
          return { contents: result.css, loader: 'css' }
        })
      },
    },
  ],
}).catch(() => process.exit(1))