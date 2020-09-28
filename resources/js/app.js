require('./bootstrap');

import Vue from 'vue';
import '@mdi/font/css/materialdesignicons.css' // Ensure you are using css-loader

import { InertiaApp } from '@inertiajs/inertia-vue';
import { InertiaForm } from 'laravel-jetstream';
import PortalVue from 'portal-vue';
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'


Vue.use(InertiaApp);
Vue.use(InertiaForm);
Vue.use(PortalVue);
Vue.use(Vuetify)

const app = document.getElementById('app');

new Vue({
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
