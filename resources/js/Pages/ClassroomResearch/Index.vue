<template>
<v-container fluid>
    <v-row class="justify-center">
        <v-col>
            <v-data-table :headers="headers" :items="items" class="elevation-1">
                <template v-slot:item.plagiarism_score="{item}">
                    <v-chip @click="showPlagiarism(item)">{{item.plagiarism_score}}</v-chip>
                </template>
                <template v-slot:item.action="{ item }">
                    <v-icon small class="mr-2">
                        mdi-pencil
                    </v-icon>
                    <v-icon small>
                        mdi-delete
                    </v-icon>
                </template>
            </v-data-table>
            <div class="d-flex justify-end">
                <v-btn class="mt-2" color="primary" @click="goToUrl('classroom_researches/create')">Buat Proposal PTK</v-btn>
            </div>
        </v-col>

        <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
            <v-card>
                <v-toolbar dark color="primary">
                    <v-btn icon dark @click="dialog = false">
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    <v-toolbar-title>Tingkat Plagiarism Konten</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-toolbar-items>
                        <v-btn dark text @click="dialog = false">
                            Tutup
                        </v-btn>
                    </v-toolbar-items>
                </v-toolbar>
                <v-card-text>
                    <v-data-table hide-default-footer :loading="loading" class="mt-3" :items="items2" :headers="headers2">
                        <template v-slot:item.plagiarism_score="{item}">
                            <v-chip>{{item.plagiarism_score+'%'}}</v-chip>
                        </template>
                        <template v-slot:item.value="{item}">
                            <div v-html="item.value"></div>
                        </template>
                        <template slot="body.append">
                            <tr>
                                <td colspan="2" class="text-h6 text-center">Rata-rata</td>
                                <td>
                                    <v-chip color="primary">{{plagiarismAverage}}
                                    </v-chip>
                                </td>
                            </tr>
                        </template>
                    </v-data-table>
                </v-card-text>

            </v-card>
        </v-dialog>

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
    computed: {
        plagiarismAverage() {
            let total = 0;
            this.items2.forEach(v => {
                total += v.plagiarism_score;
            })
            return this.items2.length ? (total / this.items2.length).toFixed(2) + '%' : '-';

        },
    },
    data() {
        return {
            dialog: false,
            loading: false,
            headers2: [{
                    text: 'Bab',
                    value: 'name'
                },
                {
                    text: 'Konten',
                    value: 'value'
                },
                {
                    text: 'Tingkat Plagiarism',
                    value: 'plagiarism_score'
                },

            ],
            items2: [

            ],
            headers: [{
                    text: 'ID',
                    value: 'id'
                },
                {
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
                    text: 'Tingkat plagiarism',
                    value: 'plagiarism_score'
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

        showPlagiarism(item) {
            this.dialog = this.loading = true;
            this.items2 = []
            axios.get('classroom_research_plagiarism/' + item.id).then(res => {
                this.items2 = res.data.classroom_research_contents
                console.log(res.data)
                this.loading = false;
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
        test() {

        },
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/posttest/' + this.model)
        }
    }
}
</script>
