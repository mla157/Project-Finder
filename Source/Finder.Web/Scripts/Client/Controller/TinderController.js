var app = angular.module('FinderApp');

app.controller("TinderController", TinderController);

TinderController.$inject = ["$scope", "$http", "UrlService"];

function TinderController($scope, $http, UrlService) {
    $(document).ready(function ()
    {
        if (sessionStorage.loggedInUser !== "")
        {
            $.notify({
                // options
                icon: 'glyphicon glyphicon-thumbs-up',
                message: 'Zum liken des Films nach rechts wischen'
            }, {
                // settings
                type: 'info',
                offset: {
                    x: 50,
                    y: 80
                }
            });
            $.notify({
                // options
                icon: 'glyphicon glyphicon-thumbs-down',
                message: 'Bei Nichtgefallen nach links wischen'
            }, {
                // settings
                type: 'info',
                offset: {
                    x: 50,
                    y: 80
                }
            });            
        }

        $scope.showError = false;
        $scope.showAlert = true;

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

                        $scope.showAlert = false;

                        Tindercardsjs.render(cards, $('#main'), function (event)
                        {
                            console.log('Swiped ' + event.direction + ', cardid is ' + event.cardid + ' and target is:');
                            console.log(event.card);

                            console.log($scope.showMovieWasAdded);

                            if (event.direction === "right" && sessionStorage.loggedInUser !== "")
                            {
                                $scope.playlist = {
                                    username: null,
                                    movieID: null
                                };

                                $scope.playlist.username = sessionStorage.loggedInUser;
                                $scope.playlist.movieID = +event.cardid + 1;

                                $http(
                                    {
                                        method: 'Patch',
                                        url: UrlService.forApi('Playlists'),
                                        data: $scope.playlist
                                    }).then(
                                    function success(response)
                                    {
                                        $.notify({
                                            // options
                                            icon: 'glyphicon glyphicon-ok',
                                            message: 'Der Film wurde Ihrer persönlichen Watchlist hinzugefügt.'
                                        }, {
                                            // settings
                                                type: 'success',
                                                offset: {
                                                    x: 50,
                                                    y: 80
                                                }
                                        });
                                    },
                                    function error(response) {
                                        $.notify({
                                            // options
                                            icon: 'glyphicon glyphicon-remove',
                                            message: 'Film bereits in Ihrer Watchlist.'
                                        }, {
                                            // settings
                                            type: 'warning',
                                            offset: {
                                                x: 50,
                                                y: 80
                                            }
                                        });
                                    });
                            }
                        });
                    }
                },
                function error(response) {
                    $scope.showAlert = false;
                    $scope.showError = true;
            });

    });

}