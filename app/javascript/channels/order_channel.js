import consumer from "./consumer";

const initOrderCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.orderId;

    consumer.subscriptions.create({ channel: "OrderChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initOrderCable };
