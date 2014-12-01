class TagsController < ApplicationController
  def index
    tags
  end

  def show
    tag

    posts = Post.tagged_with(@tag).exclude_drafts
    links = Link.tagged_with(@tag).exclude_drafts
    @results = (posts + links).sort_by { |result| result[:published_at] }.reverse

    if logged_in?
      posts = Post.tagged_with(@tag)
      links = Link.tagged_with(@tag)
      @results = (posts + links).sort_by { |result| result[:created_at] }.reverse
    end
  end

  private

  def tags
    @tags ||= ActsAsTaggableOn::Tag.all.order('name ASC')
  end

  def tag
    @tag ||= ActsAsTaggableOn::Tag.friendly.find(params[:id])
  end
end
