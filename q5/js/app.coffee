app = angular.module "test", []

app.controller "TreeCtrl", ($scope, $http) ->
  $http.get "/data"
    .success (data) -> $scope.data = data
