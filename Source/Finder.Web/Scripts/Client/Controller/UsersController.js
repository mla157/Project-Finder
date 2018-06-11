var app = angular.module('FinderApp');

app.controller("UsersController", UsersController);

UsersController.$inject = ["$scope", "$http", "UrlService"];

function UsersController($scope, $http, UrlService)
{
    $scope.userloggedIn = false;

    $scope.checkIfUserLoggedIn = function()
    {
        $scope.userloggedIn = true;
        console.log($scope.userloggedIn);
    }

    $scope.checkIfUserLoggedIn();
}