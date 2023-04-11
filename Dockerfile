FROM python:3.8-slim-buster

WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt
COPY ./actions /app/actions
RUN rasa train
# RUN rasa run actions

EXPOSE 5005
EXPOSE 5055
CMD ["rasa", "run", "-m", "models", "--enable-api", "--cors", "\"*\""]
