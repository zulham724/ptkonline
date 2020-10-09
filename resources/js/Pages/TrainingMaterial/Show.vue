<template>
<v-container fluid>
    <div class="text-h4">{{data.name}}</div>
    <div class="text-h6">{{data.description}}</div>
    <div class="text-caption mb-5">Dibuat tanggal: {{data.created_at | moment("dddd, DD MMMM YYYY")}}</div>

    <v-card elevation="1" v-for="(content, n) in data.training_material_contents" :key="n" class="mb-1">
        <v-card-title>{{content.name}}</v-card-title>
        <v-card-text v-html="content.value" class="black--text">

        </v-card-text>
    </v-card>
</v-container>
</template>

<script>
import VuetifyLayout from './../../Layouts/VuetifyLayout'
import {
    mapState
} from "vuex";

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["user", "data"],
    computed: {
        ...mapState(["Pretest"])
    },
    data() {
        return {
            radioGroup: 1,
            model: null,
            // loading: false,
            // drawer: null,
            // item: 0
        }
    },
    created() {

        this.$store.commit('User/set', {
            data: this.user
        })
    },
    components: {
        VuetifyLayout,
        //Welcome,
    },
    methods: {
        beginTest() {
            this.$store.dispatch("Pretest/test");
        }
    }
}
</script>
