<template>
  <div>
    <Message />
    <p class="sub-msg">sub message</p>
  </div>
</template>

<script>
import Message from '../../components/Message.vue'
export default {
  components: {
    Message
  }
}
</script>

<style lang="scss" scoped>
.sub-msg {
  text-align: center
}
</style>
