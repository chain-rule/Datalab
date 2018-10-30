# Datalab

## Usage

Build a custom Datalab image and upload it to Container Registry:

```bash
make build
```

Create an instance in Compute Engine and connect to Datalab:

```bash
make create
```

Stop the instance:

```bash
make stop
```

Connect to Datalab, resuming the instance if needed:

```bash
make connect
```

Connect to the instance via SSH:

```bash
make ssh
```

Delete the instance:

```bash
make delete
```
