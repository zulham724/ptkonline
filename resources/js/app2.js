require('./bootstrap');

import Vue from 'vue';

const swal = window.swal = require('sweetalert2');

Vue.component('pretest-question-list',require("./components/admin/PretestQuestionList.vue").default);

const app = document.getElementById('app2');

new Vue({
    
}).$mount(app);