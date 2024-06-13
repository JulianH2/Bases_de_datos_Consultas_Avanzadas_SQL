-- Crear base de datos Ventas 
create database bdventas;

-- Acceder a la base de datos Ventas 
use bdventas;

-- Crear tabla clientes 
create table Cliente(
    ClienteId int not null identity(1,1),
    RFC varchar(20) not null,
    CURP varchar(18) not null,
    Nombres varchar(50) not null,
    Apellido1 varchar(50) not null,
    Apellido2 varchar(50) not null,
    constraint pk_Cliente_cliente primary key (ClienteId),
    constraint unico_Cliente_rfc unique(RFC),
    constraint unico_Cliente_curp unique (CURP)
);

-- Crear tabla contacto_proveedor 
create table ContactoProveedor(
    ContactoId int not null identity(1,1),
    Proveedorid int not null,
    Nombres varchar(50) not null,
    Apellido1 varchar(50) not null,
    Apellido2 varchar(50) not null,
    constraint pk_contactoProveedor primary key (ContactoId)
);

-- Crear tabla proveedor 
create table Proveedor(
    ProveedorId int not null identity(1,1),
    nombreEmpresa varchar(50) not null,
    RFC varchar(20) not null,
    Calle varchar(50) not null,
    Colonia varchar(50) not null,
    CP varchar(50) not null,
    Paginaweb varchar(50) not null,
    constraint unico_Proveedor_rfc2 unique (rfc),
    constraint unico_Proveedor_nombreEmpresa unique (nombreEmpresa),
    constraint pk_proveedor primary key (ProveedorId)
);

-- modificar tabla Contacto Proveedor
alter table ContactoProveedor add constraint fk_ContactoProveedor_Proveedor foreign key (Proveedorid) references Proveedor(Proveedorid) 

-- Tabla empleado
create table Empleado (
    EmpleadoId int identity(1,1) not null,
    Nombre varchar(50) not null,
    Apellido1 varchar(50) not null,
    Apellido2 varchar(50) not null,
    Salario money not null,
    NumeroNomina int not null,
    CURP varchar(18) not null,
    RFC varchar(20) not null,
    calle varchar(50) not null,
    numeroExterno int,
	constraint unico_Empleado_rfc3 unique (rfc),
    constraint unico_Empleado_curp2 unique (CURP),
    constraint unico_Empleado_numeroNomina unique (NumeroNomina),
    constraint pk_Empleado primary key (EmpleadoId),
	constraint chk_Empleado_salario check (Salario>0.0 and Salario<=100000)
	-- check (Salario between 0.1 and 100000)
);

-- Tabla Telefono del Proveedor
create table TelefonoProveedor(
	TelefonoID int not null, 
	ProveedorId int not null, 
	numeroTelefono varchar(15),
	constraint pk_TelefonoProveedor primary key (TelefonoID,ProveedorId),
	constraint fk_TelefonoProveedor_provedorId_Proveedor foreign key (ProveedorId) references Proveedor(ProveedorId) 
	on delete cascade
	on update cascade
);


-- Tabla producto
create table Producto (
    NumeroControl int identity(1,1),
    Descripcion varchar(50),
    Precio money not null,
    [Status] int not null,
    Existencia int not null,
    Proveedorid int not null,
	constraint pk_Producto_NumeroControl  primary key (NumeroControl),
	constraint unico_Producto_Descripcion unique (Descripcion),
	constraint chk_Producto_Precioo check(Precio between 0.1 and 200000),
	constraint chk_Producto_Status check([Status] = 1 or [Status] =0),
	constraint chk_Producto_Existencia check(Existencia>=0),
    foreign key (ProveedorId) references Proveedor(ProveedorId)
);

-- Tabla de Orden Compra
create table OrdenCompra (
	numeroOrden int not null identity(1,1),
	fechaCompra date not null,
	fechaEntrega date not null, 
	ClienteId int  not null,
	EmpleadoId int not null,
	constraint pk_OrdenCompra_numeroOrden  primary key (numeroOrden),
	constraint fk_OrdenCompra_Cliente foreign key (ClienteId) references Cliente(ClienteId), 
	constraint fk_OrdenCompra_Empleado foreign key (EmpleadoId) references Empleado(EmpleadoId) 
);

-- Tabla detalles de compra
create table DetalleCompra (
    ProductoId int not null,
    numeroOrden int not null,
    cantidad int not null,
    preciocompra money not null,
   constraint pk_DetalleCompra_DetalleCompra  primary key (ProductoId,numeroOrden),
   constraint fk_DetalleCompra_numeroOrden foreign key (numeroOrden) references OrdenCompra(numeroOrden) ,
   constraint fk_DetalleCompra_Producto foreign key (ProductoId) references Producto(NumeroControl) 
);
