const Utils = {

  addClass: function(element, theClass) {
    element.classList.add(theClass);
  },

  removeClass: function(element, theClass) {
    element.classList.remove(theClass);
  },

  readMore: function(element, excerpt) {
    addEventListener("click", event => {
      const linkText = event.target.textContent.toLowerCase();
      event.preventDefault();

      console.log(this);
      if (linkText == "read more") {
      element.textContent = "Read Less";
        this.removeClass(excerpt, "excerpt-hidden");
        this.addClass(excerpt, "excerpt-visible");
      } else {
      element.textContent = "Read More";
        this.removeClass(excerpt, "excerpt-visible");
        this.addClass(excerpt, "excerpt-hidden");
      }
    });
  }
};

const excerptWidget = {
  readMore: function(readMoreLinksTarget, excerptTarget) {
  const readMoreLinks = document.querySelectorAll(readMoreLinksTarget);

  readMoreLinks.forEach(function(link) {
    const excerpt = link.previousElementSibling.querySelector(excerptTarget);
    console.log(link.previousElementSibling);
    Utils.readMore(link,excerpt);
    });
  }
};

excerptWidget.readMore('.js-read-more', '.js-excerpt');
