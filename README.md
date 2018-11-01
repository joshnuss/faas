# FAAS - Function as a service

This is a very naive implementation of a multi node faas, just for learnings sake :)

Elixir is used as coordinator to run JavaScript code.

## Setup

```bash
hub clone joshnuss/faas
cd faas
(cd core && mix ecto.create && mix ecto.migrate)
(cd web && mix deps.get && mix compile)
```

## Running in development

### Starting the web server

```bash
cd web && mix phx.server
```

### Starting cluster of workers

```bash
cd worker
mix start &
mix start &
mix start &
mix start &
```

## Usage

### Deploying functions

Deploy a JS function to convert `name` into `"Hello ${name}!"`

```bash
curl -X POST localhost:4000/$ \
  -H 'Content-Type: application/json' \
  --data-binary '{"name": "helloWorld", "code": "module.exports = (name) => `Hello ${name}!`"}'

```

### Listing all functions

```bash
curl localhost:4000/$
```

### Calling functions

Call the `helloWorld` function with `params: ["Josh"]`.

```bash
curl -X POST localhost:4000/helloWorld \
  -H "Content-Type: application/json" \
  --data-binary '{"params": ["Josh"]}'
```

# License

MIT
