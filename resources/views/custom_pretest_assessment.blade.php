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
                @input="getUserLists"
                v-model="pretest_id"
            item-value="id"
            item-text="name"
          :items="items"
          label="Pilih Paket Pre Tes"
        ></v-select>
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
        panels:[],
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
                    return axios.post('/admin/posttestquestionlists', {posttest_id:this.posttest_id, question_lists:this.question_lists}).then(res=>{
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
                        text:'Soal post tes berhasil disimpan'
                    })
                }
            })
        },
        getUserLists(){
            this.loading=true
            // axios.get('/admin/getpretestuserlists/'+this.pretest_id).then(res=>{
            //     console.log(res.data)
            //     this.question_lists = res.data.question_lists;
            //     this.loading=false
            // })
        },
       
    },
    created(){
        axios.get('/admin/getpretests').then(res=>{
            this.items=res.data
        })
    }

})
</script>
@stop