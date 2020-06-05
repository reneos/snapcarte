import consumer from "./consumer";

const initUserCable = () => {

  // const messagesContainer = document.querySelector('.notification');
  const id = document.querySelector('body').dataset.userId;
  consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
    initialized() {
      console.log("initialized action cable")
    },
    received(data) {
      const notifications = document.querySelector('.notifications');
      notifications.insertAdjacentHTML('beforeend', data)
      console.log(data); // called when data is broadcast in the cable
    },
    connected(){
      console.log("Connected to user channel")
    }
  });
}


export { initUserCable };
