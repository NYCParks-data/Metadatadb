/****** Script for SelectTopNRows command from SSMS  ******/
use metadatadb
go

create procedure sp_insert_ref_dtypes as
	insert into metadatadb.dbo.tbl_ref_dtypes(system_type__id,
											  user_type__id,
											  schema_id,
											  system_type)

	
		select system_type_id as system_type__id,
			   user_type_id as user_type__id,
			   schema_id,
			   name as system_type
		from dwh.sys.types
		except 
		select system_type__id,
			   user_type__id,
			   schema_id,
			   system_type
		from metadatadb.dbo.tbl_ref_dtypes;