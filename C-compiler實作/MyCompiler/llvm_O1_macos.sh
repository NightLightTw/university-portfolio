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
opt -S -O1 "${base_name}.ll" -o "${base_name}_opt_O1.ll"

# Generate assembly file
llc "${base_name}_opt_O1.ll" -o "${base_name}_opt_llvm_O1.s"

# Generate object files
as -o "${base_name}_opt_llvm_as_O1.o" "${base_name}_opt_llvm_O1.s"

# Link object files(ld->clang)
clang -o "${base_name}_opt_llvm_as_O1" "${base_name}_opt_llvm_as_O1.o"

# Run the output
./"${base_name}_opt_llvm_as_O1"
