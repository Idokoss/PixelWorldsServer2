# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Kopiuj plik projektu i przywróć zależności
COPY *.csproj ./
RUN dotnet restore

# Kopiuj resztę plików i zbuduj
COPY . ./
COPY player.dat /app/player.dat
RUN dotnet publish -c Release -o out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "PixelWorldsServer2.dll"]
