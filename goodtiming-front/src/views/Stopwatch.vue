<template>
  <div>
    <UserWatch :id="this.id" v-show="!apiLoading && !tOut" v-on:event_child="apiUpdate" />
    <StopwatchPlaceholder v-show="apiLoading || tOut" />
  </div>
</template>
<script>
import UserWatch from '@/components/UserWatch.vue'
import StopwatchPlaceholder from '@/components/StopwatchPlaceholder.vue'


export default {
  name: "Stopwatch",
  components: {
      UserWatch,
      StopwatchPlaceholder
  },
  props: ["id"],

  data() {
    return {
        apiLoading: true,
        tOut: true
    };
  },
  computed: {
    
  },
  methods: {
    apiUpdate: function(){
    this.apiLoading = false;
    },
    timeout(){
      setTimeout(() => this.tOut = false, 1000)
    },
  },
  mounted() {
    this.timeout()

  }
};
</script>