<template>
  <div>
    <p>注文情報一覧テスト</p>
    <table class="contents-table">
      <tr>
        <th>ID</th>
        <th>user_id</th>
        <th>order_date</th>
        <th>shipping_addresses_id</th>
        <th>status</th>
        <th>channel</th>
        <th>price</th>
      </tr>
      <tr v-for="(column, index) in table" :key="index">
        <td>{{ column.id }}</td>
        <td>{{ column.user_id }}</td>
        <td>{{ column.order_date }}</td>
        <td>{{ column.shipping_addresses_id }}</td>
        <td>{{ column.status }}</td>
        <td>{{ column.channel }}</td>
        <td>{{ column.price }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    table: {
      type: Array,
      default: () => []
    }
  },
};
</script>

<style scoped>
.contents-table {
  border: 1px solid gray;
  margin: 10px;
}

.contents-table th,
.contents-table td {
  border: 1px solid gray;
}
</style>