<template>
  <div class="container">
      <dashboard @update-key="updateKey" :key="key"/>
  </div>
    
</template>

<script>
import Dashboard from "@/views/Dashboard.vue"

export default {
    name: "Canvas",
    components: {
    Dashboard     
  },
  data() {
    return {
      key: null,
    }
  }, 
  methods: {
    updateKey() {
      this.key += 1
    }
  }
}
</script>