# terraform-basics

How to install terraform ?
```
    $ sudo yum install -y yum-utils
    $ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    $ sudo yum -y install terraform

```

### Current verison of terraform is v1.9.5 

    $ terraform -v  

### Provider vs Terraform version.

Terraform version : This is the tool version
Provider version  : This is the software version of the cloud provider and based on the selected provider version we might see different options.  We typically go with latest. 


### When you make a place, you can see these symbols and here are the meanings of it :

```
    +   : creates resource 
    -   : deletes resource
    -/+ : delete and recreate the resources
    ~   : something is changing in the existing resources 
```


### terraform installation instructions 



# terraform-basics

How to install terraform ?
```
    $ sudo yum install -y yum-utils
    $ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    $ sudo yum -y install terraform

```

### Current verison of terraform is v1.9.5 

    $ terraform -v  

### Provider vs Terraform version.

Terraform version : This is the tool version
Provider version  : This is the software version of the cloud provider and based on the selected provider version we might see different options.  We typically go with latest. 


### When you make a place, you can see these symbols and here are the meanings of it :

```
    +   : creates resource 
    -   : deletes resource
    -/+ : delete and recreate the resources
    ~   : something is changing in the existing resources 
```

## What terraform init is going to do ?

    1) Terraform is going download all the needed plugins that are needed in the code
    2) ?
    3) ?


### What plan does ?

Plan is going to show what code is going to do wrt what is already there in the AWS Account, based on this you're going to either apply or deny or tune it as per your need. 



### AWS IAM ( Identity & Access Management )
    1) This service in AWS helps humans to authenticate to aws 
    2) helps machines / bots authenticate to AWS 
    3) This defines authorization using something called ROLES

URL: https://355449129696.signin.aws.amazon.com/console
2048

b58-mike
P@ssw0rd12789

### How can we access AWS ?
    1) UI  : with userName and password 
    2) CLI : accessKey & secretKey  ( This quite harmful if used incorrectly : 99.999% of the times, usage of keys is strictly prohibited )


### How can we use the keys and authenticate to cloud ?
    1) Download the keys 
    2) And export them on your linux server 
    3) That's it, you're authenticated to AWS Cloud and from that time, you can access your account on AWS Cloud. 
    4) !!!! Keep in mind, these are server where a bunch of people in your org has access to and anyone can see your ACCESS & SECRET KEY ( which no one wants )

### It awalys goes with Least Privilege Principle to achieve Zero Trust Policy !!!!!


Keep in mind, one service in AWS cannot authenticate & authorize to other AWS service by default.

    That means, AWS EC2 instance by default cannot create other aws ec2 instance or route53 record.


### How to create IAM Role and attach it for an EC2 instance ?

    1) IAM Roles are to enable authentication and authorization between services in AWS and services outside the AWS as well.
    2) Create an IAM Roles saying that EC2 would like to do some actions 
    3) Assign Admin access to teh Role 
    4) Now attch this IAM Role to the EC2 instance and from them this EC2 instance is having admin access on the IAM account of AWS.
    5) This way, we don't have to download/export/rotate the plain-text keys. 


### Arguments vs Attributes in terraform 

    Arguments: These are the inputs that helps in creating the infrastructure with the properties of your choice 

                ex: instance_type, ami, security_group to use 

    Attributes: These are the properties of the infra that comes up post the creation of infrastructure.

                ex: instance_id, private_ip, volume_id 


### Rule Of Thumb when dealing terraform :  

    1) When you're creating infrastructure, make sure you deal end-to-end with terraform only 
    2) Manual changes on the console is 100% not encouraged 
    3) If you do some changes on the infra provisioned or managed by terraform, terraform is going to wipe those manual changes when the next run of terraform apply happens.

### When you run terraform apply, is terraform going to create or update or destroy & create my infrastructure ?

    1) It depends on the changes that you made on the code or on the infrastructure. 
    2) If you just update the tags , it just replaces without any downtime or interruption
    3) If you change the instance type, system goes down , updates the instance_type and starts the instance 
    4) If you change the AMI, then it's like destrying and creating the instance.



### How to scale any instance vertically ? 

> Veritcal means adding resources to the same resource 
    1) If you want to change the instance type, we need to turn off the instance 
    2) Select the instance ----> Actions ----> Instance Type ----> Change the isntance the type 
    3) Now start the isntance. 
    4) In none of the clouds, vertical scaling is not possible without downtime.


### Terraform commands 
    
    ```
        $ terraform init                    ( This will intialize the plugins needed for the code ) 
        $ terraform plan                    ( This will show what it's going to create/update/delete the infra based on the code vs what we have on the cloud )
        $ terraform apply -auto-approve     ( This is going to apply the changes shown on the plan, if applied immediately )

    ```

OR 

Saving the terraform plan locally and applying it, this guarantees the same apply of the plan

    ```
        $ terraform init 
        $ terraform plan -out=plan.out 
        $ terraform apply plan.out 
    ```

### Terraform init and what all it can do ?

    1) It can initialize the backend 
    2) Initializes the modules  ( if you mention modules in the code )
    3) Initializing provider plugins.


### How to correct the style or format automatically in terraform 

```
        $ terraform fmt --recursive 
```


### In case if you encouter no space left error on /home then follow the process enclosed here:
```
    https://github.com/CodingManoj/rhel9-tools/blob/main/GOCD/error.md
```


### Supported Datatypes In Terraform 

```
    # 1) Numbers 
    # 2) Boolents 
    # 3) Strings        ( Only true false and yes no are not supported )

```

### Variable types : 

```
    1) Dictionary ( key - value pairs )
    2) List       ( key with multiple values )
    3) Map        ( a key with multiple key-values pairs )
```

### When and how to use quotes in terraform ?

```
    1) Strings are always supposed to be enclosed in double-quotes - "sample" 
    2) Numbers and booleans don't need to be enclosed in strings 
    3) Single quotes are not supported in terraform 
```

### Variable notations, when to use $ and not to use $ :
```
    var.sample    : use this only if this is not in between a set of strings 
    {var.sample}  : use this if your varaible has to be enclosed in a set of strings
```


## What are the files that ends with *.tfvars vs *.tf 

    1) fileName.tf      : files with terraform code 
    2) terraform.tfvars : files with values of the variables.   ( This is the default file )

!!! In terraform, terraform.tfvars is the default file that would be picked by default.

```
    $ terraform init 
    $ terraform plan  --var-file=prod.tfvars 
    $ terraform apply --var-file=prod.tfvars -auto-approve
```

IMP Point : 

    1) Typically values that are common to all the environments are placed on terraform.tfvars 
    2) Values that are environment specific are placed on dev.tfvars or prod.tfvars

### What is *.auto.tfvars ? 

    1) values that are declared in *.auto.tfvars don't have to be mentioned while running tf command and these will be picked by default.


### Functions in terraform 
```
    1) Functions in terraform are supplied by hashicorp 
    2) Each and every function has an aciton 
    3) We cannot make our own functions, we just consume them

    Ref: https://developer.hashicorp.com/terraform/language/functions
```


### Exception handling in terraform 

    1) If you don't declare a key and if you try to use it, it returns a value
    2) We want to make sure, if values are not delcared, we need to pick a default value.
    3) using  `lookup` funciton in terraform we can do efficiently when dealing map variables 


### When we are dealing at scale, `for-each` is going to make things handy and helps in efficient way to organize the code.

```
The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

Ref: https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
```

### For better learning, always ensure these 4 pillars are covered 

```
    1) Conditions             ( This is like a if else condition and it don't offer multiple else condions )
    2) Variables 
    3) Functions 
    4) Loops 
```


### Conditional expressions in terraform 

```
    condition ? true_val : false_val
```

### Typically when we are writing terraform, we need to write this in such a way where the code is so agnoistic to project and it can be ised in any projects.

Modules In Terrraform will helps in writing code dry and the same time reusable. 

Where can I get the modules ?

    1) We can get lot of readyMade modules in `registry.terraform.io` (not much controlled) or   
    2) We can make our own modules    ( More controlled approach )

```
    > In terraform, everything is a module and the folder where you run the terraform commands is root module 
    > Root module:

        Every Terraform configuration has at least one module, known as the root module. The root module is made up of the resources defined in the main working directory's .tf files

    Usage of terraform modules comes with responsibility and sometimes code complications and length.
```


### How are we going to manage modules ?

    1) We will create our own modules on our repository 
    2) We will source them to our code.


### Backend / Child Module vs root module 

    1) root module    : That's the folder or path where we are calling the actual module and here is where we run the terraform commands 
    2) backend module : Actual modules code ( child module : we are going to maintain on a separate repository )


### Passing the info from root-module to backend module 

Rule of thumb, if you're using a variable in root module, that empty variable has to be declared in the child module, before you use and that where the data-transfer will happen. ( that's a way of receiving the data from the root module )

```
    1) Declare the variable in the root module
    2) Define the value for that in the root module
    3) Declare am empty variable with the same name 
    4) Then use it in the backend module

```


### How to retrieve the info from backend to root module ?
    1) We have code in the backend module that creates EC2 and in the root module, we would like to print the print the ip-address of the instance 
    2) This goes by outputs


### Outputs :
    1) Outputs in terraform are not just for printing the information 
    2) They also play a role in transferring the information from one module to other module.


This relation is very inportant while passing the information between the modules :

```
    1) Inputs provided in *.tfvars 
    2) Declare associated empty variables in teh root-module ( vars.tf )
    3) Send the input to the module in the root-module 
    4) Declare the empty varaible in the backend module to get the value from root 
    5) Use the variable in the child module
```


> Terraform Goals to achieve close our problem statements : 
```
    1) EC2 instances should be created & while the instances instances comes up - ansible should be triggered to have the configuation management and this will complete the app to come up.  ( Terraform calling ansible scripts )
    2) Associated DNS Records should be created.
```


### How terraform can read the information about the resources that are already created and these 3 values I don't want to hardcode.

```
    variable "ami" {
    default = "ami-0fcc78c828f981df2"
    }

    variable "vpc_security_group_ids" {
    default = ["sg-08c9eb09595f5de07"] # Please don't copy this, use as per the b58-sg that you've created.
    }

    variable "zone_id" {
    default = "Z05544242107X3QLYUZ0E" # Please don't copy this, use your own zone's hosted id.
    }

```

### Datasource : This helps in extracting the information of the existing resources.
For each and every resource we have datasource available in the terraform documentaiton of the intended resource.


Goal :
1) As a infra provisioning by terraform, I want terraform to call the ansible playbook and this will run the configuration management and this will maje our application with a single a single click of a button. 

### Provsioners 
 These help in doing tasks on the top of the created infrastructure either from the machine where we are running the terraform or on the top of the created infrastructure.

 Majorly provisioners are of 3 types:

    1) Local-exec              ( If you want to run something on the top of the machine where you're running the terraform commands )
    2) Remote-exec             ( If you want to run something on the top of the provisioner infra )
    3) File provisioner        ( To copy something from local to the created instance )
    4) Connection-block        ( This helps in enabling authentication on the created infrastructure from where we are running terraform )

Provisioners by default are run-time, what does it mean ?
    ```
        That means they will only be executed during the creation of the infrastructure.
        Not all the time you run. 

        You can change this behavior that every run should trigger the provisioner, we can use triggers.

    ```

### What are the points that we need to keep in mind when dealing provisioners ?

    1) It's not recommended to keep the provisioners with in the resource.
    2) Due to some factors, if the provisioner fails, terraform considers it as a resource failure and this will recreate the instance, when run the terraform in the next time. 
    3) Prefer to keep it outside the resource block and inside a null_resource ( Becauser provisioners cannot live outside the resource block )
    4) This was, we can control which one to be created first and next ( when certain flows are not organic)



### How to control the order of execution of resources : 
    > frontend, backend , mysql

        1) mysql: this should be created first 
        2) backend: this should be created next to mysql 
        3) frontend: Once everything are operation, then we would like to run the frontend 
    
### Whats next ?

    1) Backend 
    2) Code is not multi-environmental
    3) No UI yet for terraform apply



### How terraform knew that it has to re-create or destroy or create or update the infrastructure when we run terraform apply ?

    1) How terraform is managing the registry or tracking of the infra created by it ( Backend / State )



Goals:
    1) Backend
    2) UI 


### When you do a terraform apply, what exactly is happening ?

    1) Your code will be validated against the stateFile and the infra on AWS.
    2) If there are no changes, tf just refreshes and saying nothing to update.
    3) If there are any any deviations between what is there in the code vs what is there in the stateFile vs the infra on AWS, then those changes will be listed as per the code which is the source of truth, then those changes will be applied.


### What will happen if you lose the stateFile ? 
    1) Terraform lose track of everything and technically it's a mess then. 


### Since the stateFile is quite important,we need to make sure we never lose it.

    So, storing and organizing statefile should have a well defined strategy.

        1) Ensure statefile is never stored locally.
        2) Ensure, then entire team should refer the statefile locally.
        3) Ensure, non2 team members should run the terraform apply at a time, even if they run only one apply be executed. Other should be prompted with a msg saying it's locked. 
        4) Ensure version control is enabled for the statefile. 
        5) And the place where you store your Terraform Statefile is referred as a backend. Based on the cloud provider, Hashicorp supports n number of backends. 

### AWS S3 : Simple Secure Storage ( Both for storing the data & hosting websites )

    1) A Service on AWS to store almost infite amount of storage ( we just need to pay based on the storage you used )
    2) Storage Class: Type of storage and based on this billing would be coming through ( This defines how fast can you retrieve the stored data )
    3) Be mindful when selecting the S3 Bucket Name

    > Funny Incident: A user created a bucket and the bucket was empty and he was billed 1200$
    > https://cybernews.com/news/amazon-bucket-name-can-cause-massive-bill/

Assignment:
    Read S3: https://aws.amazon.com/s3/ 


### Keep in mind, the infra code that you're designing should be multi-environment and should be DRY. 
    >  Dev ----> QA ----> Prod 