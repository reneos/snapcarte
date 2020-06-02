import flatpickr from 'flatpickr';

const initFlatpickr = () => {
  const pickupTime = document.querySelector('#pickup-time')
  if(pickupTime) {
    flatpickr('#pickup-time', {
    enableTime: true,
    noCalendar: true,
    defaultDate: new Date,
    maxTime: "23:59",
    });
  }
}

export { initFlatpickr }
