# crm

Built using **Rails 8.0.2** and **Ruby 3.4.3** and **PostgreSQL 15.12**

## 🚀 Getting Started

To create the database and install any dependencies.

```bash
bin/setup
```

To start the app

```bash
bin/dev
```

The app comes with some seed data. To plant the seeds, run:

```bash
bin/rails db:seed
```

## Application Features

### 📇 Contacts

Each contact includes:

1. An email address

1. A flexible set of tags

## Manual Endpoint testing (and documentation)

### Index action

```bash
 curl localhost:3000/contacts | jq
```

### Get Action

```bash
curl localhost:3000/contacts/1  | jq
```

### Destroy Action

```bash
curl -X DELETE http://localhost:3000/contacts/1
```

### Create Action

```bash
curl -X POST http://localhost:3000/contacts \
  -H "Content-Type: application/json" \
  -d '{
    "contact": {
      "name": "Shey Sewani",
      "email": "shey@shey.ca",
      "tags": ["lead", "priority", "finalized"]
    }
  }'
```

### Update (patch/put)

```bash
curl -X PATCH http://localhost:3000/contacts/7 \
  -H "Content-Type: application/json" \
  -d '{
    "contact": {
      "tags": ["updated", "important"]
    }
  }'
```

### Search (by_tag)

```bash
curl http://localhost:3000/contacts/tag/finalized | jq
```

## 📝 Notes

1. I spent ~30 minutes planning the architecture and approach before starting.

1. Development time was approximately 90 minutes.

1. database.yml includes connection timeout settings to protect the database—these would ideally be tuned per environment in production.

1. Using jsonapi-serializer to produce standardized JSON:API responses that are easier for frontend clients to consume.

1. Using yabeda-rails to expose metrics for Prometheus/Grafana.

1. Metrics are exposed at /i/metrics to separate internal infrastructure endpoints from the public API.

1. Skipped `kamal` and Dockerization to simplify development.

1. Excluded frontend libraries and js entirely to stay focused. If I had the need I would use `esbuild` for asset bundling.

## If I had more time, I’d:

1. Integrate hashid-rails to avoid exposing ids in api responses.

1. Use Swagger tooling to generate API docs.
