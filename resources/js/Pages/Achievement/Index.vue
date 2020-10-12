<template>
<v-container fluid>
    <v-row>
        <v-col lg="6">
            <v-subheader>Paket Soal Pre Tes yang Dikerjakan</v-subheader>
            <v-card outlined>

                <v-data-table :headers="pretest_headers" :items="items.pretest_campaigns">

                    <template v-slot:item.created_at="{item}">
                        {{new Date(item.created_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
                    </template>
                    <template v-slot:item.value="{item}">
                        <v-chip v-if="item.value===null">
                            Belum dinilai
                        </v-chip>
                        <v-chip color='info' v-else>
                            {{parseFloat(item.value).toString()}}
                        </v-chip>
                    </template>
                </v-data-table>
            </v-card>
        </v-col>
        <v-col lg="6">
            <v-subheader>Paket Soal Post Tes yang Dikerjakan</v-subheader>

            <v-card outlined>
                <v-data-table :headers="posttest_headers" :items="items.posttest_campaigns">
                    <template v-slot:item.created_at="{item}">
                        {{new Date(item.created_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
                    </template>
                    <template v-slot:item.value="{item}">
                        <v-chip v-if="item.value===null">
                            Belum dinilai
                        </v-chip>
                        <v-chip color='info' v-else>
                            {{parseFloat(item.value).toString()}}
                        </v-chip>
                    </template>
                </v-data-table>
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
    created() {
        this.page = this.items.current_page;
    },
    data() {
        return {
            valid: true,
            loading: false,
            pretest_headers: [{
                    text: 'Paket pre tes',
                    value: 'campaign.name'
                },

                {
                    text: 'Nilai',
                    value: 'value'
                },
                {
                    text: 'Waktu submit',
                    value: 'created_at'
                },
            ],
            posttest_headers: [{
                    text: 'Paket post tes',
                    value: 'campaign.name'
                },

                {
                    text: 'Nilai',
                    value: 'value'
                },
                {
                    text: 'Waktu submit',
                    value: 'created_at'
                },

            ],

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
        input(page) {
            this.goToUrl('/posts?page=' + this.page)
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
        sendComment(index) {

            //alert(this.items[index].comment)
            this.loading = true;
            const data = this.items.data[index]
            axios.post('/posts/' + this.items.data[index].id + '/comments', data).then(res => {
                console.log(res.data)
                this.items.data[index].comments = res.data
                this.items.data[index].comments_count = res.data.length
                this.items.data[index].comment = null;
                this.loading = false;
            })
        },
        submit() {
            if (!this.$refs.form.validate()) return;
            this.$inertia.post('/posts', {
                body: this.body,
                title: this.title
            }, {
                replace: false,
                preserveState: true,
                preserveScroll: false,
                only: [],
                headers: {},
            }).then(() => {
                this.title = this.body = '';
                this.$refs.form.reset()
            })
        },
        beginTest() {
            //console.log(this.model)
            this.goToUrl('/posttest/' + this.model)
        }
    }
}
</script>
