<template>
    <v-container fluid>
        <div v-if="$page.flash && $page.flash.success">
            <v-alert type="success">{{ $page.flash.success }}</v-alert>
        </div>
        <div v-if="$page.flash && $page.flash.error">
            <v-alert type="error">{{ $page.flash.error }}</v-alert>
        </div>
        <div v-if="$page.flash && $page.flash.warning">
            <v-alert type="warning">{{ $page.flash.warning }}</v-alert>
        </div>
        <div v-if="uncompleted_posttests.length">
            Ada soal yang belum selesai dikerjakan

            <v-row
                class=""
                v-for="uncompleted_posttest in uncompleted_posttests"
                :key="uncompleted_posttest.id"
            >
                <v-col>
                    <span class=" text-subtitle-2"
                        >{{ uncompleted_posttest.name }} </span
                    ><span class="text-caption">{{
                        "(" +
                            uncompleted_posttest.question_lists_count +
                            " Soal)"
                    }}</span>
                    <v-btn
                        small
                        color="info"
                        @click="
                            goToUrl(`/beginposttest/${uncompleted_posttest.id}`)
                        "
                        >Kerjakan</v-btn
                    >
                </v-col>
            </v-row>

            <v-divider></v-divider>
        </div>

        <v-row align="center">
            <v-col class="d-flex" cols="12" sm="6">
                <v-select
                    v-model="model"
                    :items="items"
                    :item-text="
                        item =>
                            item.name +
                            ' (' +
                            item.question_lists_count +
                            ' Soal)'
                    "
                    item-value="id"
                    label="Pilih Paket Soal Post Tes"
                ></v-select>
            </v-col>
            <v-col>
                <v-btn
                    @click="beginTest()"
                    v-show="model != null"
                    color="primary"
                    >Kerjakan Soal</v-btn
                >
            </v-col>
        </v-row>
        <v-row>
            <v-data-table
                :headers="headers"
                :items="completed_posttests"
                class="elevation-1"
            >
                <template v-slot:item.value="{ item }">
                     <v-chip v-if="item.value && item.is_submitted" color="green" dark>
                        {{item.value}}
                    </v-chip>
                    <v-chip v-else-if="!item.value && item.is_submitted" color="orange" dark>
                        Menunggu koreksi
                    </v-chip>
                    <v-chip v-else color="red" dark>
                        Waktu habis
                    </v-chip>
                </template>
            </v-data-table>
        </v-row>
    </v-container>
</template>

<script>
import VuetifyLayout from "./../../Layouts/VuetifyLayout";
import { mapState } from "vuex";

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["user", "items", "uncompleted_posttests", "completed_posttests"],

    data() {
        return {
            model: null,
            // items:[],
            headers: [
                {
                    text: "ID",
                    value: "id"
                },
                {
                    text: "Soal",
                    value: "campaignable.name",
                    sortable: false
                },
                {
                    text: "Nilai",
                    value: "value"
                }
            ]
            // loading: false,
            // drawer: null,
            // item: 0
        };
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
        test() {
            this.$inertia.post(url);
        },
        goToUrl(url) {
            this.$inertia.post(url);
        },
        beginTest() {
            swal.fire({
                title: "Konfirmasi",
                text:
                    "Kerjakan soal ini? Anda akan diberi waktu 7 menit untuk mengerjakan soal posttest ini",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, kerjakan",
                reverseButtons: true
            }).then(result => {
                if (result.isConfirmed) {
                    this.goToUrl("/beginposttest/" + this.model);
                }
            });
        }
    }
};
</script>
