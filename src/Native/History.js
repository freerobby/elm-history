var _elm_community$elm_history$Native_History = function(){
  // setHash : String -> Task Never ()
  var setHash = function(hash){
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
      window.location.hash = hash;
      return callback(Task.succeed([]));
    });
  };

  // getHash : Task Never String
  var getHash = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
    return callback(Task.succeed(window.location.hash));
  });

  // setPath : String -> Task Never ()
  var setPath = function(urlpath){
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
      window.history.pushState({}, "", urlpath);
      return callback(Task.succeed([]));
    });
  };

   // getPath : Task Never String
  var getPath = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
      return callback(window.location.pathname);
  });

  // replacePath : String -> Task Never ()
  var replacePath = function(urlpath){
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
      window.history.replaceState({}, "", urlpath);
      return callback(Task.succeed([]));
    });
  };

  // go : Int -> Task Never ()
  var go = function(n){
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
      window.history.go(n);
      return callback(Task.succeed([]));
    });
  };

  // back : Task Never ()
  var back = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
    window.history.back();
    return callback(Task.succeed([]));
  });

  // forward : Task Never ()
  var forward = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
    window.history.forward();
    return callback(Task.succeed([]));
  });

  var getLength = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
    return callback(Task.succeed(window.history.length));
  });

  var getHref = _elm_lang$core$Native_Scheduler.nativeBinding(function(callback){
    return callback(Task.succeed(window.location.href));
  });


  return {
    path        : path,
    setHash     : setHash,
    getHash     : getHash,
    setPath     : setPath,
    getPath     : getPath,
    replacePath : replacePath,
    go          : go,
    back        : back,
    forward     : forward,
    getLength   : getLength,
    getHref     : getHref
  };

}();
