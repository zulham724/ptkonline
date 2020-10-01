const state = {
    data:null,
    contents:[]
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
    setContents( state, payload ) {
        const contents = [...payload.contents.map(e=>{
            return {...e}
        })]
        const index=state.contents.findIndex(e=>e.educational_level_id==payload.educational_level_id);
        if(index>-1){
            state.contents[index].contents = contents;
        }else{
            state.contents.push({
                educational_level_id:payload.educational_level_id,
                contents:contents
            })
        }

     },
     setData( state, payload ) {
        state.data = {...payload.data}

     },
     reset(state){
         state.data=null;
         state.contents=null
     }
    
}
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}