# Etap 1: Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore PixelWorldsServer2/PixelWorldsServer2.csproj
RUN dotnet publish PixelWorldsServer2/PixelWorldsServer2.csproj -c Release -o /app/publish

# Etap 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .
COPY --from=build /src/player.dat ./player.dat
ENTRYPOINT ["dotnet", "PixelWorldsServer2.dll"]
