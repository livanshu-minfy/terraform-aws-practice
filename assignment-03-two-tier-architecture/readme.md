# assignment-03-two-tier-architecture

the goal of this assignment was to combine all my skills to build a more realistic application architecture. I have to provision a VPC with a public subnet
for a web server and a private subnet for a database, learning about network segmentation and security group rules.

I was not able to do this because we need to create an RDS instance according to the Assignment instructions given by Sai but we need to create a subnet group for it.
Unfortunately we dont have access to it. -- this was also confirmed by Sai in teams

![image](https://github.com/user-attachments/assets/4cd43526-6f5e-4ad1-905d-279f489bb7cd)

_But I am writing the main key points or better say the learnings that I came to know of while writing tf files for this assignment_

 1. Learned how to isolate web and DB layers for better security — web should be in public, DB should be in private subnet.
 2. private subnets need a NAT Gateway for outbound internet.
 3. Configured DB to only allow access from the web server's security group
