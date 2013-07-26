whatisthis ()
{
    if [ -f "${HOME}/.whatisthis" ]; then
        cat "${HOME}/.whatisthis"
    else
        echo "No description file"
    fi
}
