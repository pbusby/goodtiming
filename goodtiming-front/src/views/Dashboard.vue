<template>
  <div class="container">
    <h1>GOOD TIMES APP</h1>
    <GridPlaceholder v-if="apiLoading || tOut"></GridPlaceholder>
    <div v-if="!apiLoading && !tOut" class="row">
      <div class="w-100 d-flex flex-wrap mt-5">
        <div class="watch-item col-6 col-md-4" v-for="(stopwatch, index) in wholeResponse" :key="index">
          <div class="">
            <h4 style="display: inline-block">{{stopwatch.name}}</h4>
            <h4 class="delete-icon pl-3" @click="deleteStopWatch(stopwatch.id)">X</h4>
          </div>
          <button class @click="showStopwatch(stopwatch.id)">View Stats</button>
        </div>
      </div>
    </div>
    <NewWatch @update-dashboard="updateDashboard"/>
  </div>
</template>

<script>
import axios from "axios";
import GridPlaceholder from "@/components/GridPlaceholder.vue"
import NewWatch from "@/components/NewWatch.vue"

export default {
  name: "Dashboard",
  components: {
    GridPlaceholder,
    NewWatch      
  },
  props: {
    placeHolder: String
  },
  computed: {
    
  },
  methods: {
    showStopwatch(id) {
      this.$router.push(`/stopwatches/${id}`);
    },
    updateDashboard(e) {
      this.$emit('update-key', 1)
    },
    timeout(){
      setTimeout(() => this.tOut = false, 1000)
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
      wholeResponse: [],
      apiLoading: true,
      tOut: true
    };
  },
  mounted() {
    var self = this;
    this.timeout()
    axios
      .get("http://localhost:3000/api/v1/stopwatches")
      .then(response => {
        self.wholeResponse = response.data.data;
        this.apiLoading = false;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>