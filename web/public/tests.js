//This test file assumes running within Node.js using test framework Whiskey

var b = require('./EventBus.js');

var bus = new b.EventBus();
exports['test_eventbus'] = function(test,assert){
    var value = 0;
    bus.add(function(n,v){
            if(n=="myevent"){
                value=v;
            }
        });
    bus.fire("dumbevent",100);
    assert.equal(value,0);
    bus.fire("myevent",10);
    assert.equal(value,10);
    test.finish();
}
        
