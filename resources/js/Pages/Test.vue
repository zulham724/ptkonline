<template>
<v-app id="inspire">
    <v-navigation-drawer v-model="drawer" app>
        <v-list dense>
            <v-list-item-group v-model="item" color="primary">
                <v-list-item active link>
                    <v-list-item-action>
                        <v-icon>mdi-home</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Home</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item link>
                    <v-list-item-action>
                        <v-icon>mdi-email</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Buat Survey</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
                <v-divider></v-divider>
                <v-list-item link>
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
        <v-toolbar-title>ss</v-toolbar-title>
    </v-app-bar>

    <v-main>
        <v-container class="fill-height" fluid>
            <v-row align="center" justify="center">
                <v-col>
                    <!--<router-view :educational-levels="{{$educational_levels}}"></router-view>-->
                    {{test}}

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
        <span class="white--text">aa</span>
    </v-footer>
</v-app>
</template>

<script>
export default {
    props: ["test"],
    data() {
        return {
            loading: false,
            drawer: null,
            item: 0
        }
    } //console.log({!!$auth!!})
    //console.log(JSON.parse(window.localStorage.getItem('auth')))
}
</script>
