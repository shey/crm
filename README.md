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

### Development Notes

1. database.yml has connection timeout settings to protect the database, ideally settings are used in a production env.

1. Using jsonapi-serializer to produce standardized JSON:API responses which are easier for FE clients to consume.
