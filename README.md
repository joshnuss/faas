# FaaS - Function as a service

This is a very naive implementation of a multi node faas, just for learnings sake :)

An Elixir web app is used to store and coordinate the execution of JavaScript code. It has a REST frontend, and Postgres backend.

## Setup

```bash
hub clone joshnuss/faas
cd faas
(cd core && mix ecto.create && mix ecto.migrate)
(cd web && mix deps.get && mix compile)
(cd worker && mix deps.get && mix compile && yarn)
```

## Running in development

### Starting the web server

```bash
cd web && mix phx.server
```

### Starting a cluster of workers

```bash
cd worker
mix start &
mix start &
mix start &
mix start &
```

## Usage

### Deploying a function

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

### Calling a function

Call the `helloWorld` function with `params: ["Josh"]`.

```bash
curl -X POST localhost:4000/helloWorld \
  -H "Content-Type: application/json" \
  --data-binary '{"params": ["Josh"]}'
```

# License

MIT
