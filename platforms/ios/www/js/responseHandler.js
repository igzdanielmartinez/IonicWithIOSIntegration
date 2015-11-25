window.responseHandler = function(request, callback) {
    cordova.exec(callback, function(err) {
        callback('Error :(');
    }, "HandleResponsePlugin", "handle", [request]);
};