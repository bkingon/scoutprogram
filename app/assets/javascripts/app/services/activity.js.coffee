@app.factory "Activity", ["$resource", ($resource)->
  $resource(
    "/api/programs/:program_id/activities/:id",
    # {
    #   id:           "@id",
    #   program_id: "@program_id",
    #   format:       'json'
    # },
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
