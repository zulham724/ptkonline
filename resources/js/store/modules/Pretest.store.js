const axios = require("axios").default;

const state = {
    data: null,
    question_lists: []
};
// Getter functions
const getters = {
    getVariable2(state) {
        return state.varaible2;
    }
};
// Actions
const actions = {
    setAnswers({ commit }, pretest) {
        return new Promise((resolve, reject) => {
            axios
                .post(`/pretest/${pretest.id}/setanswers`, pretest)
                .then(res => {
                    console.log(res.data);
                });
        });
    }
};
// Mutations
const mutations = {
    // setAnswer( state, payload ) {
    //     state.data={...payload.data, question_lists:[...payload.data.question_lists]}
    //  },
    set(state, payload) {
        state.data = payload.pretest;
        state.question_lists = [];
        payload.question_lists.forEach(v => {
            let item = {};
            item.id = v.id;
            item.answer = v.answer;
            //console.log('> '+v.answer)
            state.question_lists.push(item);
        });
        // console.log(state.question_lists);
    }
};
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
};
