output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
  description = "The primary web endpoint for the static website hosted on the Azure Storage Account"
}