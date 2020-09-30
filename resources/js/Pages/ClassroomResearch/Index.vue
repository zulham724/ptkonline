<template>
<v-container fluid>
    <v-row class="justify-center">
        <v-col md="7">
            <v-card class="mt-n3">
                <v-list subheader>
                    <v-subheader>Proposal PTK yang telah dibuat</v-subheader>

                    <v-list-item>
                        <v-list-item-content>
                            <v-list-item-title>Penggunaan Metode Pembelajaran Cooperative Integrated Reading Dan Composition Untuk Meningkatkan Kemampuan Siswa Dalam Membaca Dan Menulis Pada Mata Pelajaran Bahasa Indonesia</v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-icon>
                            <v-icon @click="test()">
                                mdi-menu
                            </v-icon>
                        </v-list-item-icon>
                    </v-list-item>
                </v-list>
            </v-card>
            <div class="d-flex justify-end">
                <v-btn class="mt-2" color="primary" @click="goToUrl('classroom_researches/create')">Buat Proposal PTK</v-btn>
            </div>
        </v-col>

    </v-row>

</v-container>
</template>

<script>
import VueFroala from 'vue-froala-wysiwyg';
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
            config: {
                events: {
                    'froalaEditor.initialized': function () {
                        console.log('initialized')
                    }
                }
            },
            model: 'Edit Your Content Here!'
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
