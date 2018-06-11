﻿var app = angular.module('FinderApp');

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
        
    }

    $scope.checkIfUserLoggedIn();
}