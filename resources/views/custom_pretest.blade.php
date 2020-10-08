<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
@extends('voyager::master')

@section('page_header')

    <h1 class="page-title">
       Buat Soal Pre Tes
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
                @input="getQuestionLists"
                v-model="pretest_id"
            item-value="id"
            item-text="name"
          :items="items"
          label="Pilih Paket Pre Tes"
        ></v-select>
                </v-col>
            </v-row>
           
            <v-expansion-panels multiple v-model="panels">
                <v-expansion-panel v-for="(question_list,i) in question_lists" :key="i">
                            <v-expansion-panel-header>Pertanyaan #@{{i+1}} @{{question_list.question_list_type.description}}</v-expansion-panel-header>
                            <v-expansion-panel-content>
                                <v-textarea v-model="question_list.value" label="Pertanyaan" placeholder="Tulis pertanyaan Anda di sini" outlined append-outer-icon="mdi-close" @click:append-outer="removeQuestionList(i)"></v-textarea>
                                <v-row>
                                    <v-col>
                                        Jawaban
                                    </v-col>
                                </v-row>
                                <div v-if="question_list.question_list_type.name=='selectoptions'">
                                    <div v-for="(answer_list, n) in question_list.answer_lists" :key="`answer${n}`">
                                        <v-text-field v-model="answer_list.value" v-if="n<2" class="ml-6" placeholder="Tulis pilihan jawaban" :label="`Jawaban #${n+1}`" outlined>
                                        <template v-slot:prepend>
                                        @{{String.fromCharCode(97+n)}}
                                        </template>
                                        </v-text-field>
                                        <v-text-field v-model="answer_list.value" v-else class="ml-6" placeholder="Tulis pilihan jawaban" :label="`Jawaban #${n+1}`" outlined append-outer-icon="mdi-close" @click:append-outer="removeAnswerList(i,n)">
                                        <template v-slot:prepend>
                                        @{{String.fromCharCode(97+n)}}
                                        </template>
                                        </v-text-field>
                                    </div>
                                </div>
                                <div v-else>
                                    <v-textarea outlined  placeholder="Tulis jawaban" v-model="question_list.answer_lists[0].value" ></v-textarea>
                                </div>
                                <div class="justify-end d-flex" v-if="question_list.question_list_type.name=='selectoptions'">
                                    <v-btn @click="addAnswerList(i)">Tambah Jawaban</v-btn>

                                </div>
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels>
                    <div v-if="pretest_id && !loading" class="justify-end d-flex mt-2">
                    <v-speed-dial
      v-model="fab"
      :transition="transition"
      direction="bottom"
      
    >
      <template v-slot:activator>
        <v-btn
          v-model="fab"
          color="blue darken-1"
          dark
          
        >
         Tambah Soal
        </v-btn>
      </template>
      <v-btn
        
        dark
        @click="addQuestionList('selectoptions')"
        color="green"
      >
        Pilihan Ganda
      </v-btn>
      <v-btn
        
        dark
        @click="addQuestionList('textfield')"
        color="indigo"
      >
      Uraian
      </v-btn>
    </v-speed-dial>
    <v-btn class="ml-3" color="primary" @click="submit">Submit</v-btn>
    </div>
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
        fab:false,
        transition: 'slide-y-transition',
        panels:[],
        test:'asu',
        items:[],
        loading:false,
        pretest_id:null,
        question_lists:[],
        types:[
            {name:'selectoptions',description:'Pilihan Ganda'},
            {name:'textfield',description:'Uraian'},
        ]
    },
    computed:{

    },
    methods:{
        submit(){
            //Swal.enableLoading();
            //return;
            Swal.fire({
                title: 'Konfirmasi',
                text: "Submit soal dan jawaban yang dibuat?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, submit',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return axios.post('/admin/pretestquestionlists', {pretest_id:this.pretest_id, question_lists:this.question_lists}).then(res=>{
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
                   this.loading=false;
                   this.panels=[]
                   Swal.fire({
                        title: `Sukses`,
                        text:'Soal pre tes berhasil disimpan'
                    })
                }
            })
        },
        getQuestionLists(){
            this.loading=true
            axios.get('/admin/getpretestquestionlists/'+this.pretest_id).then(res=>{
                console.log(res.data)
                this.question_lists = res.data.question_lists;
                this.loading=false
            })
        },
        addAnswerList(question_list_index) {
            //let current = this.questionnary.question_lists[question_list_index].answer_lists.length + 1
            this.question_lists[question_list_index].answer_lists.push({
                value: ''
            })
        },
        addQuestionList(type='selectoptions') {
            let option={
                    value: '',
                    question_list_type:{
                        name:'selectoptions',
                        description:'Pilihan Ganda'
                    },
                    answer_lists: [{
                            value: ''
                        },
                        {
                            value: ''
                        }
                    ]
                };
            if(type=='textfield'){
                option.question_list_type = {
                        name:'textfield',
                        description:'Uraian'
                }
            }
            this.question_lists.push(option);
            //console.log(this.panels)
            this.panels.push(this.question_lists.length - 1);
        },
        removeAnswerList(question_list_index, answer_list_index) {
            this.question_lists[question_list_index].answer_lists.splice(answer_list_index, 1);
        },
        removeQuestionList(question_list_index) {
            if (this.question_lists.length == 1) {
                Swal.fire({
                    title: 'Tidak bisa menghapus',
                    text: 'Pre tes harus memiliki minimal 1 soal',
                    icon: 'warning',
                })
            } else {
                Swal.fire({
                    title: 'Konfirmasi',
                    text: "Hapus pertanyaan ini dari list soal pre tes?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, hapus!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        this.question_lists.splice(question_list_index, 1);

                    }
                })
            }
        }
    },
    created(){
        this.pretest_id = parseInt('{{$pretest_id}}')

        if(this.pretest_id>=0){
            this.getQuestionLists();
        }

        axios.get('/admin/getpretests').then(res=>{
            this.items=res.data
        })
      
    }

})
</script>
@stop