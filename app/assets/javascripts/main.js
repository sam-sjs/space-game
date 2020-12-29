// $(document).ready(function() {

  Vue.component('nav-links', {
    props: ['position', 'previous'],
    // data: function() {
    //   return {
    //     top: 'A',
    //     bottom: '',
    //     left: '',
    //     right: '',
    //     requestDone: false
    //   }; // return
    // }, // data()
    // Is mounted() firing after every POST from navClick resulting in double requests?
    methods: {
      navClick: function(previous) {
        console.log('Navigation Clicked! Direction: ', previous);
        $.post('/systems', {prev_loc: previous})
        .done(function(data) {
          console.log('Current System Id: ', data.redirectId);
          myApp.currentSystem = data.systemName;
          myApp.top = data.sysBelow;
          myApp.bottom = data.sysAbove;
          myApp.left = data.sysRight;
          myApp.right = data.sysLeft;
          myApp.requestDone = true;
          console.log(myApp);
        })
        .fail(console.warn);
      } // navClick()
      // surroundingSystem: function(position) {
      //   const directions = {'top': this.top, 'bottom': this.bottom, 'left': this.left, 'right': this.right};
      //   return directions[position];
      // },
    }, // methods{}
    template: `
      <div @click="navClick(previous)" class="nav_links" :id="position+'_nav'">
        <div class="direction_guides" :id="position+'_guide'">{{top}}</div>
      </div>
    `
  }); // end nav-links component


    const myApp = new Vue({
      el: '#app',
      data: {
        currentSystem: '',
        top: '',
        bottom: '',
        left: '',
        right: '',
        requestDone: false
      }, // data{}
      created: function() {
        $.getJSON('/systems')
        .done(function(data) {
          this.currentSystem = data.systemName;
          this.top = data.sysBelow;
          this.bottom = data.sysAbove;
          this.left = data.sysRight;
          this.right = data.sysLeft;
          this.requestDone = true;
          console.log(this);
        }) // .done()
        .fail(console.warn);
      }, // mounted{}
    }); // new Vue()

// }); // document.ready()

//
// $(document).ready(function() {
//   console.log("jQuery running!");
//
//   // const setupSystem = function() {
//   //   const count = parseInt($('#system h2').html().slice(-2, -1)) + 1;
//   //   for(let i = 1; i < count; i++) {
//   //     $(`#planet${i}`).show();
//   //     highlightFuel(`#fuel${i}`, `#planet${i}`);
//   //     highlightSensors(`#sensor${i}`, `#planet${i}`);
//   //   };
//   //   if($('#crystals').find('>img').length) {
//   //     $('#crystal_container').show();
//   //   };
//   //   twinkleTwinkle();
//   // };
//
//   const highlightFuel = function(fuelId, planetId) {
//     const fuel = $(fuelId).html();
//     if(fuel.substring(0, 4) === 'He-3') {
//         $(fuelId).css('color', '#77DD77');
//         $(`${planetId} .collect`).show();
//     } else if(fuel === 'Helium-3 Available') {
//         $(fuelId).css('color', '#779ECB');
//         $(`${planetId} .mine_container`).show();
//     } else if(fuel === 'No Helium-3 deposits found') {
//         $(fuelId).css('color', '#FE6B64');
//     };
//   };
//
//   const highlightSensors = function(sensorId, planetId) {
//     const sensor = $(sensorId).html();
//     switch(sensor) {
//       case 'Point of interest investigated':
//         $(sensorId).css('color', '#779ECB');
//         break;
//       case 'Point of interst found':
//         $(sensorId).css('color', '#77DD77');
//         $(`${planetId} .investigate_container`).show();
//         break;
//       case 'Nothing of note':
//         $(sensorId).css('color', '#FDFD98');
//         break;
//     };
//   };
//
//   const twinkleTwinkle = function() {
//     //Makes for twinkly stars...tried to format the code nicer but what the hell...
//     for (let i = 0; i < 250; i++) {
//       const star =
//       '<div class="star" style="animation: twinkle ' +
//       ((Math.random() * 2) + 2)+'s linear ' +
//       ((Math.random() * 1)) + 's infinite; top: ' +
//       Math.random() * $(window).height() + 'px; left: ' +
//       Math.random() * $(window).width() + 'px;"></div>';
//       $('#page_container').append(star);
//     };
//   }
//
//   // setupSystem();
// })
