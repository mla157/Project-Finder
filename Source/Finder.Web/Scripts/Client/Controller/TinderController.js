var app = angular.module('FinderApp');

app.controller("TinderController", TinderController);

TinderController.$inject = ["$scope", "$http", "UrlService"];

function TinderController($scope, $http, UrlService) {
    $(document).ready(function () {

        // Define cards
        var cards = [
            new Tindercardsjs.card(2, 'Geordi Laforge', 'I like big butts', 'gfx/pics/01.jpg'),
            new Tindercardsjs.card(1, 'Agro Picard', 'Hates Klingons, likes beer.', 'gfx/pics/02.jpg'),
            new Tindercardsjs.card(0, 'Jean-Luc, Worf & William', 'Swipe right if you also like funny hats like us :D', 'gfx/pics/03.jpg')
        ];

        // Render cards
        Tindercardsjs.render(cards, $('#main'), function (event) {
            console.log('Swiped ' + event.direction + ', cardid is ' + event.cardid + ' and target is:');
            console.log(event.card);
        });
    });
}