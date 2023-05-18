# Copy data from local filesystem to Azure Container

## Pre requirements

### 1. Install azcopy

Download from https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy
Unpack it and copy it in PrgramFiles for example
Add its path in Environment variable PATH
No need restart, mak sure you click OK and close all windows.

### 2. Enable .ps1 to run locally

Run Windows Powershell
Then enable Execution Policy user scope (not global)
>Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

### 3. If you have enabled Ransomware protection

Add Windows PowerShell or your very own script on Enabled apps lits

### 4. Azure Portal tasks

4.1. Create (if you have not) an Azure DataLake gen2 resource
 Select Blob storage
 Create a container
 Createa folder wheer you will copy files from local computer

4.2. Get SAS URL to be used (you need it to be able to access container from local computer) 
Go to your resources you just created
Select from lef [Containers]
Click  on container you created (main window)
Select [Shared Access Key] from right
Set expiration date
Set permissions. I suggets  Read, Write, Create, Add, Delete, List 
Click Generate SAS token and URL button
Copy the URL and paste in a safe place. I suggest to regenerate it from time to time.

### 5. Download the script locally
Update it according to your needs: place where are files and destination

### 6. Schedule it 
If applicable, use task scheduler to run this on regular basis