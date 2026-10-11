data "databricks_tables" "tables_lookup" {
  for_each = var.tables_lookup

  catalog_name = each.value.catalog_name
  schema_name  = each.value.schema_name
  ids          = each.value.ids

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

