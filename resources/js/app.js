require('./bootstrap');
// var _ = require('lodash');
import Vue from 'vue';
// Vue.prototype.$axios = require('axios').default;

import '@mdi/font/css/materialdesignicons.css' // Ensure you are using css-loader

import { InertiaApp } from '@inertiajs/inertia-vue';
import { InertiaForm } from 'laravel-jetstream';
import PortalVue from 'portal-vue';
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import { InertiaProgress } from '@inertiajs/progress'
import store from './store';
import VueCountdownTimer from 'vuejs-countdown-timer';
import wysiwyg from "vue-wysiwyg";
Vue.use(wysiwyg, {}); // config is optional. more below

InertiaProgress.init({
    // The delay after which the progress bar will
    // appear during navigation, in milliseconds.
    delay: 250,
  
    // The color of the progress bar.
    color: '#29d',
  
    // Whether to include the default NProgress styles.
    includeCSS: true,
  
    // Whether the NProgress spinner will be shown.
    showSpinner: false,
  })

//import 'codemirror/lib/codemirror.css';
//import '@toast-ui/editor/dist/toastui-editor.css';
import "vue-wysiwyg/dist/vueWysiwyg.css";

//import { Editor } from '@toast-ui/vue-editor';

import Vue2Editor from "vue2-editor";
const swal = window.swal = require('sweetalert2');

Vue.use(InertiaApp);
Vue.use(InertiaForm);
Vue.use(PortalVue);
Vue.use(Vuetify);
Vue.use(Vue2Editor);
Vue.use(VueCountdownTimer);

Vue.component('pretest-question-list',require("./components/admin/PretestQuestionList.vue").default);

const moment = require('moment')
require('moment/locale/id')
Vue.use(require('vue-moment'), {
  moment
})

const app = document.getElementById('app');

new Vue({
  store:store,
    icons: {
        iconfont: 'mdi', // default - only for display purposes
      },
    
    vuetify: new Vuetify,
    render: (h) =>
        h(InertiaApp, {
            props: {
                initialPage: JSON.parse(app.dataset.page),
                resolveComponent: (name) => require(`./Pages/${name}`).default,
            },
        }),
}).$mount(app);
