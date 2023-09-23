# Check for the input file
if [ $# -eq 0 ]
  then
    echo "No input file specified"
    exit 1
fi

# Get the input file name
input_file="$1"
base_name=$(basename "$input_file" .c)

# Generate .ll file
clang -S -emit-llvm -Xclang -disable-O0-optnone "$input_file"

# Perform optimization
opt -S "${base_name}.ll" -o "${base_name}_opt.ll"

# Generate assembly file
llc "${base_name}_opt.ll" -o "${base_name}_opt_llvm.s"

# Generate object files
as -o "${base_name}_opt_llvm_as.o" "${base_name}_opt_llvm.s"

# Link object files(ld->clang)
clang -o "${base_name}_opt_llvm_as" "${base_name}_opt_llvm_as.o"

# Run the output
./"${base_name}_opt_llvm_as"
