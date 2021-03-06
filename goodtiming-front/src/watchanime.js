function JsWatch (elem) {
    var time = 0;
    var interval;
    var offset;

    function update() {
        time += elapsedTime();
        var formattedTime = timeFormatter(time);
        console.log(formattedTime)
        elem.textContent = formattedTime
    }
    function elapsedTime() {
        var now = Date.now();
        var timePassed = now - offset;
        offset = now;
        return timePassed;
    }
    function timeFormatter(timeinMilliseconds) {
        var time = new Date(timeinMilliseconds)
        var minutes = time.getMinutes().toString()
        var seconds = time.getSeconds().toString()
        var milliseconds = time.getMilliseconds().toString()

        if (minutes.length < 2) {
            minutes = '0' + minutes
        }

        if (seconds.length < 2) {
            seconds = '0' + seconds
        }

        while (milliseconds.length < 3) {
            milliseconds = '0' + milliseconds
        }

        return minutes + ' ' + ':' + ' ' + seconds + ' ' + '.' + ' ' + milliseconds
    }
    
    this.isOn = false
    this.start = function() {
        if(!this.isOn) {
            interval = setInterval(update, 10)
            offset = Date.now()
            this.isOn = true
        }
    };
    this.stop = function() {
        if(this.isOn) {
            clearInterval(interval);
            interval = null
            this.isOn = false
        }
    }
    this.reset = function(){
        time = 0;
    }
}

export default JsWatch
