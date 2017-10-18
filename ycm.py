# YCM uses libclang and needs compile flags to support semantic support
# for C-family languages. This contains a very basic default for simple
# C++ (!!!) projects.
def FlagsForFile( filename, **kwargs ):
    return {
            'flags': ['-x', 'c++', '-Wall', '-Wextra', '-Werror' ],
            }
