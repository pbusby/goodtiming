<script>
import {APIService} from '../../../backend/axios/APIservice'

const API_URL = 'http://localhost:3000';

export default {
    name: 'ListStopwatches', 
    components: {

    },

    data() {
        return {
            watches: [],
            nuumberOfWatches: 0,
        };
    },

    methods: {
        getStopwatches(){
            apiService.getStopwatches().then((data) => {
                this.watches = data.data;
                this.numberOfWatches= data.count;
            });
        }
    }
}
</script>