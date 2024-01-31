import os
import base64
import pyodbc

# Conexión a la base de datos SQL y ruta de archivos locales
filePath = "xxxxxxx"
connectionString = "DRIVER={SQL Server};SERVER=xxxxx;DATABASE=xxxxx;Trusted_Connection=yes;"

# Función para insertar un archivo codificado en la base de datos
def insertFileEncode(filePath, connectionString):
    try: 
        with open(filePath, 'rb') as file:
            fileContent = file.read()
            encodedContent = base64.b64encode(fileContent)

        
        connection = pyodbc.connect(connectionString)
        cursor = connection.cursor()
        
        cursor.execute("INSERT INTO FileEncode (filePath, fileContent) VALUES (?, ?)", filePath, encodedContent)        
        connection.commit()
        
        print(f"File {filePath} inserted successfully in the database.")
    except Exception as e:
        print(f"Error inserting file {filePath}: {str(e)}")
    finally:
        cursor.close()
        connection.close()
# Función para recuperar un archivo decodificado de la base de datos
def retrieveFileEncode(fileId, connectionString):
    try:
        connection = pyodbc.connect(connectionString)
        cursor = connection.cursor()
        
        cursor.execute("SELECT filePath, fileContent FROM FileEncode WHERE idFileEncode = ?", fileId)
        row = cursor.fetchone()
        
        if row:
            filePath, encodedContent = row
            decodedContent = base64.b64decode(encodedContent).decode('utf-8')

            return decodedContent
        else:
            print(f"File with id {fileId} not found in the database.")
            return None
    except Exception as e:
        print(f"Error retrieving file with id {fileId}: {str(e)}")
        return None
    finally:
        cursor.close()
        connection.close()

# Llamada a las funciones
insertFileEncode(filePath, connectionString)
decoded_content = retrieveFileEncode(1, connectionString)

# Imprimir el contenido decodificado
if decoded_content is not None:
    print(f"Decoded content:\n{decoded_content}")
else:
    print("No se encontró contenido decodificado.")
