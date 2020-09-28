<template>
<vuetify-layout>
    <div class="font-weight-medium">{{title}}</div>
</vuetify-layout>
</template>

<script>
import VuetifyLayout from './../Layouts/VuetifyLayout'

export default {
    props: ["title"],
    data() {
        return {
            // loading: false,
            // drawer: null,
            // item: 0
        }
    },
    components: {
        VuetifyLayout,
        //Welcome,
    }
}
</script>
