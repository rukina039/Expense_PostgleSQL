# ベースイメージとして Python 3.9-slim を利用
FROM python:3.9-slim

# 環境変数設定
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 作業ディレクトリを /app に設定
WORKDIR /app

# 依存パッケージのインストール
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# ソースコードをコンテナにコピー
COPY . .

# コンテナ起動時に gunicorn でアプリケーションを起動
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
