import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

 const bookingForm = document.getElementById('booking-form-div');

 if (bookingForm) {
  const bookings = JSON.parse(bookingForm.dataset.bookings);
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    "disable": bookings,
  })
}

// je recup les dates
const startDate = document.getElementById("range_start");
const endDate = document.getElementById("range_end");
// je recup l'emplacement du nb de nuits
const totalNights = document.getElementById("total-nights");
//je recup le prix d'une nuit dans l'appart
// const flatPricePerNight = document.getElementById("#flat-price-per-night");
// console.log(flatPricePerNight)
// et l'emplacement du prix total 
const totalPriceElement = document.getElementById("total-price");

const dynamicPrice = () => {
  let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
  let nbrOfNights = dateDiffInMilliseconds / 86400000;

  if(startDate.value && endDate.value) {
    totalNights.innerText = nbrOfNights 
  }

  // if(startDate.value && endDate.value) {
  //   totalPriceElement.innerText = nbrOfNights * flatPricePerNight
  // }
 };

// [startDate, endDate].forEach(date => {
//   date.addEventListener("change", (event) => {
//     dynamicPrice();
//   });
// })