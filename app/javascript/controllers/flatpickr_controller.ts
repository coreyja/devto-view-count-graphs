import { Turbo } from "@hotwired/turbo-rails"
import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  declare element: HTMLInputElement

  close([startDate, endDate]: [Date, Date]) {
    var searchParams = new URLSearchParams(window.location.search);
    searchParams.set("start_at", startDate.toISOString().split("T")[0]);
    searchParams.set("end_at", endDate.toISOString().split("T")[0]);

    const l = window.location;

    Turbo.visit(`${l.origin}${l.pathname}?${searchParams.toString()}`)
  }
}
