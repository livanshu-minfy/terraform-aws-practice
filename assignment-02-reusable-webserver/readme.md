# assignment-02-reusable-webserver

the goal of this assignment was to learn how to create and use a local Terraform module to promote code reuse and better organization. I have to refactor the 
EC2 web server from sai's lecture into a self-contained, reusable module.
and I was able to successfully do that. 

result when i open website endpoint in http-->

![Screenshot 2025-06-14 024631](https://github.com/user-attachments/assets/e653f7fe-1124-4030-928e-b8a81ac8f446)

## _------process------_

**terraform init**->

![Screenshot 2025-06-14 024757](https://github.com/user-attachments/assets/89e44a12-73f0-406f-88bd-0964b41b9035)

after terraform init i have done **terraform plan** -->

![Screenshot 2025-06-14 024812](https://github.com/user-attachments/assets/0e7ae740-d49a-4deb-9fe0-edc4f8b267a2)
![Screenshot 2025-06-14 024824](https://github.com/user-attachments/assets/d44444c3-eb1c-40e7-abf8-b28727fc9a1a)

the next step was **terraform apply** to apply all the changes in terraform cloud -->

![Screenshot 2025-06-14 024837](https://github.com/user-attachments/assets/f0744b22-5ada-4d4b-8a2d-5d8d51e4e3ca)
![Screenshot 2025-06-14 024859](https://github.com/user-attachments/assets/aac3c249-4465-4265-92e3-9c72bc2eafac)

and after this the last and most important step **terraform destroy** to destroy all the things that we created in terraform apply-->

![Screenshot 2025-06-14 024910](https://github.com/user-attachments/assets/329a6c8a-2166-417d-8082-a44ef4eb9296)
![Screenshot 2025-06-14 024924](https://github.com/user-attachments/assets/f18e1306-2360-4c14-94a0-6a9347f5c0b6)
