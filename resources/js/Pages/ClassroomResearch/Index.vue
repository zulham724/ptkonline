<template>
<v-container fluid>
    <v-row class="justify-center">
        <v-col>
            <v-data-table :headers="headers" :items="items" class="elevation-1"></v-data-table>
            <div class="d-flex justify-end">
                <v-btn class="mt-2" color="primary" @click="goToUrl('classroom_researches/create')">Buat Proposal PTK</v-btn>
            </div>
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
            dialog: false,
            headers: [{
                    text: 'Judul',
                    value: 'title'
                },
                {
                    text: 'Tahun',
                    value: 'year'
                },
                {
                    text: 'Jenjang',
                    value: 'educational_level.name'
                },
                {
                    text: 'Nama Sekolah',
                    value: 'school_name'
                },
                {
                    text: 'Aksi',
                    value: 'action'
                }
            ],
            // items: [

            // ]
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
        test() {

        },
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/posttest/' + this.model)
        }
    }
}
</script>
