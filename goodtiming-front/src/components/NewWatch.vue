<template>
    <div class="mt-5">
        <div class="mt-3">
            <h4>New Watch Name</h4>
            <input type="text" v-model="name" />
        </div>
        <div class="mt-3">
            <h4>Description</h4>
            <input type="text" v-model="description" />
        </div>

        <div class="mt-3">
            <input type="submit" value="Submit" @click="submit()"/>
        </div>
    </div>
    
</template>
<script>
import axios from "axios";

export default {

    data() {
        return {
            name: '',
            description: ''
        }
    },
    methods: {
        submit(e) {
            // e.preventDefault();
            let currentObj = this;
            this.axios.post("https://goodtiming.herokuapp.com/api/v1/stopwatches", {
                name: this.name,
                description: this.description
            })
            .then(function (response) {
                // currentObj.$parent.$forceUpdate();
                currentObj.$emit('update-dashboard', response.data.data.id)
            })
            .catch(function (error) {
                currentObj.output = error;
            });
        }
    }
}
</script>