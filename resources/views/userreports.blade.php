
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">@extends('voyager::master')

@section('page_header')

    <h1 class="page-title">
       User Reports
    </h1>

@stop


@section('content')
<div id="app">
    <v-app>
        <v-main>
        <v-container fluid>
        <v-row>
        <v-col lg="12">
        <v-data-table :expanded.sync="expanded" show-expand  :footer-props="{
        'items-per-page-options': [5, 10, 50, 100, 500, -1]
    }" :loading="loading" :server-items-length="totalData" :options.sync="options" :headers="headers" :items="items" class="elevation-1">
    <template v-slot:item.email_verified_at="{item}">
   @{{new Date(item.email_verified_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
    </template>
    <template v-slot:expanded-item="{ headers, item }">
      <td :colspan="headers.length">
        <v-row>
            <v-col lg="6">
                <v-data-table :headers="pretest_headers"  hide-default-footer :items="item.pretest_campaigns">
                    <template v-slot:item.created_at="{item}">
                        @{{new Date(item.created_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
                    </template>
                    <template v-slot:item.value="{item}">
                        <v-chip v-if="item.value===null">
                        Belum dinilai
                            
                        </v-chip>
                        <v-chip color='info' v-else>
                        @{{parseFloat(item.value).toString()}}
                        </v-chip>
                    </template>
                </v-data-table>
            </v-col>
            <v-col lg="6">
                <v-data-table :headers="posttest_headers"  hide-default-footer :items="item.posttest_campaigns">
                    <template v-slot:item.created_at="{item}">
                        @{{new Date(item.created_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
                    </template>
                    <template v-slot:item.value="{item}">
                        <v-chip v-if="item.value===null">
                        Belum dinilai
                            
                        </v-chip>
                        <v-chip color='info' v-else>
                        @{{parseFloat(item.value).toString()}}
                        </v-chip>
                    </template>
                </v-data-table>
            </v-col>
        </v-row>
        <v-row>
            <v-col lg='12'>
                <v-data-table :headers="classroom_research_headers"  hide-default-footer :items="item.classroom_researches">
                    <template v-slot:item.created_at="{item}">
                        @{{new Date(item.created_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
                    </template>
                    <template v-slot:item.value="{item}">
                        <v-chip v-if="item.value===null">
                        Belum dinilai
                            
                        </v-chip>
                        <v-chip color='info' v-else>
                        @{{parseFloat(item.value).toString()}}
                        </v-chip>
                    </template>
                    <template v-slot:item.plagiarism_score="{item}">
                    <v-chip>
                        @{{item.plagiarism_score}}
                    </v-chip>
                    </template>
                </v-data-table>
            </v-col>
        </v-row>
      </td>
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
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script>
new Vue({ 
    el: '#app',
    vuetify: new Vuetify(),
    data:{
        expanded: [],
        educational_level_options: [],
            role_options: [],
            province_options: [],
            filter_options: {
                age_range: [0, 100],
                gender: '-',
                educational_level: '-',
            },
            select: null,
            dialog: false,
            totalData: 0,
            options: {},
            loading: false,
            items: [],
            pretest_headers:[
                {
                    text:'Paket pre tes',
                    value:'campaign.name'
                },
                
                {
                    text:'Nilai',
                    value:'value'
                },
                {
                    text:'Waktu submit',
                    value:'created_at'
                },

            ],
            posttest_headers:[
                {
                    text:'Paket post tes',
                    value:'campaign.name'
                },
                
                {
                    text:'Nilai',
                    value:'value'
                },
                {
                    text:'Waktu submit',
                    value:'created_at'
                },

            ],
            classroom_research_headers:[
                {
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

            ],
            headers: [{
                    text: 'Nama',
                    align: 'start',
                    sortable: false,
                    value: 'name',
                },
                {
                    text: 'Email',
                    value: 'email'
                },
                {
                    text: 'Jenjang yang diajar',
                    value: 'profile.educational_level.name'
                },
                {
                    text: 'Pre tes dikerjakan',
                    value: 'pretest_campaigns_count'
                },
                {
                    text: 'Post tes dikerjakan',
                    value: 'posttest_campaigns_count'
                },
                {
                    text: 'Jumlah PTK',
                    value: 'classroom_researches_count'
                },
                {
                    text: 'Waktu aktivasi',
                    value: 'email_verified_at'
                },
                
                // {
                //     text: 'Action',
                //     value: 'action'
                // }
            ],
    },
    computed:{

    },
    methods:{
        filterData: function () {
            this.getDataFromApi().then(() => {
                this.dialog = false;
            });
        },
        getDataFromApi: function () {
            return new Promise((resolve) => {
                this.loading = true;
                let page=this.options.page?this.options.page:1;
                let itemsPerPage=this.options.itemsPerPage?this.options.itemsPerPage:10;

                axios.post(`/admin/getuserslistpagination?page=${page}&itemsPerPage=${itemsPerPage}`, this.filter_options).then(res => {
                    const {
                        sortBy,
                        sortDesc,
                        // page,
                        // itemsPerPage
                    } = this.options
                    console.log(this.options)
                    this.totalData = res.data.totalUser;
                    this.items = res.data.data.data; //anjay

                    if (sortBy.length === 1 && sortDesc.length === 1) {
                        this.items = this.items.sort((a, b) => {
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

    },
    watch: {
        options: {
            handler(new1,old) {
                //console.log(new1)
                //console.log(old)
                console.log(this.options)
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
    created(){
        //this.getDataFromApi();
        this.options.itemsPerPage=10
        console.log(this.options)

    }

})
</script>
@stop