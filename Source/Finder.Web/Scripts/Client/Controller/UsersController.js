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

    $scope.showRegisterForm = true;

    $scope.showSucess = false;

    $scope.SubmitUser = function()
    {
        $scope.showError = false;
        $scope.showUserError = false;

        if (!$scope.Validate()) {

            $scope.createButtonDisable = false;
            return;
        }

        $scope.WriterUserToDB();

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

    $scope.WriterUserToDB = function()
    {
        $http(
            {
                method: 'POST',
                url: UrlService.forApi('Authentication'),
                data: JSON.stringify($scope.user)
            }).then(
            function success(response)
            {
                $scope.showRegisterForm = false;
                $scope.showSucess = true;
            },
            function error(response) {
                $scope.showUserError = true;
            });
    }

    $scope.CheckUser = function()
    {
        $http(
            {
                method: 'GET',
                url: UrlService.forApi('Authentication'),
                data: JSON.stringify($scope.user)
            }).then(
            function success(response)
            {
                console.log("YEAH");
            },
            function error(response) {
                console.log("NOPE");
            });
    }

}