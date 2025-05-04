# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copiar archivos del proyecto
COPY . . 

# Restaurar dependencias
RUN dotnet restore ./FixTimeBack/FixTimeBack.csproj

# Publicar en modo release
RUN dotnet publish ./FixTimeBack/FixTimeBack.csproj -c Release -o /app/out

# Etapa de runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

# Puerto que expone tu API
EXPOSE 80

# Comando para iniciar la API
ENTRYPOINT ["dotnet", "FixTimeBack.dll"]
