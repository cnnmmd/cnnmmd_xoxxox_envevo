#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthapp="${pthsrc}"/envevo
srcevo='https://github.com/EvolutionGym/evogym.git'
srcedt='https://github.com/EvolutionGym/evogym-design-tool.git'

test -d "${pthapp}" || mkdir "${pthapp}"

if test -d "${pthapp}"/evogym
then
  cd "${pthapp}"/evogym && git pull
else
  cd "${pthapp}" && git clone --recurse-submodules ${srcevo}
fi

if test -d "${pthapp}"/evogym-design-tool
then
  cd "${pthapp}"/evogym-design-tool && git pull
else
  cd "${pthapp}" && git clone --depth 1 ${srcedt}
fi

addimg ${imgtgt} "${cnfimg}" "${pthdoc}"
