import os
import glob
import subprocess

CB_BASE_DIR = os.environ['CODEBUILD_SRC_DIR']
BUILD_SCRIPT_LOCATION = '/corebuild/build_project.sh'

def find_build_projects():
    csprojs = []
    for filename in glob.iglob('**/*.csproj', recursive=True):
        csprojs.append(filename)
        print('Found csproj "' + filename + "'")

    build_dirs = []
    for csproj in csprojs:
        builddir = os.path.dirname(os.path.abspath(csproj))

        if 'Test' in builddir:
            print('Skipping "' + builddir + '" because it appears to be a test project.')
        else:
            build_dirs.append(builddir)
            print('Adding build directory to list: "' + builddir + '"')
    return build_dirs

def build_project(project_dir):
    build_process = subprocess.Popen(BUILD_SCRIPT_LOCATION, cwd=project_dir)
    build_process.wait()

build_projects = find_build_projects()
print('Starting build process for ' + str(len(build_projects)) + ' project(s).')

for bp in build_projects:
    project_name = os.path.basename(bp)
    print('Building project "' + project_name + '"...')
    build_project(bp)