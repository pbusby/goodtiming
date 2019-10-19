<template>
    <div class="mt-5">
        <div class="mt-3">
            <h4>Stopwatch Name</h4>
            <input type="text" v-model="name" />
        </div>
        <div class="mt-3">
            <h4>Description</h4>
            <input type="text" v-model="description" />
        </div>

        <div class="mt-3">
            <h4>Submit</h4>
            <input type="submit" value="Submit" @click="submit"/>
        </div>
    </div>
    
</template>
<script>
import axios from "axios";

export default {

    data() {
        return {
            name: 'Testy Mctesterson',
            description: 'A silly test stopwatch'
        }
    },
    methods: {
        submit(e) {
            // e.preventDefault();
            let currentObj = this;
            this.axios.post("http://localhost:3000/api/v1/stopwatches", {
                name: this.name,
                description: this.description
            })
            .then(function (response) {
                currentObj.output = response.data;
            })
            .catch(function (error) {
                currentObj.output = error;
            });
        }
    }
}
</script>