const state = {
    items:null,
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
    set( state, payload ) {
        state.items=[...payload.items.map(e=>{
            return {...e}
        })]

     },
}
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}