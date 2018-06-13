var app = angular.module('FinderApp');

app.controller("UsersController", UsersController);

UsersController.$inject = ["$scope", "$http", "UrlService"];

function UsersController($scope, $http, UrlService)
{
    $scope.user = {
        userName: null,
        firstName: null,
        lastName: null,
        eMail: null,
        password: null
    };

    $scope.movies = [];

    $scope.userSetPreferences = false;

    $scope.checkIfUserLoggedIn = function ()
    {
        if (sessionStorage.loggedInUser !== "" || sessionStorage.loggedInUser === null)
        {
            $http(
                {
                    method: 'GET',
                    url: UrlService.forApi('Authentication') + "?username=" + sessionStorage.loggedInUser
                }).then(
                function success(response)
                {
                    $scope.user = response.data;
                },
                function error(response) {
                    console.log(response.data);
                });
        }
        else
        {
            var url = UrlService.forRoot('#!/Login');
            window.location.replace(url);    
        }
    }

    $scope.checkIfUserHasPreferences = function()
    {
        $http(
            {
                method: 'GET',
                url: UrlService.forApi('Users') + "?username=" + sessionStorage.loggedInUser
            }).then(
            function success(response) {
                $scope.userSetPreferences = true;
            },
            function error(response) {
                console.log("Keine Preferences");
            });
    }


    $scope.getPlaylist = function ()
    {
        $http(
            {
                method: 'GET',
                url: UrlService.forApi('Playlists') + "?username=" + sessionStorage.loggedInUser
            }).then(
            function success(response) {
                if (response.data) {
                    for (var i = 0; i < response.data.length; ++i) {
                        var movie = response.data[i];

                        $scope.movies.push(
                            {
                                titleName: movie.titleName,
                                releaseDate: movie.releaseDate,
                                description: movie.description
                            });
                    }
                }
            },
            function error(response) {
                $scope.showError = true;
                $scope.showAlert = false;
            });
        $scope.showAlert = false;
    };

    $scope.deleteMovieFromPlaylist = function (movie)
    {
        $scope.playlistMovieDeleteItem = {
            username: sessionStorage.loggedInUser,
            movieId : null,
            movieTitle: movie.titleName
        };

        $http(
            {
                method: 'POST',
                url: UrlService.forApi('Playlists'),
                data: JSON.stringify($scope.playlistMovieDeleteItem)
            }).then(
            function success(response)
            {
                $.notify({
                    // options
                    icon: 'glyphicon glyphicon-ok',
                    message: 'Der Film wurde von Ihrer persönlichen Watchlist gelöscht.'
                }, {
                    // settings
                    type: 'success',
                    offset: {
                        x: 50,
                        y: 80
                    }
                });
                $scope.movies = [];
                $scope.getPlaylist();
            },
            function error(response) {
                $.notify({
                    // options
                    icon: 'glyphicon glyphicon-remove',
                    message: 'Der Film konnte nicht gelöscht werden.'
                }, {
                    // settings
                    type: 'error',
                    offset: {
                        x: 50,
                        y: 80
                    }
                });
            });

    };

    $scope.checkIfUserLoggedIn();
    $scope.checkIfUserHasPreferences();
    $scope.getPlaylist();
}