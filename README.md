# README

# アプリケーション概要

# 機能一覧
* ユーザー管理、ログイン機能
* タスク登録機能
* タスク編集,削除機能


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

|Column                 |Type        |Options            |
|-----------------------|------------|-------------------|
|name                   |string      |null: false        |
|email                  |string      |null: false        | 
|password               |string      |null: false        | 


### Association
- has_many :task

## tasks テーブル

|Column                 |Type        |Options            |
|-----------------------|------------|-------------------|
|name                   |string      |null: false        |
|description            |text        |       ---         | 
|user_id                |integer     |       ---         | 


### Association
- belongs_to :user