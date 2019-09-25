<template>
  <div>
    <h1>{{singleWatch.name}}</h1>
    <p>My id is: {{singleWatch.id}}</p>
    <p>My description is: {{singleWatch.description}}</p>
  </div>
</template>
<script>
import axios from "axios";
export default {
  props: ["id"],
  data() {
    return {
      singleWatch: ""
    };
  },
  mounted() {
    var self = this;
    axios
      .get(`http://localhost:3000/api/v1/stopwatches/${self.id}`)
      .then(response => {
        self.singleWatch = response.data.data;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>