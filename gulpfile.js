var
	CSSDIR = '/project',
	gulp = require('gulp'),
	minifyCSS = require('gulp-minify-css'),
	rename = require('gulp-rename');

gulp.task('styles', function() {
    return gulp.src([CSSDIR + '/**/*.css', '!' + CSSDIR + '/**/*.min.css'])
		.pipe(rename({ suffix: '.min' }))
        .pipe(minifyCSS())
		.pipe(gulp.dest(function(file) {
			return file.base;
		}))
});

gulp.task('clean', function() {
	return gulp.src([CSSDIR + '/**/*.min.css'], {read: false})
		.pipe(clean());
});

gulp.task('default', gulp.series('clean', 'styles'));
