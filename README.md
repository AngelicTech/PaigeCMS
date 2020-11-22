# P@igeCMS

P@igeCMS is a website CMS/Blogging platform written in [Embarcadero
Delphi](https://www.embarcadero.com/products/delphi).


## 3rd Party Components/Libraries

P@igeCMS utilizes a combination of the following 3rd party products:

* [AtoZed  IntraWeb 15](https://www.atozed.com/intraweb/)
* [DevArt's UniDAC](https://www.devart.com/unidac/)
* [Developer Express VCL Components](https://www.devexpress.com/products/vcl/)
* [RemObjects Remoting SDK](https://www.remotingsdk.com/ro/default.aspx)
* [RemObjects Data Abstract](https://www.dataabstract.com/da/default.aspx)
* [TMS VCL Security System](https://www.tmssoftware.com/site/tmsvclsecuritysystem.asp)


## Database Server

P@igeCMS currently utilizes FireBird 3 as its database server.
The plan is to eventually allow other DB servers to be utilized.
Other choices are:

* InterBase
* MariaDB
* MSSQL
* MySQL


## Web Servers / App Servers

P@igeCMS will initially be designed to run on Windows servers
utilizing a combination of IIS ISAPI and standalone http.sys services.

A Linux version is planned as well.


## Security

The database tables/fields are encrypted, where necessary, on the fly by
utilizing UniDAC's encryption capabilities.

The backend administration utilities are designed as desktop
applications to help minimize security risks / unauthorized logins.
It will be possible to run them as web applications utilizing
virtualization technologies.


## Images

Most images were created using [Axialis  IconGenerator](https://www.axialis.com/icongenerator/)
and their excellent  [Office Pro 2019 Vector Icon Sets](https://www.axialis.com/icongenerator/stock-icons/office-pro/)
