export WHIZARD_GIT=${HOME}/whizard-git

alias cwg="cd ${WHIZARD_GIT}"

function update-ref-file () {
    cp ${1}.out ${WHIZARD_GIT}/share/tests/unit_tests/ref-output/${1}.ref
}
