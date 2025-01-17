#! /usr/bin/sh

# Create workspace

echo "Create an Azure Machine Learning workspace:"
az ml workspace create --name "mlw-dp100-labs" -g "DP-100"

# Create compute instance
guid=$(cat /proc/sys/kernel/random/uuid)
suffix=${guid//[-]/}
suffix=${suffix:0:18}

ComputeName="ci${suffix}"

echo "Creating a compute instance with name: " $ComputeName
az ml compute create --name ${ComputeName} --size STANDARD_DS3_V2 --type ComputeInstance -w mlw-dp100-labs -g "DP-100"
