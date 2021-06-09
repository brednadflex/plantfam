import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    // altInput: true,
    allowInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})],
    disableMobile: "true"
  });
}

export { initFlatpickr };
