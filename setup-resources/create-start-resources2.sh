# To use the Microsoft Learn Sandbox in the training module
# https://learn.microsoft.com/training/modules/automatic-update-of-a-webapp-using-azure-functions-and-signalr
# To run: sign in to Azure CLI with `az login`
#
# bash create-start-resources.sh "SUBSCRIPTION_NAME_OR_ID"
#


set -e

NODE_ENV_FILE="./.env"

STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=signalrbea55dd3f5;AccountKey=YBQkDkPXOWvRcv+qERj6cZEpqhMOdwAEWFsaN+Vxe2RIGvTdQPzNxiFaZm4adeTox8dsuNQxEllH+AStTRnWYQ==;BlobEndpoint=https://signalrbea55dd3f5.blob.core.windows.net/;FileEndpoint=https://signalrbea55dd3f5.file.core.windows.net/;QueueEndpoint=https://signalrbea55dd3f5.queue.core.windows.net/;TableEndpoint=https://signalrbea55dd3f5.table.core.windows.net/"


COSMOSDB_ACCOUNT_NAME="signalr-cosmos-8e1bf691e7"


COSMOSDB_CONNECTION_STRING="AccountEndpoint=https://signalr-cosmos-8e1bf691e7.documents.azure.com:443/;AccountKey=1kTHGNKwBrwi4KOSZHkvnOlLFXGk7Q2IUqUrMIuqWbfWtr5gQof4uCN1H6f49zVZLvnKjtSjMMYtACDbBjewug==;"


# create a .env file with the connection strings and keys
cat >> $NODE_ENV_FILE <<EOF2
STORAGE_CONNECTION_STRING=$STORAGE_CONNECTION_STRING
COSMOSDB_CONNECTION_STRING=$COSMOSDB_CONNECTION_STRING
EOF2

# put resource group name in .env file
echo -e "RESOURCE_GROUP_NAME=$RESOURCE_GROUP_NAME" >> $NODE_ENV_FILE
printf "\n\nRESOURCE_GROUP_NAME=$RESOURCE_GROUP_NAME"


# Validate the .env file
if [ -f "$NODE_ENV_FILE" ]; then
  printf "\n\nThe .env file was created successfully."
else
  printf "\n\nThe .env file was not created."
fi