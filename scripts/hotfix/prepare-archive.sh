#!/bin/bash
CHANGED_FILES=$(git diff --name-only HEAD~1)
PROJECTS=$(dotnet sln list | grep -o -E '[^\\]+\\[^\\]+\.csproj')
echo $CHANGED_FILES
#echo $PROJECTS

find-up() {
  local mask="$1"
  local dir="$2"
  local proj_name=$(ls $dir | grep -o -E $mask)

  if [[ "$proj_name" != "" ]]; then
    echo $proj_name | sed -r 's/csproj$/dll/'

    return 1
  fi

  if [[ "$dir" == "." ]]; then
  	return 0 
  else
  	find-up "$mask" "$(dirname "$dir")"
  fi 
}

find-up '[^//]+\.csproj' "source/TaskMaster.WebApi/TestFeature.cs"
