# ----- Overview ----- #
The naming conventions in CSS should help humans to identify what they are used for.  This helps maintain a separation between logic and styling and makes it easier to maintain in the future.  Regular CSS selectors without prefixes are still allowed but prefixes marked by a double hyphen "--" indicate a shortform.  

You can combine multiple selectors, prefixed or not, on the same element but keep the business logic for each selector contained in either the CSS or the JS, not both.

Examples: 
* "a--" stands for "animation".  Example: .a--fade-in-on-load in index.html and js/templates/index.js
* "f--" stands for "font".  Example: .f--agenda-medium in sass/base/fonts.scss
* "i--" stands for "icon". Example: .i--icon-logo in sass/base/icons.scss
* "l--" stands for "logic". Example .l--image-carousel in index.html and js/app.js