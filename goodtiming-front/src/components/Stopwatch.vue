<template>
  <div>
    <h1>{{singleWatch.name}}</h1>
    <h2 ref="timer">00 : 00 . 000</h2>
    <p>My id is: {{singleWatch.id}}</p>
    <p>My description is: {{singleWatch.description}}</p>
    <p>My cumulative time is: {{cumulativeTime}}</p>
        <p>My elapsed time is: {{elapsedTime}}</p>

    <button class @click="watchHandler()">Start</button>
    <!-- <button class @click="getStartTime">Start</button> -->
    <button class @click="watchHandler()">Stop</button>
        <!-- <button class @click="endAndElapsed">Stop</button> -->

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
    };
  },
  computed: {
    computedWatch: function(){
      return this.singleWatch
    },
    computedjsWatch: function(){
      return this.jsWatch(this.$refs.timer)
    },
    cumulativeTime: function(){
      return this.cumeTime = this.cumeTime + Math.round(this.elapsedTime)
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
    updateTotalTime(e) {
        e.preventDefault();
        let currentObj = this;
        let updatedTime = this.cumeTime
        debugger
        this.axios.patch(`http://localhost:3000/api/v1/stopwatches/${this.singleWatch.id}`, {
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
    debugger
    this.jsWatch = new JsWatch(this.$refs.timer)
    var self = this;
    axios
      .get(`http://localhost:3000/api/v1/stopwatches/${self.id}`)
      .then(response => {
        self.singleWatch = response.data.data;
        self.cumeTime = self.singleWatch.total_time
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>