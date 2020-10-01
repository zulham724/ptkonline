<template>
<v-container fluid>
    <v-row class="mt-n5">
        <v-col lg="5">
            <v-form ref="form" v-model="valid" lazy-validation>
                <v-text-field :rules="[ v => !!v || 'Harus diisi']" dense outlined label="Judul Pertanyaan" v-model="title"></v-text-field>
                <v-textarea class="mt-n1" v-model="body" :rules="[ v => !!v || 'Harus diisi']" outlined label="Tulis Deskripsi Pertanyaan"></v-textarea>
                <div class="d-flex justify-end mt-n5">
                    <v-btn color="primary" @click="submit">Kirim Pertanyaan</v-btn>
                </div>
            </v-form>
        </v-col>
    </v-row>
    <v-divider />
    <v-list three-line>
        <template v-for="(item, index) in items">
            <!--<v-subheader v-if="item.header" :key="item.header" v-text="item.header"></v-subheader>

            <v-divider v-else-if="item.divider" :key="index" :inset="item.inset"></v-divider>-->

            <v-list-item :key="item.title" link>
                <v-list-item-avatar>
                    <v-img :src="item.user.avatar"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title v-html="item.user.name"></v-list-item-title>
                    <v-list-item-subtitle class="text--primary" v-html="item.title"></v-list-item-subtitle>
                    <v-list-item-subtitle v-text="item.body"></v-list-item-subtitle>
                    <v-list-item-subtitle class="mt-1 text-caption" v-text="item.comments_count+' Komentar'"></v-list-item-subtitle>
                </v-list-item-content>

                <v-list-item-action>
                    <v-list-item-action-text>{{item.created_at | moment("from", "now")}}</v-list-item-action-text>

                </v-list-item-action>

            </v-list-item>
            <v-divider v-if="index < items.length - 1" :key="index"></v-divider>
        </template>
    </v-list>
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
            valid: true,
            body: '',
            title: '',
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
