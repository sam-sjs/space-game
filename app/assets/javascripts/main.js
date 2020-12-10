
$(document).ready(function() {
  console.log("jQuery running!");

  const setupSystem = function() {
    const count = parseInt($('#system h2').html().slice(-2, -1)) + 1;
    for(let i = 1; i < count; i++) {
      $(`#planet${i}`).show();
      highlightFuel(`#fuel${i}`, `#planet${i}`);
      highlightSensors(`#sensor${i}`, `#planet${i}`);
    };
    twinkleTwinkle();
  };

  const highlightFuel = function(fuelId, planetId) {
    const fuel = $(fuelId).html();
    if(fuel.substring(0, 4) === 'He-3') {
        $(fuelId).css('color', '#77DD77');
        $(`${planetId} .collect`).show();
    } else if(fuel === 'Helium-3 Available') {
        $(fuelId).css('color', '#779ECB');
        $(`${planetId} .mine`).show();
    } else if(fuel === 'No Helium-3 deposits found') {
        $(fuelId).css('color', '#FE6B64');
    };
  };

  const highlightSensors = function(sensorId, planetId) {
    const sensor = $(sensorId).html();
    switch(sensor) {
      case 'Point of interest investigated':
        $(sensorId).css('color', '#779ECB');
        break;
      case 'Point of interst found':
        $(sensorId).css('color', '#77DD77');
        $(`${planetId} .investigate`).show();
        break;
      case 'Nothing of note':
        $(sensorId).css('color', '#FDFD98');
        break;
    };
  };

  const showPlanets = function(planetId) {
    $(planetId).show();
  };

  const twinkleTwinkle = function() {
    //Makes for twinkly stars...tried to format the code nicer but what the hell...
    for (let i = 0; i < 250; i++) {
      const star =
      '<div class="star" style="animation: twinkle ' + ((Math.random() * 2) + 2)+'s linear ' + ((Math.random() * 1)) + 's infinite; top: ' + Math.random() * $(window).height() + 'px; left: ' + Math.random() * $(window).width() + 'px;"></div>';
      $('#page_container').append(star);
    };
  }

  setupSystem();
})
