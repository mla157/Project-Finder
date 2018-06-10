var app = angular.module('FinderApp');

app.controller("TinderController", TinderController);

TinderController.$inject = ["$scope", "$http", "UrlService"];

function TinderController($scope, $http, UrlService) {
    $(document).ready(function () {

        // Define cards
        var cards = [];


            $http(
                {
                    method: 'GET',
                    url: UrlService.forApi('Overview')
                }).then(
                function success(response) {
                    if (response.data)
                    {
                        var counter = 0;
                        for (var i = 0; i < response.data.length; ++i) {
                            var movie = response.data[i];
                            console.log(movie);
                            console.log(movie.imageURL);
                            if (movie.imageUrl == "")
                            {
                                var push = new Tindercardsjs.card(
                                    counter,
                                    movie.titleName,
                                    movie.description,
                                    "");
                            }
                            else
                            {
                                var push = new Tindercardsjs.card(
                                    counter,
                                    movie.titleName,
                                    "",
                                    movie.imageUrl);
                            }
                            cards.push(push);

                            counter++;
                        }
                        Tindercardsjs.render(cards, $('#main'), function (event) {
                            console.log('Swiped ' + event.direction + ', cardid is ' + event.cardid + ' and target is:');
                            console.log(event.card);
                        });
                    }
                },
                function error(response) {
                    $scope.showError = true;
                    $scope.showAlert = false;
            });

    });

}