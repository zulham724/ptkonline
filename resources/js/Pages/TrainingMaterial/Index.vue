<template>
<v-container fluid>
    <v-row>
        <v-col v-for="(item, n) in items" :key="n" lg="3">
            <v-card click="">
                <v-card-title>{{item.name}}</v-card-title>
                <v-card-subtitle>{{item.created_at | moment("dddd, DD MMMM YYYY")}}</v-card-subtitle>
                <v-card-text>
                    {{item.description}}
                </v-card-text>
                <v-card-actions>
                    <v-btn color="primary" text @click="goToUrl('/training_materials/'+item.id)">
                        Buka Materi
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-col>

    </v-row>
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

    props: ["user", "items"],

    data() {
        return {
            model: null,
            // loading: false,
            // drawer: null,
            // item: 0
        }
    },
    components: {
        VuetifyLayout,
        //Welcome,
    },
    created() {
        this.$store.commit('User/set', {
            data: this.user
        })
    },
    methods: {
        goToUrl(url) {
            this.$inertia.visit(url, {
                method: 'get',
                data: {},
                replace: false,
                preserveState: false,
                preserveScroll: false,
                only: [],
                headers: {},
            })
        },
        open() {

        },
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/pretests/' + this.model)
        }
    }
}
</script>
