Get-Help ##To get help of anything on PowerShell

##Sample commands

Get-Help *service*

Get-Help *process*

Get-Help Get-Service

Get-Help Get-Process

##Run some sample commands and see the output

Get-Service #List all the services and its status

Get-Process #List all the processes 

Get-Process | Get-Member ##This will show all the properties and methods for get-process

Get-WinEvent -LogName System ##To get the system logs

## To select the required properties

#select-object

Get-Service | Select-Object Name, Status, StartType

##Custom Property
##Name will be replaced with ServiceName in the output
Get-Service | Select-Object @{n='ServiceName';e={$_.Name}}, Status, StartType

##Filter the output
#where-Object
Get-Service *SQL* | where-Object {$_name -like "win"}
Get-Service *SQL* | where-Object {$_name -contains "SQL"}

##Sort the data
#Sort-Object
Get-Process | Sort-Object CPU -Descending | Select-Object ProcessName -First 10

##Other cmdlets which we explored
Show-Command get-service
get-service | out-gridview

##Variables and DataType
$a=10
$b='abc'
$c=10.10
$d=10.66
Write-Host "$a" "$b"
Write-Host $c
Write-Host $d
$c | Get-Member
$e=$true
$f=$false
Write-Host $e, $f
$a.gettype() # To check the data type of a Variable
#To force a datatype
[int]$i=10
[string]$j="Something"
Write-Host $i
Write-Host $j

##Using read-host to get the input from the user
[string]$a= read-host "Enter the service name"
get-service -name $a

#Array -> Store more than one values. It can be same data type or different data type
$a=1,'abc',20,'a'
$a.gettype() # object[] as a Default
$a[0]
$a[1]
$a ##This will print all the data

##Example to hold a sepcific data type in array
[int[]]$b=2,3,5,7,8
$b.gettype()  #-> Int32[]
$b[1]
$b[0]

Write-Host $b

##To add an value to array
$b += 10

Write-Host $b

#Hash Table (Like Key and Value)
$var1 = @{} #declared the variable
$var1.gettype()
$var1.Name='Naveen'
$var1.City='Chennai'
$var1.State='TN'
$var1

$var1.City
$var1['City']

$var2 = @{Name='Naveen';City='Chennai'}
$var2

#To enforece an order 
$var2 = [ordered] @{Name='Naveen';City='Chennai';State='TN'}
$var2

##Reading data from user inputs and how you can write the data###
Read-Host "Enter your name"
[string]$a=Read-Host "Enter your name"

###Different Write options###
write-host "Sample Data"
write-output "Test Data"
write-warning "Nooo!"
write-verbose "This is a verbose message"
write-verbose "This is a verbose message" -Verbose

write-host "hello"
write-host "hello" -nonewline  #-> This will avoid the extra space
write-host "Failed" -ForegroundColor red
write-host "Good" -ForegroundColor green