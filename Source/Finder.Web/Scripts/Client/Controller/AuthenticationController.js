var app = angular.module('FinderApp');

app.controller("AuthenticationController", AuthenticationController);

AuthenticationController.$inject = ["$scope", "$http", "UrlService"];

function AuthenticationController($scope, $http, UrlService) {

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

    $scope.showPasswortAlert = false;

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
        $scope.showPasswortAlert = false;
        var url = UrlService.forRoot('#!/User');
        $http(
            {
                method: 'PATCH',
                url: UrlService.forApi('Authentication'),
                data: JSON.stringify($scope.user)
            }).then(
            function success(response)
            {
                sessionStorage.loggedInUser = $scope.user.userName;
                window.location.replace(url);
            },
            function error(response) {
                $scope.showPasswortAlert = true;

                $scope.user = {
                    userName: null,
                    firstName: null,
                    lastName: null,
                    eMail: null,
                    password: null
                };
            });
    }

}