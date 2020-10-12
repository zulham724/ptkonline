<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
@extends('voyager::master')

@section('page_header')

    <h1 class="page-title">
       Koreksi Soal Pre Tes
    </h1>

@stop

@section('content')
<div id="app">
    <v-app>
    <v-main>

        <!-- Provides the application the proper gutter -->
        <v-container fluid>
        <v-row>
                <v-col lg="6">
                <v-select
                :disabled="loading"
                @input="getDataFromApi"
                v-model="pretest_id"
            item-value="id"
            item-text="name"
          :items="items"
          label="Pilih Paket Pre Tes"
        ></v-select>
                </v-col>
            </v-row>

        <v-row>
            <v-col lg="12">
            <v-data-table @click:row="showQuestionList" :expanded.sync="expanded" show-expand  :footer-props="{
            'items-per-page-options': [5, 10, 50, 100, 500, -1]
        }" :loading="loading" :server-items-length="totalData" :options.sync="options" :headers="headers" :items="dataTableItems" class="elevation-1">
        <template v-slot:item.email_verified_at="{item}">
    @{{new Date(item.email_verified_at).toLocaleString('id-ID', { timeZone: 'UTC' })}}
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

        <v-dialog
          v-model="dialog"
        hide-overlay
        width="90%"
        transition="dialog-bottom-transition"
        >
    <v-card>
        <v-toolbar
          dark
          color="primary"
        >
          <v-btn
            icon
            dark
            @click="dialog = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>Koreksi soal </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>
            <v-btn
              dark
              text
              @click="dialog = false"
            >
              Close
            </v-btn>
          </v-toolbar-items>
        </v-toolbar>
        <v-card-title>
        Nilai: @{{getTotalScore}}
     
        </v-card-title>
     
        <v-card class="mx-auto mb-1" outlined v-for="(question, i) in questions" :key="i">
            <v-card-text>
                @{{i+1}}. <span class="black--text" style="white-space: pre-wrap;" v-html="question.question_list.value"></span>

                <v-radio-group v-model="question.answer.answer_list_id" class="mb-n5" v-if="question.question_list.question_list_type.name=='selectoptions'">
                    <v-radio v-for="(answer_list, j) in question.question_list.answer_lists" :color="answer_list.score?'green':'red'"  :key=`${i}-${j}` :value="answer_list.id">
                        <template v-slot:label>
                            <strong v-if="answer_list.score" class="green--text">@{{answer_list.value}} <v-icon color='green'>mdi-check</v-icon></strong>
                            <strong v-else-if="answer_list.id==question.answer.answer_list_id" class="red--text">@{{answer_list.value}}</strong>
                            <span v-else class="black--text">@{{answer_list.value}}</span>
                        </template>
                    </v-radio>
                </v-radio-group>
                <v-row v-else class="mb-n3">
                    <v-col lg="6">
                        <v-textarea disabled :value="question.answer.value" height="100px" outlined dense label="Jawaban User" class="black--text">
                        </v-textarea>
                        <v-textarea disabled :value="question.question_list.answer_lists[0].value" height="100px" outlined dense label="Kunci Jawaban" class="black--text">
                        </v-textarea>
                        <v-slider label="Nilai" thumb-label="always" class="mt-3 mb-n10" v-model="question.answer.score"></v-slider>
                    </v-col>
                </v-row>

            </v-card-text>
        </v-card>

        <v-card-actions class="d-flex justify-end">
      <!--<v-btn v-if="hasTextFieldQuestionList"
            color="primary"
            @click="submit"
      >
        Submit Nilai
      </v-btn>
      <div v-else>
      <strong>Penilaian sudah dilakukan secara otomatis</strong>
      </div>-->
      <v-btn
            color="primary"
            @click="submit"
      >
        Submit Nilai
      </v-btn>
      
    </v-card-actions>

      </v-card>
    </v-dialog>
    
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
        dialog:false,
        expanded: [],
        panels:[],
        totalData: 0,
        options: {},
        loading:false,
        pretest_id:-1,
        questions:[],
        campaign:{},
        types:[
            {name:'selectoptions',description:'Pilihan Ganda'},
            {name:'textfield',description:'Uraian'},
        ],
        items: [],
        dataTableItems:[],
        headers: [{
                    text: 'Nama',
                    align: 'start',
                    sortable: false,
                    value: 'user.name',
                },
                {
                    text: 'Email',
                    value: 'user.email'
                },
                {
                    text: 'Jenjang yang diajar',
                    value: 'user.profile.educational_level.name'
                },
                {
                    text: 'Paket soal',
                    value: 'campaign.name'
                },
                {
                    text: 'Nilai',
                    value: 'value'
                },
              
                // {
                //     text: 'Action',
                //     value: 'action'
                // }
            ],
    },
    computed:{
        getTotalScore:function(){
            let total=0;
            this.questions.forEach(v=>{
                total+=v.answer.score;
            });
            return total?(total/this.questions.length).toFixed(2):0;
        },
        hasTextFieldQuestionList:function(){
            for(let question of this.questions){
                if(question.question_list.question_list_type.name=='textfield')return true;
            }
            return false;
        }
    },
    methods:{
        getCampaignQuestionList:function(campaign_id){
            this.loading=true;
            this.questions=[]
            axios.get('/admin/pretest/getcampaignquestionlist/'+campaign_id).then(res=>{
                this.questions = res.data.questions;
                this.campaign = res.data.campaign
                this.loading=false;
            });
        },
        getDataFromApi: function () {
            return new Promise((resolve) => {
                this.loading = true;
                let page=this.options.page?this.options.page:1;
                let itemsPerPage=this.options.itemsPerPage?this.options.itemsPerPage:10;

                axios.post(`/admin/pretest/${this.pretest_id}/getcampaignlistpagination?page=${page}&itemsPerPage=${itemsPerPage}`, this.filter_options).then(res => {
                    const {
                        sortBy,
                        sortDesc,
                        // page,
                        // itemsPerPage
                    } = this.options
                    console.log(this.options)
                    this.totalData = res.data.totalData;
                    this.dataTableItems = res.data.data.data; //anjay

                    if (sortBy.length === 1 && sortDesc.length === 1) {
                        this.dataTableItems = this.dataTableItems.sort((a, b) => {
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
        showQuestionList(item){
            this.getCampaignQuestionList(item.id);
            this.dialog=true;
        },
        submit(){
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
                    return axios.post('/admin/pretest/campaign/'+this.campaign.id, {questions:this.questions}).then(res=>{
                       console.log(res.data)
                       this.loading=false;
                       if (!res.data) {
                        throw new Error(res.statusText)
                        }
                        return res.data
                   }).catch(error=>{
                    Swal.showValidationMessage(
                        `Request failed: ${error}`
                        )
                   })
                },
              
            }).then((result) => {
               
                if (result.isConfirmed) {
                   // Swal.showLoading();
                   this.getDataFromApi();
                   this.dialog=false;
                   this.loading=false;
                   this.panels=[]
                   Swal.fire({
                        title: `Sukses`,
                        text:'Soal pre tes sukses dinilai'
                    })
                }
            })
        },
        getCampaignLists(){
            this.loading=true
            axios.get('/admin/getpretestcampaignlists/'+this.pretest_id).then(res=>{
                console.log(res.data)
                this.questions = res.data;
                this.loading=false
            })
        },
       
    },
    watch: {
        options: {
            handler(new1,old) {
                //console.log(new1)
                //console.log(old)
                console.log(this.options)
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
    created(){
        axios.get('/admin/getpretests').then(res=>{
            this.items=[{id:-1,name:'Semua'},...res.data]
        })

        // this.options.itemsPerPage=10
        // console.log(this.options)
    }

})
</script>
@stop