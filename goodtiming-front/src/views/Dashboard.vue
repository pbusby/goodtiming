<template>
  <div>
    <h1>Welcome to the dashboard!</h1>
    <div class v-for="(stopwatch, index) in wholeResponse" :key="index">
      <h4>{{stopwatch.name}}</h4>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Dashboard",
  props: {
    msg: String
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