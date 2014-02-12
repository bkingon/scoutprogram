#= require_self
#= require_tree .


# Create 'app' angular application (module)
@app = angular.module("app", ["ngResource"])

# @app.factory "Activity", ["$resource", ($resource)
#   $resource("/activities/:id", {id: "@id"}, {update: {method: "PUT"}} )
# ]

# @ProgramController = ("$scope" , "Activity", $scope, Activity) ->
#   $scope.activities = Activity.query()
