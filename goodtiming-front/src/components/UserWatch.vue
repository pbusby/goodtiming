<template>
  <div>
    <h1>{{singleWatch.name}}</h1>
    <h2 ref="timer">00 : 00 . 000</h2>
    <p class="mt-3">MOTIVATION...</p>
    <p>{{singleWatch.description}}<p>
    <p>ELAPSED TO DATE...</p>
    <h5>{{cumulativeTime}}</h5>
    <p>ELAPSED CURRENTLY...</p>
    <h5 class="mb-3">{{elapsedTime}}</h5>


    <button class v-if="!jsWatch.isOn" @click="watchHandler()">Start</button>
    <!-- <button class @click="getStartTime">Start</button> -->
    <button class v-if="jsWatch.isOn" @click="watchHandler()">Stop</button>
        <!-- <button class @click="endAndElapsed">Stop</button> -->
    <button class @click="reset()">Clear</button>
    <button class @click="updateTotalTime">Save Progress</button>

    <!-- <p>{{startTime}}</p>
    <p>{{endTime}}</p> -->
  </div>
</template>
<script>
import axios from "axios";
import JsWatch from "../watchanime.js"
export default {
  props: ["id"],
  data() {
    return {
      singleWatch: "",
      jsWatch: {},
      startTime: 0,
      endTime: 0,
      elapsedTime: 0,
      cumeTime: 0,
      years: 0,
      days: 0,
      minutes: 0,
      isOn: false,
      apiLoading: true,
    };
  },
  computed: {
    computedWatch: function(){
      return this.singleWatch
    },
    computedjsWatch: function(){
      return this.jsWatch(this.$refs.timer)
    },
    // y(secs){
    //    if(secs % 31536000 !== secs){
    //       this.years = 0
    //       return secs
    //    } else {
    //      return secs * (secs % 31536000)
    //    }
    // },
    // m(secs){
    //   if(secs % d !== secs){
    //     this.months = 0
    //     return secs
    //   }else {
    //     return secs * (secs % )
    //   }
    // },
    // d(secs){
    //   if(secs % d !== secs){
    //     this.days = 0
    //     return secs
    //   }
    // },
    
    cumulativeTime: function(){
      return this.cumeTime = this.cumeTime + Math.round(this.elapsedTime)
      // d(m(y(this.cumeTime)))
      // return `Days: ${Math.round(day)} Minutes: ${Math.round(minutes)} Seconds: ${Math.round(seconds)}`
    }
  },
  methods: {
    getStartTime() {
      this.startTime = new Date();
    },
    getEndTime() {
      this.endTime = new Date();
    },
    getElapsedTime() {
      // const startTime = new Date();
      // const endTime = new Date();
      this.elapsedTime = Math.abs(this.startTime - this.endTime) / 1000;
    },
    endAndElapsed() {
      this.getEndTime()
      this.getElapsedTime()
    },
    watchHandler(){
      if (this.jsWatch.isOn) {
        this.jsWatch.stop();
        this.endAndElapsed();
      } else {
        this.jsWatch.start();
        this.getStartTime();
      }
    },
    apiUpdate(){
      this.apiLoading = false;
      this.$emit('event_child', false)
    },
    reset(){
      this.startTime = 0;
      this.endTime = 0;
      this.elapsedTime = 0;
      this.jsWatch.reset();
      this.$refs.timer.innerText = "00 : 00 . 000"
    },
    updateTotalTime(e) {
        e.preventDefault();
        let currentObj = this;
        let updatedTime = this.cumeTime
        this.axios.patch(`https://goodtiming.herokuapp.com/api/v1/stopwatches/${this.singleWatch.id}`, {
            total_time: updatedTime
        })
        .then(function (response) {
            currentObj.output = response.data;
        })
        .catch(function (error) {
            currentObj.output = error;
        });
    }
  },
  mounted() {
    this.jsWatch = new JsWatch(this.$refs.timer)
    var self = this;
    axios
      .get(`https://goodtiming.herokuapp.com/api/v1/stopwatches/${self.id}`)
      .then(response => {
        self.singleWatch = response.data.data;
        self.cumeTime = self.singleWatch.total_time
        self.apiUpdate()

      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>