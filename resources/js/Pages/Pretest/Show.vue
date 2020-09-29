<template>
<v-container fluid>
    <div class="text-h5 text-center">{{data.name}}</div>
    <div class="mb-10 text-subtitle-2 text-center">{{data.question_lists.length}} Soal</div>
    <v-card class="mx-auto mb-1" outlined v-for="(question_list, i) in data.question_lists" :key="i">
        <v-card-text>
            {{i+1}}. <span class="black--text">{{question_list.value}}</span>
            <v-radio-group v-model="question_list.answer" class="mb-n5">
                <v-radio v-for="(answer_list, j) in question_list.answer_lists" :key='`answer${j}`' :label="answer_list.value" :value="answer_list.id"></v-radio>
            </v-radio-group>
        </v-card-text>
    </v-card>
</v-container>
</template>

<script>
import VuetifyLayout from './../../Layouts/VuetifyLayout'
import {
    mapState
} from "vuex";

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["data"],

    data() {
        return {
            radioGroup: 1,
            model: null,
            // loading: false,
            // drawer: null,
            // item: 0
        }
    },
    created() {

    },
    components: {
        VuetifyLayout,
        //Welcome,
    },
    watch: {
        'data.question_lists': {
            handler: function (val, oldVal) {
                //console.log(val)
                this.$store.commit("QuestionList/setAnswer", {
                    question_lists: val
                });
            },
            deep: true,
        }
    },
    methods: {
        beginTest() {
            this.$store.dispatch("QuestionList/test");
        }
    }
}
</script>
