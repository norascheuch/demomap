// if ('querySelector' in document &&
//   'addEventListener' in window) {

//   var toggleButtons = document.querySelectorAll('.toggle-content');
//   var fullTextWrappers = document.querySelectorAll('.fulltext');
//   var fullText;
//   var toggleButtonText;


//   [].forEach.call(fullTextWrappers, function(fullTextWrapper) {
//     // hide all full text on load
//     fullTextWrapper.setAttribute('hidden', true);
//   });

//   [].forEach.call(toggleButtons, function(toggleButton) {
//     // show toggle more buttons
//     toggleButton.removeAttribute('hidden');

//     // add listener for each button
//     toggleButton.addEventListener('click', function () {

//       fullTextWrapper = this.parentElement.querySelector('.fulltext');
//       toggleButtonText = this.querySelector('.text');

//       // change attributes and text if full text is shown/hidden
//       if (!fullTextWrapper.hasAttribute('hidden')) {
//         toggleButtonText.innerText = 'Show More';
//         fullTextWrapper.setAttribute('hidden', true);
//         toggleButton.setAttribute('aria-expanded', false);
//       } else {
//         toggleButtonText.innerText = 'Show Less';
//         fullTextWrapper.removeAttribute('hidden');
//         toggleButton.setAttribute('aria-expanded', true);
//       }
//     });
//   });
// }


####

const Utils = {

  addClass: function(element, theClass) {
    element.classList.add(theClass);
  },

  removeClass: function(element, theClass) {
    element.classList.remove(theClass);
  },

  showMore: function(element, excerpt) {
    addEventListener("click", event => {
      const.linkText = event.target.textContent.toLowerCase();
      event.preventDefault();

      if (linkText == "show more") {
      element.textContent = "Show Less";
        this.removeClass(excerpt, "excerpt-hidden");
        this.addClass(excerpt, "excerpt-visible");
      } else {
      element.textContent = "Show more";
        this.removeClass(excerpt, "excerpt-visible");
        this.addClass(excerpt, "excerpt-hidden");
      }
    });
  }
};

const excerptWidget {

  showMore: function(showMoreLinksTarget, excerptTarget) {
  const showMoreLinks = document.querySelectorAll(showMoreLinksTarget);

  showMoreLinks.forEach(function(link) {

  })
  }
};

Utils.showMore(document.querySelector('.js-show-more'), document.querySelector('.js-excerpt'));
