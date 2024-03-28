<template>
    <div>
      <h1>{{ initialData.title }}</h1>
      <Table v-bind:table="initialData.orders" />
      <Contents v-bind:contents="initialData.contents" v-bind:processing="initialData.processing"/>
    </div>
</template>

<script>
import Contents from "./Contents.vue";
import Table from "./Table.vue";
export default {
  components: {
    Contents,
    Table
  },
  props: {
    initialData: {
      type: Object,
      default: () => {}
    }
  },
};
</script>

<style scoped>
</style>