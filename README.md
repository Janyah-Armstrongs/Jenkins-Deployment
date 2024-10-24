Jenkins Deployment

In the following document I will be showing trail an error while creating a Ec2 instance that installs and start Jenkins while also create an S3 bucket and security group for the instance. For this project i will be using Cloud 9 with terraform installed on the system. 
Let's Get Started!!
Step: 1
Login into your OS and make sure terraform is installed if it isn't you can use the following link to see how to download on your OS https://www.terraform.io/
Step: 2 Creating EC2 instance with user data script

The following is showing how to create an Instance. Tip to find your ami from your region go to AMI Catalog on aws and search Amazon Linux 2 there will be two codes one for x64 and x86 I chose x64.
Closer look at User Data script
Step : 3 Creating your security group
Step : 4 Create S3 Bucket
For this section I did run into an error with the acl The writing above shows the now formatting for the creation to go through but the writing below show the before error and code I had. Although my solution was to just delete the middle coding I had I thought it would be valuable to share.
This code as a whole was stopping my process of Terraform apply.
Step: 4 Testing the code
Run the following commands in your terminal 
Terraform fmt
Terraform Init
Terraform plan
Terraform Apply
After running these codes you should see Apply complete and be able to check on aws to see all that terraform has done
