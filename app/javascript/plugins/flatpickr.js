import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    // altInput: true,
    allowInput: true,
    altInput: true,
    minDate: "today",
    dateFormat: "d-m-Y",
    plugins: [new rangePlugin({ input: "#range_end"})],
    disableMobile: "true"
  });
}

export { initFlatpickr };
