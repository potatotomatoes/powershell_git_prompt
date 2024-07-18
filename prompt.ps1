function Prompt {
	$git_branch = ""

  function Isgit {

    # checkout Isgit
    function IsIngit {
      git rev-parse | Out-Null
      if($?) {
        return " $(git branch --show-current --no-color)"
        }
    } 

    $git_branch = IsIngit
    $status = git status | Out-String
    if (($status -like "*<file>*") -and ($status -like "*use*")){
      $git_branch = $git_branch + "*"
    }
    if ($status -like "*committed*" -and !($status -like "*add*")){
      $git_branch = $git_branch + "+"
    }
    return $git_branch
  }

  $git_branch = Isgit
  $pattern = $env:userprofile -replace '\\', '\\'
  $promptString = "$(Get-Location)" -replace $pattern, "~"
  # color setting
  $orange =[char]27 + "[33m"
  $reset = [char]27 + "[0m"
  
  "$promptString))$orange$git_branch$reset >> "
}