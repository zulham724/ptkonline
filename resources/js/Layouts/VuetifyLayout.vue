<template>
<v-app id="inspire">
    <v-navigation-drawer v-model="drawer" app>
        <v-list dense>
            <v-list-item-group v-model="item" color="primary">
                <v-list-item active link @click="goToUrl('/')">
                    <v-list-item-action>
                        <v-icon>mdi-home</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Home</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

                <v-list-group :value="true" prepend-icon="mdi-account-circle" no-action>
                    <template v-slot:activator>
                        <v-list-item-content>
                            <v-list-item-title>Ruang Pelatihan</v-list-item-title>

                        </v-list-item-content>
                    </template>

                    <v-list-item link @click="goToUrl('/pretests')">
                        <v-list-item-title>Pre Tes</v-list-item-title>
                        <v-list-item-icon v-if="getPretestCampaigns">
                            <v-icon color="primary">mdi-check</v-icon>
                        </v-list-item-icon>

                    </v-list-item>

                    <v-list-item link @click="goToUrl('/training_materials')">
                        <v-list-item-content>
                            <v-list-item-title>Materi Pelatihan</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>

                    <v-list-group :value="true" no-action sub-group>
                        <template v-slot:activator>
                            <v-list-item-title>Praktik</v-list-item-title>
                            <v-list-item-icon v-if="getClassroomResearchCount">
                                <v-icon color="primary">mdi-check</v-icon>
                            </v-list-item-icon>
                        </template>

                        <v-list-item link @click="goToUrl('/classroom_researches')">
                            <v-list-item-title>List PTK</v-list-item-title>

                            <!--<v-list-item-icon>
                                <v-icon>mdi-file-outline</v-icon>
                            </v-list-item-icon>-->
                        </v-list-item>
                        <v-list-item link @click="goToUrl('/classroom_researches/create')">
                            <v-list-item-title>Buat PTK</v-list-item-title>

                            <!--<v-list-item-icon>
                                <v-icon>mdi-file-outline</v-icon>
                            </v-list-item-icon>-->
                        </v-list-item>
                    </v-list-group>

                    <v-list-item link @click="goToUrl('/posttests')">
                        <v-list-item-title>Post Tes</v-list-item-title>
                        <v-list-item-icon v-if="getPosttestCampaigns">
                            <v-icon color="primary">mdi-check</v-icon>
                        </v-list-item-icon>
                    </v-list-item>

                </v-list-group>

                <v-list-item active link @click="goToUrl('/posts')">
                    <v-list-item-action>
                        <v-icon>mdi-comment-question</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Konsultasi</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

                <v-list-item active link @click="goToUrl('/achievements')">
                    <v-list-item-action>
                        <v-icon>mdi-trophy</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Prestasi</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

                <v-divider></v-divider>
                <v-list-item link @click="logout">
                    <v-list-item-action>
                        <v-icon>mdi-account-arrow-right</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Logout</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list-item-group>
        </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="indigo" dark>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
        <v-toolbar-title>Penelitian Tindakan Kelas</v-toolbar-title>
    </v-app-bar>

    <v-main>
        <v-container class="_fill-height" fluid>
            <v-row align="center" justify="center">
                <v-col>
                    <!--<router-view :educational-levels="{{$educational_levels}}"></router-view>-->
                    <slot></slot>

                    <!-- <v-tooltip left>
              <template v-slot:activator="{ on }">
                <v-btn
                  :href="source"
                  icon
                  large
                  target="_blank"
                  v-on="on"
                >
                  <v-icon large>mdi-code-tags</v-icon>
                </v-btn>
              </template>
              <span>Source</span>
            </v-tooltip> -->
                </v-col>
            </v-row>
        </v-container>
    </v-main>
    <v-footer color="indigo" app>
        <span class="white--text">&copy; 2020</span>
    </v-footer>
    <!-- Authentication -->
    <form @submit.prevent="logout">
    </form>
</v-app>
</template>

<script>
import {
    mapState
} from "vuex";
export default {
    props: {
        source: String,
        campaigns: Array
    },
    computed: {
        ...mapState(["User"]),
        getPretestCampaigns: function () {
            return this.User.data ? this.User.data.pretest_campaigns_count : null;
        },
        getPosttestCampaigns: function () {
            return this.User.data ? this.User.data.posttest_campaigns_count : null;
        },
        getClassroomResearchCount: function () {
            return this.User.data ? this.User.data.classroom_researches_count : null;
        }
    },
    data() {
        return {
            loading: false,
            drawer: null,
            item: 0
        }
    },
    // watch: {
    //     item: function (newVal, oldVal) {
    //         alert(newVal)
    //     }
    // },
    //console.log(JSON.parse(window.localStorage.getItem('auth')))
    mounted() {
        //alert('as')
    },

    methods: {
        goToUrl(url) {
            this.$inertia.visit(url, {
                method: 'get',
                data: {},
                replace: false,
                preserveState: false,
                preserveScroll: false,
                only: [],
                headers: {},
            })
        },
        logout() {
            axios.post('/logout').then(response => {
                window.location = '/';
            })
        },
    }

}
</script>
