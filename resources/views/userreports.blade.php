@extends('voyager::master')

@section('page_header')

    <h1 class="page-title">
       User Reports
    </h1>

@stop


@section('content')

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
        educational_level_options: [],
            role_options: [],
            province_options: [],
            filter_options: {
                age_range: [0, 100],
                gender: '-',
                is_pns: '-',
                certified: '-',
                school_status: '-',
                educational_level: '-',
                role: '-',
                province: [-1]
            },
            select: null,
            dialog: false,
            totalData: 0,
            options: {},
            loading: false,
            items: [],
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
                    text: 'Nomor KTA',
                    value: 'kta_id'
                },
                {

                    text: 'Hak Akses',
                    value: 'role.display_name'
                },
                {
                    text: 'Point',
                    value: 'point'
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
        getQuestionLists(){
            this.loading=true
            axios.get('/admin/getposttestquestionlists/'+this.posttest_id).then(res=>{
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
                    text: 'Post tes harus memiliki minimal 1 soal',
                    icon: 'warning',
                })
            } else {
                Swal.fire({
                    title: 'Konfirmasi',
                    text: "Hapus pertanyaan ini dari list soal post tes?",
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
        //this.posttest_id = parseInt('{{$posttest_id}}')

        if(this.posttest_id>=0){
            this.getQuestionLists();
        }

        axios.get('/admin/getposttests').then(res=>{
            this.items=res.data
        })
      
    }

})
</script>
@stop