#LiveScript gulp file
require! {
  'gulp'
  'gulp-clean'
  'gulp-less'
  'less-plugin-clean-css'
  'path'
}

clean-css = new less-plugin-clean-css { advanced: true }

gulp.task 'something' ->
  console.log 'TODO: Add a useful task'

gulp.task 'default' ['clean', 'styles']

gulp.task 'clean' ->
  gulp.src 'out', {read: false}
    .pipe gulp-clean!

gulp.task 'styles' ->
  gulp.src './css/*.less'
    .pipe gulp-less do
      plugins: [clean-css]
      paths: [ path.join __dirname, 'css', 'includes' ]
    .pipe gulp.dest './out/css'
