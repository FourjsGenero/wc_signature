# wc_signature
**A Genero Web Component for the input and display of signatures.**

![Signature](https://user-images.githubusercontent.com/13615993/32203487-61a1a454-be48-11e7-9383-671ad50242ba.png)

_Thanks to Francecs Vilaubi for the WebComponent which I've tweaked, renamed, and added the 4gl wrapper._

### Instructions
- All dependencies for the test program are contained within this repo.
- To run the test program, open `webcomponents/wc_signature/wc_signature.html` in a web browser.

### Using wc_signature in Your Apps
#### Setup
- Place the html/js files into your `webcomponents` directory

- Add `wc_signature.42m` so it is picked up by `FGLLDPATH`

- In your form, define a `WEBCOMPONENT` widget with `COMPONENTTYPE="wc_signature"`

- In your `.4gl`, add `IMPORT FGL wc_signature`

#### 4gl to Use in Your Code
- `CALL wc_signature.clear(fieldname)` - to clear the web component

- `CALL wc_signature.isEmpty(fieldname) RETURNS BOOLEAN` - returns `TRUE` if there is a signature in the webcomponent

- `CALL wc_signature.save(fieldname, filename) RETURNS BOOLEAN` - returns `TRUE` if signature saved as a png image file to filename specified
