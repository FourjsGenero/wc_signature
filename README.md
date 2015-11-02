# wc_signature
A Genero Web Component for the input and display of signatures

Thanks to Francecs Vilaubi for the WebComponent which I've tweaked, renamed, and added the 4gl wrapper.

Quick instructions before something more formal.

Test program should download and run without changes.  Tested with GDC, waiting for fix to a GAS issue before test other devices.

To use in your apps, place the html/js files into your webcomponents directory

Add wc_signature.42m so it is picked up by FGLLDPATH

In your form, define a WEBCOMPONENT widget with COMPONENTTYPE="wc_signature"

In your .4gl, add IMPORT FGL wc_signature

Use the following 4gl in your code

CALL wc_signature.clear(fieldname) - to clear the web component

CALL wc_signature.isEmpty(fieldname) RETURNS BOOLEAN - returns TRUE if there is a signature in the webcomponent

CALL wc_signature.save(fieldname, filename) RETURNS BOOLEAN - returns TRUE if signature saved as a png image file to filename specified



