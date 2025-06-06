# Etap 1: Build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore PixelWorldsServer2.csproj
RUN dotnet publish PixelWorldsServer2.csproj -c Release -o /app/publish

# Etap 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "PixelWorldsServer2.dll"]
