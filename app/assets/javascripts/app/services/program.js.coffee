@app.factory "Program", ["$resource", ($resource)->
  $resource(
    "/api/programs/:id",
    {id: "@id", format: 'json'},
    {
      create:         { method: 'POST' },
      index:          { method: 'GET', isArray: true },
      show:           { method: 'GET', isArray: false },
      update:         { method: 'PUT' },
      destroy:        { method: 'DELETE' }
    }
  )
]
