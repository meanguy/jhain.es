<template>
  <Container>
    <b-jumbotron class="jh-jumbotron">
      <template #header>
        <span class="jh-header">
          <span class="jh-text-weight-light">jhain</span>
          <span class="jh-text-weight-normal">es</span>
        </span>
      </template>

      <template #lead>
        <span class="jh-lead">
          <span class="jh-text-weight-light">
            six years of software engineering
          </span>
          <span class="jh-text-weight-normal"> |</span>

          <span class="jh-text-weight-light">
            c++, go, java, python, and more
          </span>
        </span>
      </template>
      <span class="jh-body">
        <b-link href="https://blog.jhain.es/">blog</b-link>
        |
        <b-link href="https://www.linkedin.com/in/jhaindotes/">linkedin</b-link>
        |
        <b-link href="https://github.com/j-haines/">github</b-link>
      </span>
    </b-jumbotron>
  </Container>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

import Container from "@/components/Container.vue";

@Component({
  components: {
    Container,
  },
})
export default class Home extends Vue {}
</script>

<style lang="scss" scoped>
.jh-body {
  font-family: "Roboto", sans-serif;
  font-size: 0.8rem;
  font-weight: 400;
}

.jh-header {
  font-family: "Roboto", sans-serif;

  .jh-text-weight-light {
    font-weight: 100;
  }

  .jh-text-weight-normal {
    font-weight: 300;
  }
}

.jh-jumbotron {
  background-color: $jh-white;
}

.jh-lead {
  font-family: "Noto Sans", sans-serif;
  font-size: 1rem;

  .jh-text-weight-light {
    font-weight: 400;
  }

  .jh-text-weight-normal {
    font-weight: 700;
  }
}
</style>
