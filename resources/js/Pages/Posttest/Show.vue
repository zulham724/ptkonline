<template>
    <v-container fluid>
        <v-row align="center" justify="space-around">
            <v-col sm="8">
                <div class="text-h5 text-center">{{ data.name }}</div>
                <div class="mb-10 text-subtitle-2 text-center">
                    {{ data.question_lists.length }} Soal
                </div>
            </v-col>
            <v-col align="center">
                <vue-countdown-timer
                    @end_callback="forceSubmit()"
                    :start-time="campaign.start_at"
                    :end-time="campaign.end_at"
                    :interval="1000"
                    :start-label="'Until start:'"
                    :end-label="'Timer'"
                    label-position="begin"
                    :end-text="'Waktu habis!'"
                    :day-txt="'hari'"
                    :hour-txt="'jam'"
                    :minutes-txt="'menit'"
                    :seconds-txt="'detik'"
                >
                    <template v-slot:countdown="scope">
                        <v-progress-circular
                            :rotate="-90"
                            :size="100"
                            :width="15"
                            :value="getProgressValue(scope)"
                            color="primary"
                        >
                            {{
                                scope.props.minutes + ":" + scope.props.seconds
                            }}
                        </v-progress-circular>
                    </template>
                </vue-countdown-timer>
            </v-col>
        </v-row>

        <v-card
            class="mx-auto mb-1"
            outlined
            v-for="(question_list, i) in data.question_lists"
            :key="i"
        >
            <v-card-text>
                {{ i + 1 }}.
                <span
                    style="white-space: break-spaces; "
                    class="black--text"
                    v-html="question_list.value"
                ></span>
                <v-radio-group
                    v-model="question_list.answer"
                    class="mb-n5"
                    v-if="
                        question_list.question_list_type.name == 'selectoptions'
                    "
                >
                    <v-radio
                        v-for="(answer_list, j) in question_list.answer_lists"
                        :key="`answer${j}`"
                        :label="answer_list.value"
                        :value="answer_list.id"
                    ></v-radio>
                </v-radio-group>
                <v-row v-else class="mb-n3">
                    <v-col lg="6">
                        <v-textarea
                            v-model="question_list.answer"
                            height="100px"
                            outlined
                            dense
                            label="Tulis jawaban"
                        >
                        </v-textarea>
                    </v-col>
                </v-row>
            </v-card-text>
        </v-card>
        <div class="d-flex justify-end">
            <v-btn color="primary" @click="submit">Submit Jawaban</v-btn>
        </div>
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

    props: ["user", "data", "campaign"],
    computed: {
        ...mapState(["Posttest"]),
        progressValue() {
            console.log("asu");
            return 10;
        }
    },
    data() {
        return {
            radioGroup: 1,
            model: null
            // loading: false,
            // drawer: null,
            // item: 0
        };
    },
    created() {
        console.log("campaign", this.campaign);
        this.data.question_lists.forEach(v => {
            let find = this.Posttest.question_lists.find(e => e.id == v.id);
            if (find) v.answer = find.answer;
            // else v.answer = null
        });
        this.$store.commit("User/set", {
            data: this.user
        });
    },
    components: {
        VuetifyLayout
        //Welcome,
    },
    watch: {
        "data.question_lists": {
            handler: _.debounce(function(val, oldVal) {
                console.log("watch data.question_lists", this.data);
                this.$store.commit("Posttest/set", {
                    posttest: {
                        id: this.data.id,
                        name: this.data.name
                    },
                    question_lists: val
                });
                this.$store.dispatch("Posttest/setAnswers", this.data);
            }, 500),
            deep: true
        }
    },
    methods: {
        getProgressValue: function(a) {
            // console.log(a)
            const now = Date.now() / 1000;
            const begin = this.campaign.start_at_timestamp;
            const end = this.campaign.end_at_timestamp;
            const x = ((now - begin) / (end - begin)) * 100;
            // console.log(now,begin,end,x);
            return x;
        },
        forceSubmit() {
            this.$inertia.post("/posttests", this.data, {
                replace: false,
                preserveState: true,
                preserveScroll: false,
                only: [],
                headers: {}
            });
        },
        submit() {
            //let data = t
            let error = false;
            for (let question_list of this.data.question_lists) {
                console.log(question_list);
                if (!question_list.answer) {
                    error = true;
                    break;
                }
            }
            if (error) {
                swal.fire(
                    "Warning",
                    "Masih ada soal yang belum diisi",
                    "warning"
                );
                return;
            } else {
                swal.fire({
                    title: "Konfirmasi",
                    text: "Submit soal? Pastikan teliti dalam menjawab soal",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Ya, submit",
                    reverseButtons: true
                }).then(result => {
                    if (result.isConfirmed) {
                        this.$inertia.post("/posttests", this.data, {
                            replace: false,
                            preserveState: true,
                            preserveScroll: false,
                            only: [],
                            headers: {}
                        });
                    }
                });
            }
        },
        beginTest() {
            this.$store.dispatch("Posttest/test");
        }
    }
};
</script>
