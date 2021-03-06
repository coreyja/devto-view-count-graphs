# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_03_000300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "article_stats", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.integer "comments_count", null: false
    t.integer "positive_reactions_count", null: false
    t.integer "public_reactions_count", null: false
    t.integer "page_views_count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "recorded_at", null: false
    t.index ["article_id"], name: "index_article_stats_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "external_id", null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.string "cover_image"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover_image_url"
    t.index ["external_id"], name: "index_articles_on_external_id", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "shared_articles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "articles_id"
    t.uuid "users_id"
    t.datetime "frozen_at"
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["articles_id"], name: "index_shared_articles_on_articles_id"
    t.index ["users_id"], name: "index_shared_articles_on_users_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "dev_to_username", null: false
    t.string "name", null: false
    t.string "profile_image_url"
    t.string "profile_image_90_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "preferred_theme"
    t.index ["dev_to_username"], name: "index_users_on_dev_to_username"
  end

  add_foreign_key "article_stats", "articles"
  add_foreign_key "shared_articles", "articles", column: "articles_id"
  add_foreign_key "shared_articles", "users", column: "users_id"
end
