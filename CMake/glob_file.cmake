# ソースファイルを列挙して、第1引数に指定された配列に追加する。
# usage:
# glob_files(<source_list> TARGET_DIRECTORY <target_directory> EXTENSIONS <extension1> [<extension2> ...])
#   source_list: 結果を受け取る配列。列挙した結果はこの配列に追加される。
#   TARGET_DIRECTORY: ファイルを列挙するパス。
#   EXTENSIONS: 列挙対象のファイルの拡張子。`.cpp` のようにドットを含んだ形式で指定すること。
function(glob_files SOURCE_LIST)
  cmake_parse_arguments(GF "" "TARGET_DIRECTORY" "EXTENSIONS" ${ARGN})

  if(NOT DEFINED GF_TARGET_DIRECTORY)
    message(FATAL_ERROR "Target Directory must be specified.")
  endif()

  if(NOT DEFINED GF_EXTENSIONS)
    message(FATAL_ERROR "Target extensions must be specified.")
  endif()

  foreach(EXT ${GF_EXTENSIONS})
    file(GLOB_RECURSE TMP_LIST LIST_DIRECTORIES false "${GF_TARGET_DIRECTORY}/*${EXT}")
    list(APPEND ${SOURCE_LIST} ${TMP_LIST})
  endforeach()
  set(${SOURCE_LIST} ${${SOURCE_LIST}} PARENT_SCOPE)
endfunction()


