// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require popper
//= require bootstrap-sprockets

// require jquery
// require jquery_ujs

//= require rails-ujs
//= require activestorage
//= require vegas.min

//= require_tree .

// $(function() {
//     $('.top').slick({
//         dots: true,
//         autoplay: true,
//         autoplaySpeed: 1500,
//     });
// });

/*global $*/
$(function() {
    $('#slider').vegas({
        transition: 'fade2',
        transitionDuration: 2000,
        delay: 5000,
        animationDuration: 20000,
        animation: 'random',
        slides: [
                { src: '/assets/top.jpg'},
                { src: '/assets/top2.jpg'},
                { src: '/assets/top3.jpg'},
                { src: '/assets/top4.jpg'}
            ]
    });
    
    // $('.hoge').slick({
    //     dots: true,
    // });
});

  