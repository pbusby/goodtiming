<template>
  <div class="container">
    <h1>GOODTIMING APP</h1>
    <div class="d-flex flex-wrap mt-5">
      {{wholeResponse}}
      <div class="watch-item" v-for="(stopwatch, index) in wholeResponse" :key="index">
        <div class="">
          <h4 style="display: inline-block">{{stopwatch.name}}</h4>
          <h4 class="delete-icon pl-3" @click="deleteStopWatch(stopwatch.id)">X</h4>
        </div>
        <button class @click="showStopwatch(stopwatch.id)">View Stats</button>
      </div>
    </div>
    <NewWatch @update-dashboard="updateDashboard"/>
  </div>
</template>

<script>
import axios from "axios";
import NewWatch from "@/components/NewWatch.vue"

export default {
  name: "Dashboard",
  components: {
    NewWatch      
  },
  props: {
    placeHolder: String
  },
  methods: {
    showStopwatch(id) {
      this.$router.push(`/stopwatches/${id}`);
    },
    updateDashboard(e) {
      this.$emit('update-key', 1)
    },
    deleteStopWatch(id) {
      axios 
        .delete(`http://localhost:3000/api/v1/stopwatches/${id}`)
        .then(response => {
           self.wholeResponse = response.data.data;
           const watchIndex = this.wholeResponse.findIndex(w => w.id === id )
           this.wholeResponse.splice(watchIndex, 1)
      })
      .catch(error => {
        console.log(error);
      });
    }
  },
  data() {
    return {
      wholeResponse: []
    };
  },
  mounted() {
    var self = this;
    axios
      .get("http://localhost:3000/api/v1/stopwatches")
      .then(response => {
        self.wholeResponse = response.data.data;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>