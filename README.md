---

# **Discord Activity Changer**

Este proyecto permite cambiar el estado de actividad (Rich Presence) de tu cuenta de Discord, mostrando información personalizada sobre lo que estás jugando. Puedes configurar detalles como el título del juego, la imagen que aparece en tu perfil, y más.

## **Requisitos previos**

1. **Node.js**: Necesitas tener instalado [Node.js](https://nodejs.org/) para ejecutar el código de este proyecto.
2. **Aplicación de Discord**: Debes tener una aplicación registrada en el [Portal de Desarrolladores de Discord](https://discord.com/developers/applications), para obtener el `clientId` de tu aplicación.

## **Instalación**

1. Clona o descarga este repositorio en tu computadora.
   
2. Abre una terminal en la carpeta donde descargaste el proyecto y ejecuta el siguiente comando para instalar las dependencias necesarias:

   ```bash
   npm install discord-rpc
   ```

## **Cómo funciona el código**

Este proyecto utiliza la librería `discord-rpc` para interactuar con la API de Discord y cambiar tu actividad en el perfil de Discord. Aquí te explico el código:

### **Código**

```javascript
const RPC = require("discord-rpc");

const clientId = ""; // El cliente ID de tu aplicacion de discord

const rpc = new RPC.Client({ transport: "ipc" });

const startTimestamp = Date.now();

// Función para establecer la actividad
async function setActivity() {
    if (!rpc) return;
    rpc.setActivity({
        details: "Playing example blabla",
        state: "This is a very good game!", // Estado de la actividad
        largeImageKey: "example.png",
        largeImageText: "example", // Texto que aparecerá al pasar el ratón sobre la imagen
        startTimestamp: startTimestamp
    });
}

rpc.on("ready", () => {
    console.log("Rich Presence activado!");
    setActivity();
    setInterval(setActivity, 15 * 1000);
});

rpc.login({ clientId }).catch(console.error);
```

### **Explicación del Código**

- **`clientId`**: Es el ID único de tu aplicación de Discord. Lo puedes obtener al registrar una nueva aplicación en el portal de desarrolladores de Discord.
  
- **`rpc.setActivity()`**: Esta función establece la actividad que se mostrará en tu perfil de Discord. Puedes personalizar el texto en el campo `details` (detalles) y `state` (estado). Además, puedes agregar una imagen usando `largeImageKey` y `largeImageText`.

- **`startTimestamp`**: Es el tiempo en el que comenzará tu actividad. Esto se utiliza para mostrar el tiempo que llevas jugando.

- **`setInterval`**: Se utiliza para actualizar la actividad cada 15 segundos.

## **Cómo Ejecutarlo con el Archivo `.bat`**

Para facilitar la ejecución del proyecto, hemos incluido un archivo `.bat` que permite iniciar la actividad de Discord con un solo clic.

### **Pasos para usar el archivo `.bat`**

1. Asegúrate de haber configurado correctamente el código de `example.js`, incluyendo tu propio `clientId` obtenido desde el portal de desarrolladores de Discord.

2. **Modifica el archivo `.bat`**:
   - Si el archivo `.bat` aún no está configurado, abre el archivo `DiscordActivityChanger.bat` con un editor de texto (como Notepad) y asegúrate de que esté correctamente configurado para ejecutar tu archivo `example.js`. El contenido debería verse algo así:

   ```bat
   @echo off
   title Discord Activity Changer
   cls
   color a
   echo ========================================
   echo       Discord Activity Changer
   echo ========================================
   echo.
   echo Lista disponible: emo - index(milei) - pornhub - skibidi
   echo.
   set /p archivo=Escribe el archivo Node.js a ejecutar (sin .js): 

   if exist "%archivo%.js" (
       cls
       echo ==================================================
       echo Ejecutando %archivo%.js...
       echo ==================================================
       start /B node "%archivo%.js"
       goto control
   ) else (
       cls
       color c
       echo ==================================================
       echo   ERROR: El archivo "%archivo%.js" no existe.
       echo   Intentalo de nuevo.
       echo ==================================================
       timeout /t 2 >nul
       goto inicio
   )

   :control
   cls
   color b
   echo ==================================================
   echo  Node.js en ejecucion: %archivo%.js
   echo ==================================================
   echo.
   set /p opcion=Escribe "cambiar" para detener y elegir otro archivo: 

   if /I "%opcion%"=="cambiar" (
       taskkill /F /IM node.exe >nul 2>&1
       cls
       color c
       echo ==================================================
       echo       Node detenido correctamente.
       echo ==================================================
       timeout /t 2 >nul
       goto inicio
   ) else (
       goto control
   )
   ```

3. **Ejecuta el archivo `.bat`**:
   - Solo debes hacer doble clic en el archivo `DiscordActivityChanger.bat` y seguir las instrucciones que aparecen en la consola para ejecutar tu script.

---

¡Y eso es todo! Ahora tendrás tu actividad de Discord configurada y en ejecución. Si tienes alguna pregunta, no dudes en abrir un issue en el repositorio.

---
