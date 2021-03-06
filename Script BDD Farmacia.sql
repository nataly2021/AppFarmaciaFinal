CREATE DATABASE [DBFARMACIA]
Go
USE [DBFARMACIA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afiliacion_Salud](
	[IdSalud] [int] IDENTITY(1,1) NOT NULL,
	[NombreSalud] [varchar](100) NOT NULL,
	[Descuento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSalud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleta_venta](
	[IdBoleta] [int] IDENTITY(1,1) NOT NULL,
	[FechaEmision] [date] NOT NULL,
	[TotalAPagar] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_boleta](
	[IdNrBoleta] [int] NOT NULL,
	[IdMedicamento] [int] NOT NULL,
	[CantidadProductos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNrBoleta] ASC,
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_pedido](
	[IdPedido] [int] NOT NULL,
	[IdMedicamento] [int] NOT NULL,
	[CantidadPedido] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[IdMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[NombreMedicamento] [varchar](100) NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[PrecioUnitarioVenta] [int] NOT NULL,
	[PrecioUnitarioCosto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Compra](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[FechaEmision] [date] NOT NULL,
	[FechaEntrega] [date] NOT NULL,
	[TotalaPagar] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RutProveedor] [varchar](11) NOT NULL,
	[NombreProveedor] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol_Usuario](
	[IdRolUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRolUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[RutUsuario] [varchar](11) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [int] NULL,
	[IdSalud] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Afiliacion_Salud] ON 

INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (1, N'Cruz Blanca', 10)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (2, N'Colmena', 20)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (3, N'Fonasa', 7)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (4, N'ConSalud', 15)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (5, N'Capredena', 50)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (6, N'Banmédica', 30)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (7, N'	Fundación ', 22)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (8, N'	Cruz del Norte', 21)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (9, N'Capredena', 50)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (11, N'	Cruz del Norte', 21)
INSERT [dbo].[Afiliacion_Salud] ([IdSalud], [NombreSalud], [Descuento]) VALUES (12, N'Banmédica', 30)
SET IDENTITY_INSERT [dbo].[Afiliacion_Salud] OFF
GO
SET IDENTITY_INSERT [dbo].[Boleta_venta] ON 

INSERT [dbo].[Boleta_venta] ([IdBoleta], [FechaEmision], [TotalAPagar], [IdUsuario]) VALUES (1, CAST(N'2020-10-10' AS Date), 4000, 2)
INSERT [dbo].[Boleta_venta] ([IdBoleta], [FechaEmision], [TotalAPagar], [IdUsuario]) VALUES (2, CAST(N'2020-10-11' AS Date), 3000, 2)
INSERT [dbo].[Boleta_venta] ([IdBoleta], [FechaEmision], [TotalAPagar], [IdUsuario]) VALUES (3, CAST(N'2020-11-12' AS Date), 500, 2)
SET IDENTITY_INSERT [dbo].[Boleta_venta] OFF
GO
INSERT [dbo].[Detalle_boleta] ([IdNrBoleta], [IdMedicamento], [CantidadProductos]) VALUES (1, 1, 2)
INSERT [dbo].[Detalle_boleta] ([IdNrBoleta], [IdMedicamento], [CantidadProductos]) VALUES (2, 3, 1)
INSERT [dbo].[Detalle_boleta] ([IdNrBoleta], [IdMedicamento], [CantidadProductos]) VALUES (3, 2, 100)
GO
INSERT [dbo].[Detalle_pedido] ([IdPedido], [IdMedicamento], [CantidadPedido]) VALUES (1, 1, 10)
INSERT [dbo].[Detalle_pedido] ([IdPedido], [IdMedicamento], [CantidadPedido]) VALUES (2, 3, 15)
INSERT [dbo].[Detalle_pedido] ([IdPedido], [IdMedicamento], [CantidadPedido]) VALUES (3, 1, 10)
GO
SET IDENTITY_INSERT [dbo].[Medicamento] ON 

INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (1, N'Paracetamol', CAST(N'2021-01-20' AS Date), 2000, 900)
INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (2, N'Ibuprofeno Actron ', CAST(N'2020-12-29' AS Date), 2600, 2000)
INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (3, N'Omeprazon Laboratorio de chile', CAST(N'2021-02-04' AS Date), 3000, 2800)
INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (4, N'Cinabel', CAST(N'2020-03-01' AS Date), 1500, 1400)
INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (5, N'Prucaloprida PRUCALEX', CAST(N'2021-02-01' AS Date), 44000, 33000)
INSERT [dbo].[Medicamento] ([IdMedicamento], [NombreMedicamento], [FechaVencimiento], [PrecioUnitarioVenta], [PrecioUnitarioCosto]) VALUES (6, N'Cinabel', CAST(N'2020-03-01' AS Date), 1500, 1400)
SET IDENTITY_INSERT [dbo].[Medicamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido_Compra] ON 

INSERT [dbo].[Pedido_Compra] ([IdPedido], [FechaEmision], [FechaEntrega], [TotalaPagar], [IdUsuario], [IdProveedor]) VALUES (1, CAST(N'2020-12-12' AS Date), CAST(N'2020-12-30' AS Date), 4000000, 2, 1)
INSERT [dbo].[Pedido_Compra] ([IdPedido], [FechaEmision], [FechaEntrega], [TotalaPagar], [IdUsuario], [IdProveedor]) VALUES (2, CAST(N'2020-12-12' AS Date), CAST(N'2020-12-30' AS Date), 5000000, 1, 1)
INSERT [dbo].[Pedido_Compra] ([IdPedido], [FechaEmision], [FechaEntrega], [TotalaPagar], [IdUsuario], [IdProveedor]) VALUES (3, CAST(N'2021-01-15' AS Date), CAST(N'2020-01-20' AS Date), 30000, 3, 2)
SET IDENTITY_INSERT [dbo].[Pedido_Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IdProveedor], [RutProveedor], [NombreProveedor], [Telefono], [Direccion], [Email]) VALUES (1, N'20456345-7', N'SolutionsMedic', 2343556, N'Pajaritos 1234', N'Solutions@Medic.cl')
INSERT [dbo].[Proveedor] ([IdProveedor], [RutProveedor], [NombreProveedor], [Telefono], [Direccion], [Email]) VALUES (2, N'34987776-5', N'Unaune Media', 33445456, N'Providencia 4345', N'UnauneMedia.@gmail.com')
INSERT [dbo].[Proveedor] ([IdProveedor], [RutProveedor], [NombreProveedor], [Telefono], [Direccion], [Email]) VALUES (3, N'80666234-4', N'Laboratorio Chile', 2343556, N'Av.Marathon 1315 Ñuñoa', N'LaboratorioChile@limitada.cl')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (1, N'Cliente')
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (2, N'Farmaceutico')
INSERT [dbo].[Rol] ([IdRol], [NombreRol]) VALUES (3, N'Recursos Humanos')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol_Usuario] ON 

INSERT [dbo].[Rol_Usuario] ([IdRolUsuario], [IdRol], [IdUsuario]) VALUES (1, 1, 2)
INSERT [dbo].[Rol_Usuario] ([IdRolUsuario], [IdRol], [IdUsuario]) VALUES (2, 2, 2)
INSERT [dbo].[Rol_Usuario] ([IdRolUsuario], [IdRol], [IdUsuario]) VALUES (3, 1, 1)
SET IDENTITY_INSERT [dbo].[Rol_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [RutUsuario], [Nombre], [Apellido], [Direccion], [Telefono], [IdSalud]) VALUES (1, N'20119333-5', N'Carlos', N'Padilla', N'Pasaje flores 233', 12345, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [RutUsuario], [Nombre], [Apellido], [Direccion], [Telefono], [IdSalud]) VALUES (2, N'34445643-7', N'Claudia', N'Romero', N'Pasaje flores 234', 33454543, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [RutUsuario], [Nombre], [Apellido], [Direccion], [Telefono], [IdSalud]) VALUES (3, N'55345654-8', N'Roberto ', N'Plaza', N'Providencia 123', 55667665, 3)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Detalle_boleta]  WITH CHECK ADD FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Detalle_boleta]  WITH CHECK ADD FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Detalle_boleta]  WITH CHECK ADD FOREIGN KEY([IdNrBoleta])
REFERENCES [dbo].[Boleta_venta] ([IdBoleta])
GO
ALTER TABLE [dbo].[Detalle_boleta]  WITH CHECK ADD FOREIGN KEY([IdNrBoleta])
REFERENCES [dbo].[Boleta_venta] ([IdBoleta])
GO
ALTER TABLE [dbo].[Detalle_pedido]  WITH CHECK ADD FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Detalle_pedido]  WITH CHECK ADD FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Detalle_pedido]  WITH CHECK ADD FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido_Compra] ([IdPedido])
GO
ALTER TABLE [dbo].[Detalle_pedido]  WITH CHECK ADD FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido_Compra] ([IdPedido])
GO
ALTER TABLE [dbo].[Pedido_Compra]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Pedido_Compra]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Pedido_Compra]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pedido_Compra]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rol_Usuario]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Rol_Usuario]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Rol_Usuario]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rol_Usuario]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdSalud])
REFERENCES [dbo].[Afiliacion_Salud] ([IdSalud])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdSalud])
REFERENCES [dbo].[Afiliacion_Salud] ([IdSalud])
GO
