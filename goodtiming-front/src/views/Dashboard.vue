<template>
  <div>
    <h1>Welcome to the dashboard!</h1>
    <div class v-for="(stopwatch, index) in wholeResponse" :key="index">
      <h4>{{stopwatch.name}}</h4>
      <button class @click="showStopwatch(stopwatch.id)">View Stats</button>
    </div>
    <NewWatch />
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