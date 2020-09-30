<template>
<v-container>
    <v-row>
        <v-col cols="12">
            <v-text-field dense label="Judul Proposal PTK"></v-text-field>

        </v-col>
    </v-row>
    <v-row>
        <v-col cols="6">
            <v-text-field dense label="Nama"></v-text-field>
        </v-col>
        <v-col cols="6">
            <v-text-field dense label="Email" type="email"></v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col cols="3">
            <v-text-field dense label="Nama Sekolah"></v-text-field>
        </v-col>
        <v-col cols="8">
            <v-text-field dense label="Alamat Sekolah"></v-text-field>
        </v-col>
        <v-col cols="1">
            <v-text-field dense label="Tahun"></v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col cols="6">
            <v-select @input="getTemplate()" dense :items="educationalLevels" v-model="educationalLevel" item-value="id" item-text="name" label="Pilih Jenjang"></v-select>
        </v-col>
    </v-row>
    <div v-for="(format,n) in formats" :key="n">
        <v-row class="text-h6">{{format.name}}</v-row>
        <v-row>
            <v-col cols="12">
                <froala :tag="'textarea'" :config="config" v-model="model"></froala>
            </v-col>

        </v-row>
    </div>
    <div class="d-flex justify-end" v-if="educationalLevel">
        <v-btn class="mt-2" color="primary" @click="goToUrl('classroom_researches/create')">Buat Proposal PTK</v-btn>
    </div>

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

    props: ["items", "educationalLevels"],

    data() {
        return {
            formats: [],
            educationalLevel: null,
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
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/posttest/' + this.model)
        },
        getTemplate() {
            axios.get('/educational_level/' + this.educationalLevel + '/classroom_research_format').then(res => {
                this.formats = res.data
            });
        }
    }
}
</script>
