FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# kopiujemy cały repo, w tym podfolder z projektem
COPY . .

# przywracamy zależności i publikujemy projekt z podfolderu
RUN dotnet restore PixelWorldsServer2/PixelWorldsServer2.csproj
RUN dotnet publish PixelWorldsServer2/PixelWorldsServer2.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# kopiujemy opublikowane pliki
COPY --from=build /app/publish .

# kopiujemy plik player.dat do /app
COPY PixelWorldsServer2/PixelWorldsServer2/player.dat ./player.dat

ENTRYPOINT ["dotnet", "PixelWorldsServer2.dll"]
