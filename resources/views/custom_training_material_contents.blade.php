<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">

  <!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.4/quill.core.css" rel="stylesheet">
<link href="https://cdn.quilljs.com/1.3.4/quill.snow.css" rel="stylesheet">
<link href="https://cdn.quilljs.com/1.3.4/quill.bubble.css" rel="stylesheet">

@extends('voyager::master')

@section('page_header')

    <h1 class="page-title">
       Buat Konten Materi Pelatihan
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
                @input="getContents"
                v-model="training_material_id"
            item-value="id"
            :item-text="item=>item.name+'. '+item.description"
          :items="items"
          label="Pilih Materi Pelatihan"
        ></v-select>
                </v-col>
            </v-row>
           
            <v-expansion-panels multiple v-model="panels">
                <v-expansion-panel  v-for="(content,i) in contents" :key="i">
                            <v-expansion-panel-header>#@{{i+1}} @{{content.name}}</v-expansion-panel-header>
                            <v-expansion-panel-content style="height:50vh">
                                <v-text-field v-model="content.name" label="Judul konten" placeholder="Tulis judul konten Anda di sini" outlined append-outer-icon="mdi-close" @click:append-outer="removeContent(i)"></v-text-field>
                                <!-- <v-textarea v-model="content.value" label="Isi konten" placeholder="Tulis isi konten Anda di sini" outlined ></v-textarea> -->
                                <quill-editor    :options="editorOption" ref="quillEditorA" v-model="content.value"></quill-editor>
                               
                                <!-- <div v-if="question_list.question_list_type.name=='selectoptions'">
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

                                </div> -->
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels>
                    <div v-if="training_material_id && !loading" class="justify-end d-flex mt-2">
                    <v-btn
          v-model="fab"
          color="blue darken-1"
          dark
          @click="addClassroomMaterialContent"
        >
         Tambah Konten
        </v-btn>
    <v-btn class="ml-3" color="primary" @click="submit" @click="su">Submit</v-btn>
    </div>
        </v-container>
        </v-main>
    </v-app>
</div>
@stop


@section('javascript')
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.4/quill.js"></script>
<!-- Quill JS Vue -->
<script src="https://cdn.jsdelivr.net/npm/vue-quill-editor@3.0.4/dist/vue-quill-editor.js"></script>

<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!--<script type="module" src="https://unpkg.com/vue2-editor/dist/vue2-editor.umd.min.js"></script>-->


<script>
Vue.use(VueQuillEditor)
new Vue({ 
    el: '#app',
    vuetify: new Vuetify(),

    data:{
        editorOption: {
        theme: 'snow'
      },
        fab:false,
        transition: 'slide-y-transition',
        panels:[],
        test:'asu',
        items:[],
        loading:false,
        training_material_id:null,
        contents:[],
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
                text: "Submit materi pelatihan?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, submit',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return axios.post('/admin/trainingmaterialcontents', {training_material_id:this.training_material_id, contents:this.contents}).then(res=>{
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
                        text:'Materi pelatihan berhasil disimpan'
                    })
                }
            })
        },
        getContents(){
            this.loading=true
            axios.get('/admin/gettrainingmaterialcontents/'+this.training_material_id).then(res=>{
                console.log(res.data)
                this.contents = res.data.training_material_contents;
                this.loading=false
            })
        },

        addClassroomMaterialContent() {
            let option={
                    value: '',
                    name:''
                };
            this.contents.push(option);
            //console.log(this.panels)
            this.panels.push(this.contents.length - 1);
        },
        removeContent(content_index) {
            if (this.contents.length == 1) {
                Swal.fire({
                    title: 'Tidak bisa menghapus',
                    text: 'Materi harus memiliki minimal 1 konten',
                    icon: 'warning',
                })
            } else {
                Swal.fire({
                    title: 'Konfirmasi',
                    text: "Hapus konten ini?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, hapus!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        this.contents.splice(content_index, 1);

                    }
                })
            }
        }
    },
    created(){
        this.training_material_id = parseInt('{{$training_material_id}}')
       //alert(this.training_material_id?'a':'c');
        if(this.training_material_id>=0){
            this.getContents();
        }
        axios.get('/admin/gettrainingmaterials').then(res=>{
            this.items=res.data
        })
      
    }

})
</script>
@stop

@section('css')
<style type="text/css">
 .ql-editor strong{
     font-weight:bold;
 }
</style>

@stop