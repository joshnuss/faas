# FAAS - Function as a service

A very naive implementation of a multi node faas, just for learnings sake :)

Elixir is used as coordinator, Node.js is used to run code in sandbox.

## Setup

```
hub clone joshnuss/faas
cd faas
cd faas_web && mix deps.get && mix ecto.setup
```

## Running Server

```
cd faas_web && mix phx.server
```

## Running Multiple Workers

```
cd faas_worker && mix start &
cd faas_worker && mix start &
cd faas_worker && mix start &
cd faas_worker && mix start &
```

## Deploying code

```
curl -X POST localhost:4000/$ \
  -H 'Content-Type: application/json'
  --data-binary '{"name": "helloWorld", "code": "module.exports = (name) => `Hello ${name}!`"}'

```

## List all functions

```
curl localhost:4000/$
```

## Calling code

```
curl -X POST localhost:4000/helloWorld -H "Content-Type: application/json" --data-binary '{"params": ["Josh"]}'
```

# License

MIT
