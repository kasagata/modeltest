<template>
  <el-row>
    <el-col :span="12">
      <div>
        <p>金額自動計算プログラムテスト</p>
          <el-table :data="tableData" style="width: 100%" v-for="(v, v_index) in selected.length" :key="`selected_${v_index}`">
            <el-table-column label= "衣類選択">
              <el-select v-model="selected[v_index]"
                @change="() => setContent(v_index)"
                >   
                <el-option disabled value="">依頼する衣類を一つずつお選びください</el-option>
                <el-option v-for="(content, index) in contents" :key="index" :value="content" :label="content.name" />
              </el-select>
            </el-table-column>
            <el-table-column label= "加工方法選択">
              <el-select v-model="selected_2[v_index]"
                @change="() => setContent(v_index)"
              >
                <el-option disabled value="">依頼する加工を一つずつお選びください</el-option>
                <el-option v-for="(process, index) in processing" :key="index" :value="process">
                  {{ process.name }}
                </el-option>
              </el-select>
            </el-table-column>
            <el-table-column label= "個数">
              <el-input type="number" v-model="selected[v_index].count" />
            </el-table-column>
            <el-table-column label= "単価">
              <a>{{ selected[v_index].price }}</a>
            </el-table-column>
            <el-table-column label= "小計">
              <a>{{ selected[v_index].price + selected_2[v_index].price * selected[v_index].count }}</a>
            </el-table-column>
          </el-table>


        <table class="contents-table">
          <tr>
            <th>衣類選択</th>
            <th>加工方法選択</th>
            <th>個数</th>
            <th>単価</th>
            <th>小計</th>
          </tr>

          <tr v-for="(v, v_index) in selected.length" :key="`selected_${v_index}`">
            <td>
              <select v-model="selected[v_index]"
                      @change="() => setContent(v_index)"
              >
                <option disabled value="">依頼する衣類を一つずつお選びください</option>
                <option v-for="(content, index) in contents" :key="index" :value="content">
                  {{ content.name }}
                </option>
              </select>
            </td>
            <td>
              <select v-model="selected_2[v_index]"
                      @change="() => setContent(v_index)"
              >
                <option disabled value="">依頼する加工を一つずつお選びください</option>
                <option v-for="(process, index) in processing" :key="index" :value="process">
                  {{ process.name }}
                </option>
              </select>
            </td>

            <td>
              <input type="number" v-model="selected[v_index].count" />
            </td>

            <td>
              <a>{{ selected[v_index].price }}</a>
            </td>

            <td>
              <a>{{ selected[v_index].price + selected_2[v_index].price * selected[v_index].count }}</a>
            </td>

          </tr>
        </table>
      </div>
      <el-button @click="increment">+</el-button>
      <el-button @click="decrement">-</el-button>
      <div>
        合計{{ totalPrice }}円
        <span v-if="totalPrice >= deliveryFreePrice" >
          (送料無料)
        </span>
        <span v-else>
          あと{{ deliveryFreePrice - totalPrice }}円の注文で送料無料
        </span>
      </div>
    </el-col>
  </el-row>
</template>

<script>
export default {
  props: {
    contents: {
      type: Array,
      default: () => []
    },
    processing: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      tableData: [
        {
          date: '2016-05-03',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
        },
        {
          date: '2016-05-02',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
        },
        {
          date: '2016-05-04',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
        },
        {
          date: '2016-05-01',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
        },
      ],
      selected: [
        {
          id: NaN,
          name: "",
          count: 1,
          price: 0,
        },
      ],
      selected_2: [
        {
          id: NaN,
          name: "",
          count: 1,
          price: 0,
        },
      ],
      
      deliveryFreePrice: 10000,
    };
  },
  methods: {
    increment() {
      this.selected.push({
        id: NaN,
        name: "",
        count: 0,
        price: 0
      });
      this.selected_2.push({
        id: NaN,
        name: "",
        count: 0,
        price: 0
      });
    },
    decrement() {
      if (this.selected.length === 1) return;
      this.selected.pop();
    },
    setContent(index) {
      // 選択された商品の料金を取得
      const price = this.contents.find(({name}) => name === this.selected[index].name).price;
      // selectedにすでに同一のnameがある場合は対象の個数を1つ増やし, 新しく追加されているselectedは削除する, 重複行を削除するため
      if (this.selected.filter(({name}) => name === this.selected[index].name).length > 1) {
        // 最初に見つかったselectedの個数を1つ増やす
        this.selected.find(({name}) => name === this.selected[index].name).count++;
        // 重複しているselectedを削除
        this.selected = this.selected.filter((_, i) => i !== index);
        return;
      }
      // 選択された商品の個数が0の場合は1にする
      if (this.selected[index].count === 0) this.selected[index].count = 1;
      this.selected[index].price = price;
    },
  },
  computed: {
    totalPrice() {
      // 選択された商品の合計金額を計算
      return this.selected.reduce((acc, cur) => acc + cur.price * cur.count, 0);
    },
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