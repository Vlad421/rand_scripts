# Copy all remote branches
$branches=git branch -a 
#Write-Output $branches
foreach ($i in $branches)
{
	if ($i.contains("remotes"))
	{
		$i -match "remotes(?<content>.*)" | Out-Null
		$branch = $matches['content'] 
		
		Write-Output $branch
		git checkout $branch
		git push --set-upstream origin $branch
	}
	
	
}
