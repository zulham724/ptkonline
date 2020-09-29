const state = {
    data:{
        question_lists:[]
    }
}
// Getter functions
const getters = {
  
    getVariable2( state ) {
       return state.varaible2;
    },
    
}
// Actions 
const actions = {
    // setAnswer({ commit }, payload) {
    //     return new Promise( (resolve, reject) => {
    //            alert('anjay')
    //            resolve();
    //     })
    // },
    
    
}
// Mutations
const mutations = {
    setAnswer( state, payload ) {
        state.data={...payload.data, question_lists:[...payload.data.question_lists]}
     },
     set( state, payload ) {
        // state.data={...payload.data, question_lists:[...payload.data.question_lists]}
     },
    
}
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}