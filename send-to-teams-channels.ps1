param(
    [parameter(Mandatory=$true)]
    [string] $Message,
    [parameter(Mandatory=$true)]
    [string] $WebHookUris
);

# Split on commas to allow the message to be sent to mulitple channels.
$WebHookUriChannels = $WebHookUris -split ','

for ($i = 0; $i -lt $WebHookUriChannels.length; $i++) {
	$Body = @{ text = $Message } | ConvertTo-Json
	Invoke-RestMethod -Method post -ContentType 'application/json' -Body $Body -Uri $WebHookUriChannels[$i]
}