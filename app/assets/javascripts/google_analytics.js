document.addEventListener('turbolinks:load', function(event) {
  if (typeof gtag === 'function') {
    gtag('config', 'UA-107358166-6', {
      'page_location': event.data.url
    })
  }
});
