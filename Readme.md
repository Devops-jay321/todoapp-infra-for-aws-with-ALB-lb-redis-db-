# After Infra creation login into backend Ec2 machine & Create Db
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install mssql-tools18 -y
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
sqlcmd -?
# login to mssql db as follows
sqlcmd -S mssql-db.cx6q4ie8s17c.ap-south-1.rds.amazonaws.com \
-U Jaydeepc1985 \
-P 'Oneday123#' \
-N -C
CREATE DATABASE tododb;
GO
# Now check database Created or not
SELECT name FROM sys.databases;
GO

## Update Connection String

Edit the `app.py` file to update the `connection_string` variable with the appropriate connection details for your SQL Server database. ODBC wali connection string use karna hai..

Also update "allow_origins=["*"]" with frontend DNS_Name

### Update Frontend Configuration ⚙️

Open the `src/TodoApp.js` file in your frontend project.

Update the Backend URL by replacing the existing line with the following:

```javascript
const API_BASE_URL = 'http://<BackendVM Public IP/DNS_Name>:80/api';