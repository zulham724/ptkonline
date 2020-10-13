const state = {
    data:{
        title: null,
        school_name: null,
        school_address: null,
        year: null,
        educational_level_id: null,
        classroom_research_contents: []
    },
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
     setData( state, payload ) {
        state.data = {...payload.data,classroom_research_contents:payload.data.classroom_research_contents.map(content=>{
            return {...content}
        })}
        console.log(state.data)

     },
     reset(state){
         state.data=null;
     }
    
}
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}