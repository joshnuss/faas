# FAAS - Function as a service

This is a very naive implementation of a multi node faas, just for learnings sake :)

Elixir is used as coordinator to run Node code in sandbox.

## Setup

```bash
hub clone joshnuss/faas
cd faas
cd faas_web && mix deps.get && mix ecto.setup
```

## Running the server

```bash
cd faas_web && mix phx.server
```

## Running multiple workers

```bash
cd faas_worker && mix start &
cd faas_worker && mix start &
cd faas_worker && mix start &
cd faas_worker && mix start &
```

## Deploying functions

Deploy a JS function to convert `name` into `"Hello ${name}!"`

```bash
curl -X POST localhost:4000/$ \
  -H 'Content-Type: application/json'
  --data-binary '{"name": "helloWorld", "code": "module.exports = (name) => `Hello ${name}!`"}'

```

## List all functions

```bash
curl localhost:4000/$
```

## Calling functions

Call the `helloWorld` function with `params: ["Josh"]`.

```bash
curl -X POST localhost:4000/helloWorld \
  -H "Content-Type: application/json" \
  --data-binary '{"params": ["Josh"]}'
```

# License

MIT
