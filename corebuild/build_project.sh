#!/bin/bash

dotnet restore
dotnet build
dotnet pack
dotnet nuget push $(ls bin/Debug/*.nupkg) -s https://www.myget.org/F/chessbot/auth/96b78fcc-cdbf-4b76-a018-1e6a03443dfd/api/v3/index.json