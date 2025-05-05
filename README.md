# crm

## Getting started

To create the database and install any dependencies

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

### Contacts

A contact has an email address and multiple tags associated with it.

## Manual Testing

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

## Notes

1. database.yml has connection timeout settings to protect the database, ideally settings are used in a production env.

1. Using jsonapi-serializer to produce standardized JSON:API responses which are easier for FE clients to consume.

1. If I had more time, I’d integrate the hashid-rails gem to so numeric IDs aren't shared in the API responses.
