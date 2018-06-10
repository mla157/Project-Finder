var app = angular.module('FinderApp');

app.controller("UsersController", UsersController);

UsersController.$inject = ["$scope", "$http", "UrlService"];

function UsersController($scope, $http, UrlService) {

    $scope.user = {
        userName: null,
        firstName: null,
        lastName: null,
        eMail: null,
        password :null
    };

    $scope.showError = false;

    $scope.SubmitUser = function()
    {
        $scope.showError = false;

        if ($scope.Validate()) {

            $scope.createButtonDisable = false;
            return;
        }

        console.log($scope.user);
    }

    $scope.Validate = function ()
    {
        var userMailValid = /\S+@\S+\.\S+/.test($scope.user.eMail);

        if ($scope.user.eMail != null) {
            if (!userMailValid)
            {
                $scope.showError = true;
                return false;
            }
        }

        if (pw1.value !== pw2.value)
        {
            $scope.showError = true;
            return false;
        }

        return true;
    }

}