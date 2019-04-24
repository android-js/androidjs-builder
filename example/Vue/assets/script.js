// app.call.makeCall(number) // Example: this function  makes call from the system defauld app

var vue_app = new Vue({
  el: '#vue_app',
  data: {
    message: 'Hello Vue!',
    number:"",
    list:[]
  },
  methods:{
  	call(){
  		console.log(vue_app)
  		app.call.makeCall(this.number)
  	},
  	server(){
  		front.send('Hello', this.number);
  	}
  },
  mounted(){
  	front.on('print', function(msg){
  		this.data.list.push(msg)
  	})
  }
})
