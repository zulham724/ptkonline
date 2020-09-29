<template>
<v-container fluid>
    <v-row align="center">
        <v-col class="d-flex" cols="12" sm="6">
            <v-select v-model="model" :items="items" :item-text="item=>item.name+' ('+item.question_lists_count+' Soal)'" item-value="id" label="Pilih Paket Soal Post Tes"></v-select>
        </v-col>
        <v-col>
            <v-btn @click="beginTest()" v-show="model!=null" color="primary">Kerjakan Soal</v-btn>
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

    props: ["items"],

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
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/posttest/' + this.model)
        }
    }
}
</script>
