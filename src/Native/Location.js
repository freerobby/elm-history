var _elm_community$elm_history$Native_Location = function(){

    return {
        location: _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            var loc = window.location;

            // We can't return the location object itself, because
            // it would be "live" ... we make a snapshot.
            var location = {
                href: loc.href,
                protocol: loc.protocol,
                host: loc.host,
                hostname: loc.hostname,
                // Deal with Elm reserved word
                port$: loc.port,
                pathname: loc.pathname,
                search: loc.search,
                hash: loc.hash,
                origin: loc.origin
            };

            // Polyfill for IE
            if (!location.origin) {
                location.origin =
                    location.protocol + "//" +
                    location.hostname +
                    (location.port ? ':' + location.port: '');
            }

            callback(_elm_lang$core$Native_Scheduler.succeed(location));
        }),

        reload: function (forceServer) {
            return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
                try {
                    window.location.reload(forceServer);

                    // Now, I suppose this won't really accomplish
                    // anything, but let's do it anyway.
                    callback(
                        _elm_lang$core$Native_Scheduler.succeed([])
                    );
                } catch (ex) {
                    callback(
                        _elm_lang$core$Native_Scheduler.fail(ex.toString())
                    );
                }
            });
        },

        assign: function (url) {
            return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
                try {
                    window.location.assign(url);

                    callback(
                        _elm_lang$core$Native_Scheduler.succeed([])
                    );
                } catch (ex) {
                    callback(
                        _elm_lang$core$Native_Scheduler.fail(ex.toString())
                    );
                }
            });
        },

        replace: function (url) {
            return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
                try {
                    window.location.replace(url);

                    callback(
                        _elm_lang$core$Native_Scheduler.succeed([])
                    );
                } catch (ex) {
                    callback(
                        _elm_lang$core$Native_Scheduler.fail(ex.toString())
                    );
                }
            });
        }
    };
}();
