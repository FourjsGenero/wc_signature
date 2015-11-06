var wrapper = document.getElementById("signature-pad"),
    canvas = wrapper.querySelector("canvas"),
    signaturePad;

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas() {
    // When zoomed out to less than 100%, for some very strange reason,
    // some browsers report devicePixelRatio as less than 1
    // and only part of the canvas is cleared then.
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
}

window.onresize = resizeCanvas;
resizeCanvas();
 
signaturePad = new SignaturePad(canvas, {
    // example settings TODO, how can we define in 4gl????, or perhaps in .per  as properties
    penColor: "rgb(66, 133, 244)",
    backgroundColor: "rgb(255,255,0)"
});

// added these functions to be called from 4gl front-call
signaturePadClear = function() {
    signaturePad.clear();
}

signaturePadSave = function() {
    return signaturePad.toDataURL();
}

signaturePadEmpty = function() {
    return signaturePad.isEmpty();
}
