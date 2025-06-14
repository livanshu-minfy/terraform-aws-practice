# assignment-01-s3-static-website

I have created a remote backend in backend.tf in which I have added  key = "assignment-1/terraform.tfstate" due to which .tfstate file goes to an s3 bucket created earlier named "livanshu-terraform-state-1210"

![Screenshot 2025-06-14 001527](https://github.com/user-attachments/assets/1932d12a-2cf3-4b68-bba3-db31f5199d2a)

I ran the code and it ran successfully and the .tfstate went to remote backend and the static website can be seen in the differnet s3 bucket named "minfy-training-livanshu-s3-3451"

![Screenshot 2025-06-14 001505](https://github.com/user-attachments/assets/bd3c00af-ba8c-460d-afe8-f507460f9d81)

result when i open website endpoint in http-->

![Screenshot 2025-06-14 002446](https://github.com/user-attachments/assets/7ea5ab74-7b9e-4269-b040-49db982495d0)

## _------process------_

**terraform init**->

![Screenshot 2025-06-13 143847](https://github.com/user-attachments/assets/faa3b948-6e07-4142-bdc4-2420a4cc15a7)

after terraform init i have done **terraform plan** -->

![Screenshot 2025-06-14 003116](https://github.com/user-attachments/assets/0f28031e-ad41-4f40-b24b-261f30f710de)

the next step was **terraform apply** to apply all the changes in terraform cloud -->

![Screenshot 2025-06-14 003147](https://github.com/user-attachments/assets/616582a9-b262-4f81-8c5f-59dfcbe3defc)
![Screenshot 2025-06-14 003202](https://github.com/user-attachments/assets/63b1f490-5ca3-4844-98c2-1bb6b169f231)

and after this the last and most important step **terraform destroy** to destroy all the things that we created in terraform apply-->

![Screenshot 2025-06-14 003220](https://github.com/user-attachments/assets/bb5d6994-ec50-4d0f-b45a-10559fc97893)
![Screenshot 2025-06-14 003228](https://github.com/user-attachments/assets/10f47f3b-4801-47a0-b9a1-d03380be5f7c)
