# 1. Usa uma imagem oficial do Python
FROM python:3.9-slim

# 2. Define a pasta de trabalho lá dentro do contêiner
WORKDIR /app

# 3. Copia o arquivo de dependências primeiro
COPY requirements.txt .

# 4. Instala as bibliotecas listadas
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia todo o resto do seu projeto (treino.py, os CSVs e a pasta .streamlit)
COPY . .

# 6. Avisa que o Streamlit usa a porta 8501
EXPOSE 8501

# 7. O comando que o Docker vai rodar quando ligar
CMD sh -c "streamlit run treino.py --server.port=${PORT:-8501} --server.address=0.0.0.0"