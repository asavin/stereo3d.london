#LiveScript gulp file
require! {
  'gulp'
  'gulp-jade'
  'gulp-less'
  'less-plugin-clean-css'
  'path'
  'del'
}

clean-css = new less-plugin-clean-css { advanced: true }

gulp.task 'default' ['styles', 'layouts', 'copy-assets']

gulp.task 'clean' ->
  del [ 'out/**' ]

gulp.task 'styles' ->
  gulp.src './css/main.less'
    .pipe gulp-less do
      plugins: [clean-css]
      paths: [ path.join __dirname, 'css', 'includes' ]
    .pipe gulp.dest './out/css'

gulp.task 'layouts' ->
  gulp.src './layouts/index.jade'
    .pipe gulp-jade do
      locals: {}
    .pipe gulp.dest './out'

gulp.task 'copy-assets' ->
  gulp.src './assets/*.svg'
    .pipe gulp.dest './out/images'
  gulp.src './assets/fonts/*'
    .pipe gulp.dest './out/fonts'
