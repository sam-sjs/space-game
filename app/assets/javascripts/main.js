
$(document).ready(function() {
  console.log("jQuery running!");

  const showPlanets = function(planetId) {
    if($(planetId).find('img').length) {
      $(planetId).show();
    } else {
      $(planetId).hide();
    };
  };

  showPlanets('#planet1');
  showPlanets('#planet2');
  showPlanets('#planet3');
  showPlanets('#planet4');



  //Makes for twinkly stars...tried to format the code nicer but what the hell...
  for (let i = 0; i < 250; i++) {
    const star =
    '<div class="star" style="animation: twinkle ' + ((Math.random() * 2) + 2)+'s linear ' + ((Math.random() * 1)) + 's infinite; top: ' + Math.random() * $(window).height() + 'px; left: ' + Math.random() * $(window).width() + 'px;"></div>';
    $('#page_container').append(star);
  };
})
