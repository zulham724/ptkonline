<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
@extends('voyager::master')

@section('page_header')

<h1 class="page-title">
    List PTK
</h1>

@stop

    @section('content')
    <div id="app">
        <v-app>
            <v-main>

                <!-- Provides the application the proper gutter -->
                <v-container fluid>
                    <v-row>
                        <v-col>
                            <v-autocomplete item-value="id" item-text="name" v-model="values" :items="users" outlined
                                dense chips small-chips label="Pilih User" multiple></v-autocomplete>

                        </v-col>
                        <v-col>
                            <v-btn @click="filter">Filter</v-btn>
                        </v-col>

                    </v-row>

                    <v-row>
                        <v-col sm="6">
                            <v-text-field :loading="loading" :disabled="loading" v-model="search" @input="inputSearch"
                                append-icon="mdi-magnify" label="Search" single-line hide-details></v-text-field>
                        </v-col>

                    </v-row>
                    <v-row>
                        <v-col lg="12">

                            <v-data-table :search.sync="search" :expanded.sync="expanded" show-expand :footer-props="{
            'items-per-page-options': [5, 10, 50, 100, 500, -1]
        }" :loading="loading" :server-items-length="totalData" :options.sync="options" :headers="headers"
                                :items="dataTableItems" class="elevation-1">
                                <template v-slot:item.plagiarism_score="{ item }">
                                    @{{ (item.plagiarism_score) }}%
                                </template>
                                <template v-slot:item.status="{ item }">
                                    @{{ (item.status==1?'Completed':'Draft') }}
                                </template>
                                <template v-slot:expanded-item="{ headers, item }">
                                    <td :colspan="headers.length">
                                        <v-row no-gutters dense v-for="(comment,i) in item.classroom_research_comments">
                                            <v-col sm=6>
                                                <v-textarea v-model="comment.value" name="input-7-1"
                                                    :label="`Komentar #${i+1}`" hint="Berikan komentar"></v-textarea>
                                            </v-col>
                                            <v-col sm=6 align-self="center">
                                                <v-btn @click="removeComment(item.id, i)" class="mx-2" fab dark small
                                                    color="red">
                                                    <v-icon dark>
                                                        mdi-close
                                                    </v-icon>
                                                </v-btn>

                                            </v-col>
                                        </v-row>
                                        <v-row>
                                            <v-col sm=12>
                                                <v-btn :disabled="loading" @click="addComment(item.id)" class="mx-2"
                                                    color="info">
                                                    Tambah Komentar
                                                </v-btn>
                                                <v-btn :loading="loading" @click="submitComments(item.id)"
                                                    v-if="item.classroom_research_comments && item.classroom_research_comments.length" color="primary">
                                                    Simpan komentar
                                                </v-btn>
                                            </v-col>


                                        </v-row>


                                    </td>
                                </template>
                                <template v-slot:item.action="{ item }">
                                <v-icon
                                    @click="print(item.id)">
                                    mdi-printer
                                </v-icon>
                                <v-icon
                                    @click="expandAndAddComment(item)">
                                    mdi-comment
                                </v-icon>
                                </template>
                            </v-data-table>
                        </v-col>


                    </v-row>

                </v-container>
            </v-main>
        </v-app>
    </div>
    @stop

        @section('javascript')
        <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"
            integrity="sha256-qXBd/EfAdjOA2FGrGAG+b3YBn2tn5A6bhz+LSgYD96k=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
        <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


        <script>
            new Vue({
                el: '#app',
                vuetify: new Vuetify(),
                data: {
                    search: '',
                    dataTableItems: [],
                    users: @json($users),
                    dialog: false,
                    expanded: [],
                    panels: [],
                    totalData: 0,
                    options: {},
                    loading: false,
                    values: [],
                    headers: [{
                            text: 'ID',
                            align: 'start',
                            sortable: true,
                            value: 'id',
                        },
                        {
                            text: 'Pembuat',
                            value: 'author_name'
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
                            value: 'educational_level_name'
                        },
                        {
                            text: 'Tingkat Plagiarism',
                            value: 'plagiarism_score'
                        },
                        {
                            text: 'Status',
                            value: 'status',
                            sortable: false,
                        },
                        {
                            text: 'Aksi',
                            value: 'action',
                            sortable: false,
                        },

                        // {
                        //     text: 'Action',
                        //     value: 'action'
                        // }
                    ],
                },
                computed: {
                    getTotalScore: function () {
                        let total = 0;
                        this.questions.forEach(v => {
                            total += v.answer.score;
                        });
                        return total ? (total / this.questions.length).toFixed(2) : 0;
                    },
                    hasTextFieldQuestionList: function () {
                        for (let question of this.questions) {
                            if (question.question_list.question_list_type.name == 'textfield') return true;
                        }
                        return false;
                    }
                },
                methods: {
                    print(id) {
                        window.open(`/classroom_research/${id}/download`, "_blank");
                        // this.$inertia.visit();
                    },
                    submitComments: function (item_id) {
                        const data = this.dataTableItems.find(e => e.id == item_id);
                        if (data) {
                            Swal.fire({
                                title: 'Konfirmasi simpan',
                                text: "Yakin simpan komentar ini?",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Ya, Simpan',
                                reverseButtons: true,
                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    console.log('submitComments', data);
                                    this.loading = true;
                                    axios.post('/admin/get_json/submitcomments/' + item_id, {
                                        comments: data.classroom_research_comments
                                    }).then(res => {
                                        // menampung id komentar sebelumnya
                                        const old_ids = data.classroom_research_comments
                                            .map(e => e.id);
                                        //filter komentar res.data yg tidak ada di old_ids
                                        const new_ids = res.data.classroom_research_comments
                                            .filter(e =>
                                                old_ids.indexOf(e.id) == -1);
                                        // filter komentar yg tidak mempunyai id dari list komentar sebelum disubmit (belum ada di db)
                                        const comments_without_id = data
                                            .classroom_research_comments.filter(
                                                e => !e.id);
                                        if (new_ids.length == comments_without_id.length) {
                                            comments_without_id.forEach((v, k) => {
                                                v.id = new_ids[k].id;
                                            });
                                        } else {
                                            alert('Gagal. hmm')
                                        }

                                        console.log(res.data);
                                    }).catch(err => {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: err.message,
                                        })
                                    }).finally(() => {
                                        this.loading = false;
                                    })
                                } else if (result.isDenied) {
                                    // Swal.fire('Changes are not saved', '', 'info')
                                }
                            })


                        }
                    },
                    addComment: function (item_id) {
                        const data = this.dataTableItems.find(e => e.id == item_id);
                        if (data) {
                            data.classroom_research_comments.push({
                                // id: -1,
                                value: '',
                            });
                        }
                    },
                    expandAndAddComment:function(item){
                        this.expanded.push(item);
                        this.addComment(item.id);

                    },
                    removeComment: function (item_id, index) {
                        const data = this.dataTableItems.find(e => e.id == item_id);
                        if (data) {
                            data.classroom_research_comments.splice(index, 1);
                        }
                    },
                    inputSearch: _.debounce(function (val) {
                        console.log('inputSearch', val);
                        this.getDataFromApi();
                        // console.log(this.search)
                    }, 500),
                    filter: function () {
                        this.getDataFromApi();
                    },
                    getCampaignQuestionList: function (campaign_id) {
                        this.loading = true;
                        this.questions = []
                        axios.get('/admin/posttest/getcampaignquestionlist/' + campaign_id).then(res => {
                            this.questions = res.data.questions;
                            this.campaign = res.data.campaign
                            this.loading = false;
                        });
                    },
                    getDataFromApi: function () {
                        return new Promise((resolve) => {
                            this.loading = true;
                            let page = this.options.page ? this.options.page : 1;
                            let itemsPerPage = this.options.itemsPerPage ? this.options
                                .itemsPerPage : 10;

                            axios.post(
                                `/admin/get_json/getclassroomresearches?page=${page}&itemsPerPage=${itemsPerPage}`, {
                                    user_ids: this.values,
                                    search: this.search
                                }).then(res => {
                                const {
                                    sortBy,
                                    sortDesc,
                                    // page,
                                    // itemsPerPage
                                } = this.options
                                console.log(this.options)
                                this.totalData = res.data.total;
                                this.dataTableItems = res.data.data; //anjay
                                // this.dataTableItems.forEach(v=>{
                                //     v.com
                                // })
                                if (sortBy.length === 1 && sortDesc.length === 1) {
                                    this.dataTableItems = this.dataTableItems.sort((a,
                                        b) => {
                                        const sortA = a[sortBy[0]]
                                        const sortB = b[sortBy[0]]

                                        if (sortDesc[0]) {
                                            if (sortA < sortB) return 1
                                            if (sortA > sortB) return -1
                                            return 0
                                        } else {
                                            if (sortA < sortB) return -1
                                            if (sortA > sortB) return 1
                                            return 0
                                        }
                                    })
                                }

                                // if (itemsPerPage > 0) {
                                //     this.items = this.items.slice((page - 1) * itemsPerPage, page * itemsPerPage)
                                // }
                            }).finally(() => {
                                this.loading = false;
                                resolve()
                            });

                        })

                    },
                    showQuestionList(item) {
                        this.getCampaignQuestionList(item.id);
                        this.dialog = true;
                    },
                    submit() {
                        //Swal.enableLoading();
                        //return;
                        Swal.fire({
                            title: 'Konfirmasi',
                            text: "Submit nilai?",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Ya, submit',
                            showLoaderOnConfirm: true,
                            preConfirm: (login) => {
                                return axios.post('/admin/posttest/campaign/' + this.campaign.id, {
                                    questions: this.questions
                                }).then(res => {
                                    console.log(res.data)
                                    this.loading = false;
                                    if (!res.data) {
                                        throw new Error(res.statusText)
                                    }
                                    return res.data
                                }).catch(error => {
                                    Swal.showValidationMessage(
                                        `Request failed: ${error}`
                                    )
                                })
                            },

                        }).then((result) => {

                            if (result.isConfirmed) {
                                // Swal.showLoading();
                                this.getDataFromApi();
                                this.dialog = false;
                                this.loading = false;
                                this.panels = []
                                Swal.fire({
                                    title: `Sukses`,
                                    text: 'Soal pre tes sukses dinilai'
                                })
                            }
                        })
                    },
                    getCampaignLists() {
                        this.loading = true
                        axios.get('/admin/getposttestcampaignlists/' + this.posttest_id).then(res => {
                            console.log(res.data)
                            this.questions = res.data;
                            this.loading = false
                        })
                    },

                },
                watch: {
                    expanded:function(val){
                        console.log(val)
                    },
                    options: {
                        handler(new1, old) {
                            //console.log(new1)
                            //console.log(old)
                            console.log('options', this.options)

                            //alert(this.pretest_id)
                            this.getDataFromApi();
                            // this.getDataFromApi()
                            //     .then(data => {
                            //         this.desserts = data.items
                            //         this.totalDesserts = data.total
                            //     })
                        },
                        deep: true,
                    },
                },
                created() {
                    console.log('users', this.users)

                    // axios.get('/admin/getposttests').then(res=>{
                    //     this.items=[{id:-1,name:'Semua'},...res.data]
                    // })

                    // this.options.itemsPerPage=10
                    // console.log(this.options)
                }

            })

        </script>
        @stop
