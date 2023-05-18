try {
    
    $local_file_lastupdate = 'LOCAL_PATH\last_copy_to_containers1.txt'

    # Source folder from wheer files are uploadede to Azure container
    $local_source = "LOCAL_SOURCE_PATH\*"
    
    # Container URL generatde in Azure
    $target_source = "https://STORAGE_NAME.blob.core.windows.net/CONTAINER_NAME?sp=rcwl&st=2023-05-17T23:48:47Z&se=2024-05-17T07:48:47Z&spr=https&sv=2022-11-02&sr=c&sig=STORAGE_KEY"

    $last_date = 'not_set'
    if (Test-Path $local_file_lastupdate){
        #Get last date when files were copied (operation was done)
        $last_date = Get-Content -Path  | Where-Object {
           -not [string]::IsNullOrWhiteSpace($_)
        }
    } 
 
    # Update last date when operation was done
    # Set before copy to meke sure no file will be mised next time
    # Get-Date -Format "o" |  Out-File -FilePath $local_file_lastupdate

    if ($last_date = 'not_set'){
        azcopy copy  $local_source  $target_source --recursive=true
    } else{
        azcopy copy  $local_source  $target_source --recursive=true --include-after $last_date
    }

    'All done. Check azcopy log for full details'

} catch [System.IO.IOException]{
    Write-Host "An error occurred:"
    Write-Host $_.ScriptStackTrace
}