aws cloudformation create-stack \
--template-body file://$1 \
--stack-name $2 \
--parameters file://$3 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
--region=us-west-2
