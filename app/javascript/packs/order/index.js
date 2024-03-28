import { createApp } from "vue";
import Index from "../../components/order/Index.vue";
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';

document.addEventListener("DOMContentLoaded", () => {
    const node = document.getElementById("orderIndex");
    const initialData = JSON.parse(node.getAttribute("data"));
    const app = createApp(Index, { initialData: initialData })
    app.use(ElementPlus);
    app.mount("#orderIndex");
});