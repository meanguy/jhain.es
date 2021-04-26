<template>
  <b-container fluid>
    <b-row class="vh-100" align-v="center">
      <b-col md="6" offset-md="3">
        <slot></slot>
      </b-col>
    </b-row>
  </b-container>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component
export default class Container extends Vue {}
</script>
