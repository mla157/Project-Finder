var app = angular.module('FinderApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.controller("MovieController", MovieController);

MovieController.$inject = ["$scope", "$http", "UrlService"];

function MovieController($scope, $http, UrlService)
{
    $scope.status = 'Please wait';

    $scope.getExampleText = function()
    {
        $http.get(UrlService.forApi('Movie')).then(function(response)
        {
            if (!response.data)
            {
                alert('Something went wrong!');
            }

            $scope.testMovie = response.data;
        {
            alert('Error!');
        });
    };

    $scope.getExampleText();
}