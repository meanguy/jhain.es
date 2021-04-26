import Vue from "vue";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

import "@/registerServiceWorker";
import "@/styles/app.scss";
import App from "@/App.vue";
import router from "@/router";

Vue.config.productionTip = false;

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
