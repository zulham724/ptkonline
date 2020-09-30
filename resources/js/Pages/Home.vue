<template>
<div>
    <div class="mb-16 text-h5 text-center">{{title}}</div>

    <v-card class="mx-auto">

        <v-list-item two-line>
            <v-list-item-content>
                <v-list-item-title class="headline">
                    <i>a.</i> Deskripsi Pelatihan
                </v-list-item-title>
                <!--<v-list-item-subtitle>Mon, 12:30 PM, Mostly sunny</v-list-item-subtitle>-->
            </v-list-item-content>
        </v-list-item>

        <v-card-text>
            Sebagian besar Guru PAI dan BP mempunyai kendala dalam menyusun PTK.
            Platform pelatihan PTK Online adalah jawabannya. Tidak hanya teori, tetapi
            juga praktik. Akhirnya Bapak/Ibu dapat menyusun PTK dengan mudah.
        </v-card-text>

        <!--<v-divider></v-divider>

        <v-card-actions>
            <v-btn text>
                Full Report
            </v-btn>
        </v-card-actions>-->
    </v-card>

    <v-card class="mx-auto mt-5">

        <v-list-item two-line>
            <v-list-item-content>
                <v-list-item-title class="headline">
                    <i>b.</i> Alur Pelatihan
                </v-list-item-title>
                <!--<v-list-item-subtitle>Mon, 12:30 PM, Mostly sunny</v-list-item-subtitle>-->
            </v-list-item-content>
        </v-list-item>

        <v-card-text>
            <v-row align="center">
                <v-col cols="12">
                    <v-img src="images/alur.PNG" alt="Sunny image"></v-img>
                </v-col>
            </v-row>
        </v-card-text>

        <!--<v-divider></v-divider>

        <v-card-actions>
            <v-btn text>
                Full Report
            </v-btn>
        </v-card-actions>-->
    </v-card>
    <v-card class="mx-auto mt-5">
        <v-list-item two-line>
            <v-list-item-content>
                <v-list-item-title class="headline">
                    <i>c.</i> Skenario Pelatihan
                </v-list-item-title>
                <!--<v-list-item-subtitle>Mon, 12:30 PM, Mostly sunny</v-list-item-subtitle>-->
            </v-list-item-content>
        </v-list-item>

        <v-card-text>
            <v-row align="center">
                <v-col cols="12">
                    <v-img src="images/skenario_pelatihan.PNG" size=92></v-img>
                </v-col>
            </v-row>
        </v-card-text>

        <!--<v-divider></v-divider>

        <v-card-actions>
            <v-btn text>
                Full Report
            </v-btn>
        </v-card-actions>-->
    </v-card>
</div>
</template>

<script>
import VuetifyLayout from './../Layouts/VuetifyLayout'

export default {
    // Using a render function
    layout: (h, page) => h(VuetifyLayout, [page]),

    // Using the shorthand
    layout: VuetifyLayout,

    props: ["title", "image_path"],

    data() {
        return {
            // loading: false,
            // drawer: null,
            // item: 0
        }
    },
    components: {
        VuetifyLayout,
        //Welcome,
    }
}
</script>
