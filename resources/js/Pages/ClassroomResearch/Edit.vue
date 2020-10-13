<template>
<v-container>
    <v-form ref="form" v-model="valid" lazy-validation>
        <v-row>
            <v-col lg="12">
                <v-text-field :rules="[v => !!v || 'Judul Proposal harus diisi']" v-model="build.title" dense label="Judul Proposal PTK"></v-text-field>

            </v-col>
        </v-row>
        <!--<v-row>
        <v-col cols="6">
            <v-text-field v-model="build.name" dense label="Nama"></v-text-field>
        </v-col>
        <v-col cols="6">
            <v-text-field dense label="Email" type="email"></v-text-field>
        </v-col>
    </v-row>-->
        <v-row>
            <v-col lg="3">
                <v-text-field :rules="[v => !!v || 'Nama sekolah harus diisi']" v-model="build.school_name" dense label="Nama Sekolah"></v-text-field>
            </v-col>
            <v-col lg="8">
                <v-text-field v-model="build.school_address" dense label="Alamat Sekolah"></v-text-field>
            </v-col>
            <v-col lg="1">
                <v-text-field :rules="[v => !!v || 'Tahun harus diisi']" v-model="build.year" dense label="Tahun"></v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col lg="6">
                <v-select @input="getTemplate()" dense :items="educationalLevels" v-model="build.educational_level" item-value="id" item-text="name" label="Pilih Jenjang"></v-select>
            </v-col>
        </v-row>
        <div v-for="(format,n) in formats" :key="n">
            <v-row class="text-h6">{{format.name}}</v-row>
            <v-row>
                <v-col lg="12">
                    <vue-editor v-model="format.html" />

                </v-col>

            </v-row>
        </div>
        <div class="d-flex justify-end" v-if="build.educational_level">
            <v-btn class="mt-2" color="primary" @click="submit">Submit Proposal PTK</v-btn>

        </div>
    </v-form>
</v-container>
</template>

<script>
import {
    VueEditor
} from "vue2-editor";

import VuetifyLayout from './../../Layouts/VuetifyLayout'
import {
    mapState
} from "vuex";

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["items", "educationalLevels", "user"],
    computed: {
        ...mapState(['ClassroomResearch'])
    },
    created() {

        if (this.ClassroomResearch.data) {
            this.build = {
                ...this.ClassroomResearch.data
            }
        }
        const find = this.ClassroomResearch.contents.find(e => e.educational_level_id == this.build.educational_level);
        if (find) {
            this.formats = [...find.contents]
        }
    },
    data() {
        return {
            valid: true,
            dialog: false,
            build: {
                title: null,
                school_name: null,
                school_address: null,
                year: new Date().getFullYear(),
                educational_level: null
            },
            formats: [],
            educationalLevel: null,
            editorOptions: {
                hideModeSwitch: true
            },
        }
    },
    watch: {
        build: {
            handler: _.debounce(function (val, oldVal) {
                console.log(val)
                this.$store.commit("ClassroomResearch/setData", {
                    data: val
                })
            }, 500),
            deep: true
        },
        formats: {
            handler: _.debounce(function (val, oldVal) {
                console.log(val)
                this.$store.commit("ClassroomResearch/setContents", {
                    contents: val,
                    educational_level_id: this.build.educational_level
                })
            }, 500),
            deep: true
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
        submit() {
            if (!this.$refs.form.validate()) return;
            swal.fire({
                title: 'Konfirmasi',
                text: "Submit Proposal PTK yang dibuat?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, submit'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post('/classroom_researches', {
                        data: this.build,
                        contents: this.formats
                    }, {
                        replace: false,
                        preserveState: true,
                        preserveScroll: false,
                        only: [],
                        headers: {},
                    })
                }
            })

        },
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
            axios.get('/educational_level/' + this.build.educational_level + '/classroom_research_format').then(res => {
                const find = this.ClassroomResearch.contents.find(e => e.educational_level_id == res.data.id);
                console.log(this.ClassroomResearch.contents)
                if (find) {
                    //alert('ada')
                    this.formats = find.contents;
                } else {
                    //alert('gk ada')
                    this.formats = res.data.classroom_research_formats;
                }
            });
        }
    }
}
</script>
