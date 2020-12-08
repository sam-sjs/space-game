
$(document).ready(function() {
  console.log("jQuery running!");

  for (let i = 0; i < 100; i++) {
    const star = '<div class="star" style="animation: twinkle ' + ((Math.random() * 5) + 5)+'s linear ' + ((Math.random() * 5) + 5) + 's infinite; top: ' + Math.random() * $(window).height() + 'px; left: ' + Math.random() * $(window).width() + 'px;"></div>'; $('body').append(star);
  }
})
