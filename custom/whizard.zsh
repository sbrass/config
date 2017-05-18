source ${HOME}/workspace/local/bin/whizard-build-envg.sh

export WHIZARD_GIT=${HOME}/whizard-git
export WHIZARD_OPENLOOPS="--enable-openloops --with-openloops=${HOME}/workspace/local/OpenLoops"

alias cwg="cd ${WHIZARD_GIT}"

function update-ref-file () {
    cp ${1}.out ${WHIZARD_GIT}/share/tests/unit_tests/ref-output/${1}.ref
}
