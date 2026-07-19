# Cross-Cloud-Backup

@app.blob_trigger(
    arg_name="myblob",
    path="raw-inputs/{name}",
    connection="AzureWebJobsStorage"
)
def BlobUploadTrigger(myblob: func.InputStream):

    logging.info("===================================")
    logging.info("BLOB TRIGGER FIRED")
    logging.info(f"Blob Name: {myblob.name}")
    logging.info(f"Blob Size: {myblob.length}")
    logging.info("===================================")
