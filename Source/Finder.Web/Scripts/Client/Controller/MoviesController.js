var app = angular.module('FinderApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.controller("MoviesController", MoviesController);

MoviesController.$inject = ["$scope", "$http", "UrlService"];

function MoviesController($scope, $http, UrlService)
{
    $scope.showAlert = false;
    $scope.showError = false;

    $scope.movie = {
        titleName: null,
        description: null,
        releaseDate: null
    };

    $scope.getMovie = function(genre)
    {
        console.log(genre);
        $scope.showAlert = true;
        $scope.showMovie = false;

        $http(
            {
                method: 'GET',
                url: UrlService.forApi('Movies') +"?genre="+genre
            }).then(
            function success(response) {
                $scope.movie = response.data;
                $scope.showAlert = false;
                $scope.showMovie = true;
            },
            function error(response)
            {
                $scope.showError = true;
                $scope.showAlert = false;
            });
    };
};