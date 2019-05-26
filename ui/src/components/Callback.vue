<template>
  <div>
    <p>Loading...</p>
  </div>
</template>

<script>
export default {
  methods: {
    handleLoginEvent(data) {
    console.log(data);
    this.$router.push(data.state.target || "/");
    }
  },
  created() {
    console.log(this.$auth)
    this.$auth.handleAuthentication();
  }
};
</script>
