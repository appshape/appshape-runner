# AppShape Runner

### Running tests

```
./script/test.sh
```

### Request responses on Amazon S3

All requests's bodies are uploaded to Amazon S3 for debugging purposes. 
They are automatically deleted after 14 days via S3 expiring mechanism.
This needs to be manually enabled for each bucket in the `Lifecycle` section
 