/* If you're feeling fancy you can add interactivity 
    to your site with Javascript */

// prints "hi" in the browser's dev tools console

(() => {
  const application = Stimulus.Application.start();
  application.register(
    "reader",
    class extends Stimulus.Controller {
      initialize() {
        this.data.current = 0;
      }

      rotate() {
        let next = (parseInt(this.data.current) + 1) % this.options().length;
        this.data.current = next;
        this.element.classList.remove(...this.options());
        this.element.classList.add(this.options()[this.data.current]);
      }

      options() {
        return ["light", "sepia", "dark"];
      }
    }
  );
})();
