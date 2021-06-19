<template>
    <v-container fluid>
        <v-row class="justify-center">
            <v-col>
                <div class="d-flex justify-between">
                    <v-switch
                        v-model="switch1"
                        label="Tampilkan draft saja"
                    ></v-switch>
                    <v-btn
                        class="mt-2"
                        color="primary"
                        @click="goToUrl('classroom_researches/create')"
                        >Buat Proposal PTK</v-btn
                    >
                </div>
                <v-data-table
                    show-expand
                    :expanded.sync="expanded"
                    :headers="headers"
                    :items="filteredItems"
                    class="elevation-1"
                >
                    <template v-slot:item.plagiarism_score="{ item }">
                        <v-chip @click="showPlagiarism(item)">{{
                            item.plagiarism_score
                        }}</v-chip>
                    </template>
                    <template v-slot:item.action="{ item }">
                        <v-icon
                            small
                            class="mr-2"
                            @click="editContent(item.id)"
                        >
                            mdi-pencil
                        </v-icon>
                        <v-icon small @click="remove(item.id)">
                            mdi-delete
                        </v-icon>
                        <v-icon small @click="print(item.id)">
                            mdi-printer
                        </v-icon>
                    </template>
                    <template v-slot:item.status="{ item }">
                        <span v-if="item.status == 1">Completed</span>
                        <span v-else-if="item.status == 0">Draft</span>
                        <span v-else>Invalid</span>
                    </template>
                    <template v-slot:expanded-item="{ headers, item }">
                        <td :colspan="headers.length">
                            <v-row
                                dense
                                v-for="(comment,
                                comment_i) in item.classroom_research_comments"
                                :key="`comment-${comment.id}`"
                            >
                                <v-col sm="6">
                                    <v-textarea
                                        readonly
                                        name="input-7-1"
                                        :label="`Komentar #${comment_i+1}`"
                                        :value="comment.value"
                                    ></v-textarea>
                                </v-col>
                            </v-row>
                        </td>
                    </template>
                </v-data-table>
            </v-col>

            <v-dialog
                v-model="dialog"
                fullscreen
                hide-overlay
                transition="dialog-bottom-transition"
            >
                <v-card>
                    <v-toolbar dark color="primary">
                        <v-btn icon dark @click="dialog = false">
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                        <v-toolbar-title
                            >Tingkat Plagiarism Konten</v-toolbar-title
                        >
                        <v-spacer></v-spacer>
                        <v-toolbar-items>
                            <v-btn dark text @click="dialog = false">
                                Tutup
                            </v-btn>
                        </v-toolbar-items>
                    </v-toolbar>
                    <v-card-text>
                        <v-data-table
                            hide-default-footer
                            :loading="loading"
                            class="mt-3"
                            :items="items2"
                            :headers="headers2"
                        >
                            <template v-slot:item.plagiarism_score="{ item }">
                                <v-chip>{{
                                    item.plagiarism_score + "%"
                                }}</v-chip>
                            </template>
                            <template v-slot:item.value="{ item }">
                                <div v-html="item.value"></div>
                            </template>
                            <template slot="body.append">
                                <tr>
                                    <td colspan="2" class="text-h6 text-center">
                                        Rata-rata
                                    </td>
                                    <td>
                                        <v-chip color="primary"
                                            >{{ plagiarismAverage }}
                                        </v-chip>
                                    </td>
                                </tr>
                            </template>
                        </v-data-table>
                    </v-card-text>
                </v-card>
            </v-dialog>

            <v-dialog
                v-model="editDialog"
                fullscreen
                hide-overlay
                transition="dialog-bottom-transition"
            >
                <v-card>
                    <v-toolbar dark color="primary">
                        <v-btn icon dark @click="editDialog = false">
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                        <v-toolbar-title>Edit PTK</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-toolbar-items>
                            <v-btn dark text @click="editDialog = false">
                                Tutup
                            </v-btn>
                        </v-toolbar-items>
                    </v-toolbar>
                    <v-container fluid>
                        <v-form ref="form" v-model="valid" lazy-validation>
                            <v-row>
                                <v-col lg="12">
                                    <v-text-field
                                        :rules="[
                                            v =>
                                                !!v ||
                                                'Judul Proposal harus diisi'
                                        ]"
                                        v-model="build.title"
                                        dense
                                        label="Judul Proposal PTK"
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <!--<v-row>
        <v-col cols="6">
            <v-text-field v-model="build.name" dense label="Nama"></v-text-field>
        </v-col>
        <v-col cols="6">
            <v-text-field dense label="Email" type="email"></v-text-field>
        </v-col>
    </v-row>-->
                            <v-row>
                                <v-col lg="3">
                                    <v-text-field
                                        :rules="[
                                            v =>
                                                !!v ||
                                                'Nama sekolah harus diisi'
                                        ]"
                                        v-model="build.school_name"
                                        dense
                                        label="Nama Sekolah"
                                    ></v-text-field>
                                </v-col>
                                <v-col lg="8">
                                    <v-text-field
                                        v-model="build.school_address"
                                        dense
                                        label="Alamat Sekolah"
                                    ></v-text-field>
                                </v-col>
                                <v-col lg="1">
                                    <v-text-field
                                        :rules="[
                                            v => !!v || 'Tahun harus diisi'
                                        ]"
                                        v-model="build.year"
                                        dense
                                        label="Tahun"
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col lg="6">
                                    <v-select
                                        @input="getTemplate()"
                                        dense
                                        :items="educationalLevels"
                                        v-model="build.educational_level_id"
                                        item-value="id"
                                        item-text="name"
                                        label="Pilih Jenjang"
                                    ></v-select>
                                </v-col>
                            </v-row>
                            <div
                                v-for="(content,
                                n) in build.classroom_research_contents"
                                :key="n"
                            >
                                <v-row class="text-h6">{{
                                    content.name
                                }}</v-row>
                                <v-row>
                                    <v-col lg="12">
                                        <vue-editor v-model="content.value" />
                                    </v-col>
                                </v-row>
                            </div>
                            <div
                                class="d-flex justify-end"
                                v-if="build.educational_level_id"
                            >
                                <v-btn
                                    class="mt-2"
                                    color="primary"
                                    @click="submit"
                                    >Edit Proposal PTK</v-btn
                                >
                            </div>
                        </v-form>
                    </v-container>
                </v-card>
            </v-dialog>
        </v-row>
    </v-container>
</template>

<script>
import { VueEditor } from "vue2-editor";
import VuetifyLayout from "./../../Layouts/VuetifyLayout";
import { mapState } from "vuex";

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["items", "user", "educationalLevels"],
    computed: {
        ...mapState(["ClassroomResearchEdit"]),
        plagiarismAverage() {
            let total = 0;
            this.items2.forEach(v => {
                total += v.plagiarism_score;
            });
            return this.items2.length
                ? (total / this.items2.length).toFixed(2) + "%"
                : "-";
        },
        filteredItems() {
            if (!this.switch1) return this.items;
            else {
                return this.items.filter(e => e.status == 0);
            }
        }
    },
    data() {
        return {
            expanded: [],
            switch1: false,
            valid: true,
            dialog: false,
            editDialog: false,
            loading: false,
            build: {
                title: null,
                school_name: null,
                school_address: null,
                year: new Date().getFullYear(),
                educational_level_id: null,
                classroom_research_contents: []
            },
            headers2: [
                {
                    text: "Bab",
                    value: "name"
                },
                {
                    text: "Konten",
                    value: "value"
                },
                {
                    text: "Tingkat Plagiarism",
                    value: "plagiarism_score"
                }
            ],
            items2: [],
            headers: [
                {
                    text: "Nama",
                    value: "user.name",
                    sortable:false,
                },
                {
                    text: "Judul",
                    value: "title",
                     sortable:false,
                },
                {
                    text: "Tahun",
                    value: "year"
                },
                {
                    text: "Jenjang",
                    value: "educational_level.name"
                },
                {
                    text: "Nama Sekolah",
                    value: "school_name"
                },
                {
                    text: "Tingkat plagiarism",
                    value: "plagiarism_score"
                },
                {
                    text: "Status",
                    value: "status"
                },
                {
                    text: "Aksi",
                    value: "action"
                }
            ]
            // items: [

            // ]
        };
    },
    watch: {
        build: {
            handler: _.debounce(function(val, oldVal) {
                console.log(val);
                this.$store.commit("ClassroomResearchEdit/setData", {
                    data: val
                });
            }, 500),
            deep: true
        }
    },
    components: {
        VuetifyLayout
        //Welcome,
    },
    created() {
        this.$store.commit("User/set", {
            data: this.user
        });
    },
    methods: {
        print(id) {
            window.open(`/classroom_research/${id}/download`, "_blank");
            // this.$inertia.visit();
        },
        submit() {
            if (!this.$refs.form.validate()) return;
            swal.fire({
                title: "Konfirmasi",
                text: "Submit Proposal PTK yang diedit?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, submit"
            }).then(result => {
                if (result.isConfirmed) {
                    this.$store.commit("ClassroomResearchEdit/reset");
                    this.$inertia
                        .put(
                            "/classroom_researches/" + this.build.id,
                            this.build,
                            {
                                replace: false,
                                preserveState: true,
                                preserveScroll: false,
                                only: [],
                                headers: {}
                            }
                        )
                        .then(() => {
                            this.editDialog = false;
                        });
                    //this.$store.commit('ClassroomResearchEdit/reset');
                }
            });
        },
        remove(item_id) {
            swal.fire({
                title: "Konfirmasi Hapus",
                icon: "warning",
                text: "Yakin hapus PTK ini?",
                showCancelButton: true,
                confirmButtonText: "Ya, Hapus",
                showLoaderOnConfirm: true,
                preConfirm: login => {
                    return this.$inertia
                        .post(`/classroom_researches/${item_id}`, {
                            _method:'delete'
                        })
                        .then(response => {
                            console.log(response);
                            return response;
                        })
                        .catch(error => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`
                            );
                        });
                },
                allowOutsideClick: () => !swal.isLoading()
            }).then(result => {
                if (result.isConfirmed) {
                    swal.fire("Hapus sukses");
                }
            });
        },
        editContent(item_id) {
            if (
                this.ClassroomResearchEdit.data &&
                this.ClassroomResearchEdit.data.id == item_id
            ) {
                this.build = {
                    ...this.ClassroomResearchEdit.data,
                    classroom_research_contents: this.ClassroomResearchEdit.data.classroom_research_contents.map(
                        content => {
                            return {
                                ...content
                            };
                        }
                    )
                };
                this.editDialog = true;
            } else {
                this.loading = true;
                swal.enableLoading();
                axios.get("/classroom_researches/" + item_id).then(res => {
                    this.$store.commit("ClassroomResearchEdit/setData", {
                        data: res.data
                    });
                    this.build = {
                        ...res.data,
                        classroom_research_contents: res.data.classroom_research_contents.map(
                            content => {
                                return {
                                    ...content
                                };
                            }
                        )
                    };
                    this.loading = false;
                    this.editDialog = true;
                    swal.close();
                });
            }
        },
        showPlagiarism(item) {
            this.dialog = this.loading = true;
            this.items2 = [];
            axios.get("classroom_research_plagiarism/" + item.id).then(res => {
                this.items2 = res.data.classroom_research_contents;
                console.log(res.data);
                this.loading = false;
            });
        },
        goToUrl(url) {
            this.$inertia.visit(url, {
                method: "get",
                data: {},
                replace: false,
                preserveState: false,
                preserveScroll: false,
                only: [],
                headers: {}
            });
        },
        test() {},
        beginTest() {
            //console.log(this.model)
            this.goToUrl("/posttest/" + this.model);
        }
    }
};
</script>
