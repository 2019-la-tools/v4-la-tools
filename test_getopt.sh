#!/bin/bash

# "s" and "seed"          have required arguments (1)
# "e" and "memchk"        have no arguments
# "a" and "analysis"      have required arguments (6)
# "u" and "autofind"      have required arguments (3)
# "f" and "fixla"         have required arguments (1)
# "m" and "model"         have required arguments (at least 5)
# "t" and "mtfixla"       have required arguments (4)
# "s" and "sysfixla"      have required arguments (5)
# "c" and "checkla"       have required arguments (2)
# "n" and "noise"         have required arguments (1)
# "p" and "printcs"       have optional arguments with default values (1)
# "r" and "reorderrowsla" have required arguments (3)

# set an initial value for memcheck
ARG_E=0

# read the options
TEMP=`getopt -o s:,e,a:,u:,f:,m:,t:,s:,c:,n:,p::,r: --long seed:,memchk,analysis:,autofind:,fixla:,model:,mtfixla:,sysfixla:,checkla:,noise:,printcs::,reorderrowsla: -n 'test_getopt.sh' -- "$@"`
eval set -- "$TEMP"

# extract options and their arguments into variables
while true; do
    case "$1" in

        -s|--seed)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -e|--memchk) ARG_E=1 ; shift ;;


        -a|--analysis)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -u|--autofind)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -f|--fixla)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -m|--model)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -t|--mtfixla)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -s|--sysfixla)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -c|--checkla)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -n|--noise)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        -p|--printcs)
            case "$2" in
                "") ARG_P='temp.tsv'
                *) ARG_P=$2; shift 2 ;;
            esac ;;


        -r|--reorderrowsla)
            case "$2" in
                "") shift 2 ;;
                *) ARG_S=$2; shift 2 ;;
            esac ;;


        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# do something with the variables
