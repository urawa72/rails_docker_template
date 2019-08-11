<template>
  <div class="msg">
    {{ message }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello Rails & Vue!!'
    }
  }
}
</script>

<style lang="scss" scoped>
.msg {
  text-align: center
}
</style>

