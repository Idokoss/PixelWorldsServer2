# Etap 1: build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore PixelWorldsServer2.csproj
RUN dotnet publish PixelWorldsServer2.csproj -c Release -o /app/publish

# Etap 2: run
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "PixelWorldsServer2.dll"]
