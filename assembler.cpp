#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

string removeExtension(const string& filename) {
  size_t lastdot = filename.find_last_of(".");
  if (lastdot == string::npos) return filename;
  return filename.substr(0, lastdot);
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    cerr << "Usage: ./assembler.exe <path>" << endl;
    return 1;
  }

  string filename = argv[1];
  string baseName = removeExtension(filename);

  string assembleCmd = "as " + filename + " -o " + baseName + ".o";
  if (system(assembleCmd.c_str()) != 0) {
    cerr << "Assembler error" << endl;
    return 1;
  }

  string linkCmd = "gcc -o " + baseName + " " + baseName + ".o -nostdlib -no-pie";
  if (system(linkCmd.c_str()) != 0) {
    cerr << "Linker error" << endl;
    return 1;
  }

  string runCmd = "./" + baseName;
  if (system(runCmd.c_str()) != 0) {
    cerr << "Execution error" << endl;
    return 1;
  }

  return 0;
}
