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
    <v-subheader>
        Pertanyaan
    </v-subheader>
    <v-list three-line>
        <v-list-group v-for="(item, index) in items.data" :key="index" no-action>
            <template v-slot:activator>
                <!--<v-subheader v-if="item.header" :key="item.header" v-text="item.header"></v-subheader>

            <v-divider v-else-if="item.divider" :key="index" :inset="item.inset"></v-divider>-->

                <v-list-item :key="item.title">
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
                        <v-icon @click.stop="remove(item.id)" v-if="User.data.id==item.user.id" size="medium">
                            mdi-delete
                        </v-icon>
                    </v-list-item-action>
                </v-list-item>
                <v-divider />
            </template>
            <v-subheader inset>
                Komentar
            </v-subheader>
            <v-list-item v-for="comment in item.comments" :key="`comment${comment.id}`">

                <v-list-item-avatar>
                    <v-img :src="comment.user.avatar"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title v-html="comment.user.name"></v-list-item-title>
                    <v-list-item-subtitle v-text="comment.value"></v-list-item-subtitle>
                </v-list-item-content>

                <v-list-item-action>
                    <v-list-item-action-text>{{comment.created_at | moment("from", "now")}}</v-list-item-action-text>
                    <v-icon @click.stop="removeComment(item.id, comment.id)" v-if="User.data.id==comment.user.id" size="medium">
                        mdi-delete
                    </v-icon>
                </v-list-item-action>

            </v-list-item>
            <v-list-item>
                <v-text-field :disabled="loading" label="Tulis komentar" v-model="item.comment" clearable dense outlined append-outer-icon="mdi-send" @click:append-outer="sendComment(index)"></v-text-field>
            </v-list-item>
            <v-divider />
        </v-list-group>
    </v-list>

    <div class="text-center">
        <v-pagination v-on:input="input" v-model="currentPage" :length="pagination_length" circle></v-pagination>
    </div>

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

    props: ["user", "items", "pagination_length", "page"],
    computed: {
        ...mapState(['User'])
    },

    data() {
        return {
            valid: true,
            valid2: true,
            body: '',
            title: '',
            comment: '',
            //page: 1,
            currentPage: this.page,
            loading: false,

        }
    },
    components: {
        VuetifyLayout,
        //Welcome,
    },
    created() {
        this.page = this.items.current_page;
        this.$store.commit('User/set', {
            data: this.user
        })
        console.log(this.User)
    },
    methods: {
        remove(post_id) {
            swal.fire({
                title: 'Konfirmasi Hapus',
                icon: 'warning',
                text: "Yakin hapus pertanyaan ini?",
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return this.$inertia.delete(`/posts/${post_id}?page=${this.currentPage}`)
                        .then(response => {
                            console.log('cok>' + response)
                            return response;
                        })
                        .catch(error => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`
                            )
                        })
                },
                allowOutsideClick: () => !swal.isLoading()
            }).then((result) => {
                if (result.isConfirmed) {
                    swal.fire('Pertanyaan dihapus')
                }
            })
        },
        removeComment(post_id, comment_id) {
            swal.fire({
                title: 'Konfirmasi Hapus',
                icon: 'warning',
                text: "Yakin hapus komentar ini?",
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return this.$inertia.delete(`/posts/${post_id}/comments/${comment_id}?page=${this.currentPage}`)
                        .then(response => {
                            console.log('cok>' + response)
                            return response;
                        })
                        .catch(error => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`
                            )
                        })
                },
                allowOutsideClick: () => !swal.isLoading()
            }).then((result) => {
                if (result.isConfirmed) {
                    swal.fire('Komentar dihapus')
                }
            })
        },
        input(page) {
            console.log(this.page)
            this.goToUrl('/posts?page=' + this.currentPage)
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
