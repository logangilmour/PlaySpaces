module.exports = {
    EventBus: EventBus
}

function EventBus(){
    this.listeners = new Array;
}

EventBus.prototype.add = function(callback){
    if(typeof callback != "function"){
        callback = new Function(callback);
    }
    this.listeners[this.listeners.length]=callback;
}

EventBus.prototype.fire = function(name,value){
    for(var i=0; i<this.listeners.length; i++){
        this.listeners[i](name,value);
    }
}
