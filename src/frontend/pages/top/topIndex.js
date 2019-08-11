import Vue from 'vue'
import TopIndex from './index'

new Vue({
  el: '#app',
  components: {
    // これでViewファイル内では<top-index />で呼べる。
    TopIndex
  }
})
