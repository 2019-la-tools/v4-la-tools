#!/bin/bash

#get the Locating Array and Factor Data file names from the first 2 arguments
locating_array=$1
factor_data=$2
shift 2

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

#convert all long options into their short counterpart
for arg in "$@"; do
    shift
    case $arg in
        --seed )          set -- "$@" "-s" ;;
        --memchk )        set -- "$@" "-e" ;;
        --analysis )      set -- "$@" "-a" ;;
        --autofind )      set -- "$@" "-u" ;;
        --fixla )         set -- "$@" "-f" ;;
        --model )         set -- "$@" "-m" ;;
        --mtfixla )       set -- "$@" "-t" ;;
        --sysfixla )      set -- "$@" "-s" ;;
        --checkla )       set -- "$@" "-c" ;;
        --noise )         set -- "$@" "-n" ;;
        --printcs )       set -- "$@" "-p" ;;
        --reorderrowsla ) set -- "$@" "-r" ;;
        * )               set -- "$@" "$arg"
    esac
done



OPTIND=1
while getopts ":s:ea:u:f:m:t:s:c:n:p:r:" opt; do
    case $opt in

        # "s" and "seed"          have required arguments (1)
        s ) arg_s="seed"
            arg_s_args=$OPTARG
            if [ ${#arg_s_args[@]} -ne 1 ]; then
                echo "\"seed\" argument expects 1 input:"
                echo "    seed:   int"
                exit 1
            fi ;;

        
        # "e" and "memchk"        have no arguments
        e ) arg_e="memchk" ;;


        # "a" and "analysis"      have required arguments (6)
        a ) arg_a="analysis"
            IFS=','
            arg_a_args=($OPTARG)
            if [ ${#arg_a_args[@]} -ne 6 ]; then
                echo "\"analysis\" argument expects 6 input:"
                echo "    responseDir:      string"
                echo "    responseCol:      string"
                echo "    performLog:       int [0,1]"
                echo "    terms_n:          int"
                echo "    models_n:         int"
                echo "    newModels_n:      int"
                exit 2
            fi ;;



        # "u" and "autofind"      have required arguments (3)
        u ) arg_u="autofind"
            IFS=','
            arg_u_args=($OPTARG)
            if [ ${#arg_u_args[@]} -ne 3 ]; then
                echo "\"autofind\" argument expects 3 inputs:"
                echo "    k: 				int"
                echo "	  c:				int"
                echo "	  startRows:		int"
                exit 3
            fi ;;


        # "f" and "fixla"         have required arguments (1)
        f ) arg_f="fixla"
            IFS=','
            arg_f_args=($OPTARG)
            if [ ${#arg_f_args[@]} -ne 1 ]; then
                echo "\"fixla\" argument expects 1 input:"
                echo "    LAFileToFix:      string"
                exit 4
            fi ;;


        # "m" and "model"         have required arguments (at least 5)
        m ) arg_m="model"
            IFS=','
            arg_m_args=($OPTARG)
            if [ ${#arg_m_args[@]} -lt 5 ]; then
                echo "\"model\" argument expects 3 inputs and 2 sub-inputs if the value"
                echo "of the 3rd input argument is > 0"
                echo "	  responseDir: 	    string"
                echo "	  responseCol:	    string"
                echo "    terms:			int"
                echo "		  coefficients:	    float"
                echo "		  columns:		    int"
                exit 5
            fi ;;


        # "t" and "mtfixla"       have required arguments (4)
        t ) arg_t="mtfixla"
            IFS=','
            arg_t_args=($OPTARG)
            if [ ${#arg_t_args[@]} -ne 4 ]; then
                echo "\"mtfixla\" argument expects 4 inputs:"
                echo "    k: 				int"
                echo "    c:				int"
                echo "    totalRows:		int"
                echo "    outputFile:		string"
                exit 6
            fi ;;


        # "s" and "sysfixla"      have required arguments (5)
        s ) arg_s="sysfixla"
            IFS=','
            arg_s_args=($OPTARG)
            if [ ${#arg_s_args[@]} -ne 5 ]; then
                echo "\"sysfixla\" argument expects 5 inputs:"
                echo "    k: 				int"
                echo "    c:				int"
                echo "    initialRows:	    int"
                echo "    minChunk:		    int"
                echo "    outputFile:		string"
                exit 7
            fi ;;


        # "c" and "checkla"       have required arguments (2)
        c ) arg_c="checkla"
            IFS=','
            arg_c_args=($OPTARG)
            if [ ${#arg_c_args[@]} -ne 2 ]; then
                echo "\"checkla\" argument expects 2 inputs:"
                echo "    k: 			    int"
                echo "    c:			    int"
                exit 8
            fi ;;


        # "n" and "noise"         have required arguments (1)
        n ) arg_n="noise"
            IFS=','
            arg_n_args=($OPTARG)
            if [ ${#arg_n_args[@]} -ne 1 ]; then
                echo "\"noise\" argument expects 1 input that will either be"
                echo "the string "gaussian" or a float value:"
                echo "    noiseType:		string ["gaussian",float_value]"
                exit 9
            fi ;;


        # "p" and "printcs"       have optional arguments with default values (1)
        p ) arg_p="printcs" ;;           


        # "r" and "reorderrowsla" have required arguments (3)
        r ) arg_r="reorderrowsla"
            IFS=','
            arg_r_args=($OPTARG)
            if [ ${#arg_r_args[@]} -ne 3 ]; then
                echo "\"reorderrowsla\" argument expects 3 inputs:"
                echo "    k: 				int"
                echo "    c:				int"
                echo "    outputFile:		string"
                exit 10
            fi ;;


        * ) echo "Internal Error!"
            exit 11
    esac
done


# do something with the variables
