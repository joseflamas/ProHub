//
//  PullRequest.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/22/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation

struct PullRequest {
    
    var pullRequestId     : Int    //  id = 154662606;
    var pullRequestNumber : Int    //  number = 1325;
    var pullRequestTitle  : String //  title = "recommended warnings";
    var pullRequestState  : String //  state = open;
    
    var authorId          : Int    //  id = 839992;
    var author            : String //  login = Coeur;
    var authorAssociation : String //  "author_association" = COLLABORATOR;
    
    var headLabel         : String //  label = "magicalpanda:recommended_warnings";
    var baseLabel         : String //  label = "magicalpanda:master";
    
    init(pullId: Int, pullNumber: Int, pullTitle: String, pullState: String, idAuthor: Int, nameAuthor: String, association: String, labelHead: String, labelBase: String ){
        
        pullRequestId     = pullId
        pullRequestNumber = pullNumber
        pullRequestTitle  = pullTitle
        pullRequestState  = pullState
        
        authorId = idAuthor
        author = nameAuthor
        authorAssociation = association
        
        headLabel = labelHead
        baseLabel = labelBase
        
    }
    
    
}



/*
 
 {
 
 "_links" =  {
     comments = {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1325/comments";
     };
     commits =  {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325/commits";
     };
     html =  {
        href = "https://github.com/magicalpanda/MagicalRecord/pull/1325";
     };
     issue = {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1325";
     };
     "review_comment" =  {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/comments{/number}";
     };
     "review_comments" =  {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325/comments";
     };
     self = {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325";
     };
     statuses =  {
        href = "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/f17716b239d75f8cc584b99e558cb4b0cf6f2ba2";
     };
 };
 
 assignee =  {
     "avatar_url" = "https://avatars2.githubusercontent.com/u/839992?v=4";
     "events_url" = "https://api.github.com/users/Coeur/events{/privacy}";
     "followers_url" = "https://api.github.com/users/Coeur/followers";
     "following_url" = "https://api.github.com/users/Coeur/following{/other_user}";
     "gists_url" = "https://api.github.com/users/Coeur/gists{/gist_id}";
     "gravatar_id" = "";
     "html_url" = "https://github.com/Coeur";
     id = 839992;
     login = Coeur;
     "node_id" = "MDQ6VXNlcjgzOTk5Mg==";
     "organizations_url" = "https://api.github.com/users/Coeur/orgs";
     "received_events_url" = "https://api.github.com/users/Coeur/received_events";
     "repos_url" = "https://api.github.com/users/Coeur/repos";
     "site_admin" = 0;
     "starred_url" = "https://api.github.com/users/Coeur/starred{/owner}{/repo}";
     "subscriptions_url" = "https://api.github.com/users/Coeur/subscriptions";
     type = User;
     url = "https://api.github.com/users/Coeur";
 };
 
 assignees =  (
 {
     "avatar_url" = "https://avatars2.githubusercontent.com/u/839992?v=4";
     "events_url" = "https://api.github.com/users/Coeur/events{/privacy}";
     "followers_url" = "https://api.github.com/users/Coeur/followers";
     "following_url" = "https://api.github.com/users/Coeur/following{/other_user}";
     "gists_url" = "https://api.github.com/users/Coeur/gists{/gist_id}";
     "gravatar_id" = "";
     "html_url" = "https://github.com/Coeur";
     id = 839992;
     login = Coeur;
     "node_id" = "MDQ6VXNlcjgzOTk5Mg==";
     "organizations_url" = "https://api.github.com/users/Coeur/orgs";
     "received_events_url" = "https://api.github.com/users/Coeur/received_events";
     "repos_url" = "https://api.github.com/users/Coeur/repos";
     "site_admin" = 0;
     "starred_url" = "https://api.github.com/users/Coeur/starred{/owner}{/repo}";
     "subscriptions_url" = "https://api.github.com/users/Coeur/subscriptions";
     type = User;
     url = "https://api.github.com/users/Coeur";
 }
 );
 
 "author_association" = COLLABORATOR;
 
 base =  {
     label = "magicalpanda:master";
     ref = master;
 
     repo =  {
         "archive_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/{archive_format}{/ref}";
         archived = 0;
         "assignees_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/assignees{/user}";
         "blobs_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/blobs{/sha}";
         "branches_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/branches{/branch}";
         "clone_url" = "https://github.com/magicalpanda/MagicalRecord.git";
         "collaborators_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/collaborators{/collaborator}";
         "comments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/comments{/number}";
         "commits_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/commits{/sha}";
         "compare_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/compare/{base}...{head}";
         "contents_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/contents/{+path}";
         "contributors_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/contributors";
         "created_at" = "2010-07-27T23:58:18Z";
         "default_branch" = master;
         "deployments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/deployments";
         description = "Super Awesome Easy Fetching for Core Data 1!!!11!!!!1!";
         "downloads_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/downloads";
         "events_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/events";
         fork = 0;
         forks = 1874;
         "forks_count" = 1874;
         "forks_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/forks";
         "full_name" = "magicalpanda/MagicalRecord";
         "git_commits_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/commits{/sha}";
         "git_refs_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/refs{/sha}";
         "git_tags_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/tags{/sha}";
         "git_url" = "git://github.com/magicalpanda/MagicalRecord.git";
         "has_downloads" = 1;
         "has_issues" = 1;
         "has_pages" = 1;
         "has_projects" = 1;
         "has_wiki" = 1;
         homepage = "";
         "hooks_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/hooks";
         "html_url" = "https://github.com/magicalpanda/MagicalRecord";
         id = 801795;
         "issue_comment_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/comments{/number}";
         "issue_events_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/events{/number}";
         "issues_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues{/number}";
         "keys_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/keys{/key_id}";
         "labels_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/labels{/name}";
         language = "Objective-C";
         "languages_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/languages";
         license = {
             key = other;
             name = Other;
             "node_id" = "MDc6TGljZW5zZTA=";
             "spdx_id" = NOASSERTION;
             url = "<null>";
         };
 
         "merges_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/merges";
         "milestones_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/milestones{/number}";
         "mirror_url" = "<null>";
         name = MagicalRecord;
         "node_id" = "MDEwOlJlcG9zaXRvcnk4MDE3OTU=";
         "notifications_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/notifications{?since,all,participating}";
         "open_issues" = 285;
         "open_issues_count" = 285;
 
         owner =  {
             "avatar_url" = "https://avatars1.githubusercontent.com/u/130841?v=4";
             "events_url" = "https://api.github.com/users/magicalpanda/events{/privacy}";
             "followers_url" = "https://api.github.com/users/magicalpanda/followers";
             "following_url" = "https://api.github.com/users/magicalpanda/following{/other_user}";
             "gists_url" = "https://api.github.com/users/magicalpanda/gists{/gist_id}";
             "gravatar_id" = "";
             "html_url" = "https://github.com/magicalpanda";
             id = 130841;
             login = magicalpanda;
             "node_id" = "MDEyOk9yZ2FuaXphdGlvbjEzMDg0MQ==";
             "organizations_url" = "https://api.github.com/users/magicalpanda/orgs";
             "received_events_url" = "https://api.github.com/users/magicalpanda/received_events";
             "repos_url" = "https://api.github.com/users/magicalpanda/repos";
             "site_admin" = 0;
             "starred_url" = "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}";
             "subscriptions_url" = "https://api.github.com/users/magicalpanda/subscriptions";
             type = Organization;
             url = "https://api.github.com/users/magicalpanda";
         };
 
         private = 0;
         "pulls_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls{/number}";
         "pushed_at" = "2018-01-31T20:15:01Z";
         "releases_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/releases{/id}";
         size = 8005;
         "ssh_url" = "git@github.com:magicalpanda/MagicalRecord.git";
         "stargazers_count" = 10762;
         "stargazers_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/stargazers";
         "statuses_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/{sha}";
         "subscribers_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/subscribers";
         "subscription_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/subscription";
         "svn_url" = "https://github.com/magicalpanda/MagicalRecord";
         "tags_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/tags";
         "teams_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/teams";
         "trees_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/trees{/sha}";
         "updated_at" = "2018-11-21T09:02:40Z";
         url = "https://api.github.com/repos/magicalpanda/MagicalRecord";
         watchers = 10762;
         "watchers_count" = 10762;
 
     };
 
     sha = 94762ad5d8f57d508fd4d6c719bdcba18a36bf27;
 
     user = {
         "avatar_url" = "https://avatars1.githubusercontent.com/u/130841?v=4";
         "events_url" = "https://api.github.com/users/magicalpanda/events{/privacy}";
         "followers_url" = "https://api.github.com/users/magicalpanda/followers";
         "following_url" = "https://api.github.com/users/magicalpanda/following{/other_user}";
         "gists_url" = "https://api.github.com/users/magicalpanda/gists{/gist_id}";
         "gravatar_id" = "";
         "html_url" = "https://github.com/magicalpanda";
         id = 130841;
         login = magicalpanda;
         "node_id" = "MDEyOk9yZ2FuaXphdGlvbjEzMDg0MQ==";
         "organizations_url" = "https://api.github.com/users/magicalpanda/orgs";
         "received_events_url" = "https://api.github.com/users/magicalpanda/received_events";
         "repos_url" = "https://api.github.com/users/magicalpanda/repos";
         "site_admin" = 0;
         "starred_url" = "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}";
         "subscriptions_url" = "https://api.github.com/users/magicalpanda/subscriptions";
         type = Organization;
         url = "https://api.github.com/users/magicalpanda";
     };
 
 };
 
 body = "";
 "closed_at" = "<null>";
 "comments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1325/comments";
 "commits_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325/commits";
 "created_at" = "2017-11-26T03:17:22Z";
 "diff_url" = "https://github.com/magicalpanda/MagicalRecord/pull/1325.diff";
 
 head = {
     label = "magicalpanda:recommended_warnings";
     ref = "recommended_warnings";
 
     repo = {
         "archive_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/{archive_format}{/ref}";
         archived = 0;
         "assignees_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/assignees{/user}";
         "blobs_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/blobs{/sha}";
         "branches_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/branches{/branch}";
         "clone_url" = "https://github.com/magicalpanda/MagicalRecord.git";
         "collaborators_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/collaborators{/collaborator}";
         "comments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/comments{/number}";
         "commits_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/commits{/sha}";
         "compare_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/compare/{base}...{head}";
         "contents_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/contents/{+path}";
         "contributors_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/contributors";
         "created_at" = "2010-07-27T23:58:18Z";
         "default_branch" = master;
         "deployments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/deployments";
         description = "Super Awesome Easy Fetching for Core Data 1!!!11!!!!1!";
         "downloads_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/downloads";
         "events_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/events";
         fork = 0;
         forks = 1874;
         "forks_count" = 1874;
         "forks_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/forks";
         "full_name" = "magicalpanda/MagicalRecord";
         "git_commits_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/commits{/sha}";
         "git_refs_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/refs{/sha}";
         "git_tags_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/tags{/sha}";
         "git_url" = "git://github.com/magicalpanda/MagicalRecord.git";
         "has_downloads" = 1;
         "has_issues" = 1;
         "has_pages" = 1;
         "has_projects" = 1;
         "has_wiki" = 1;
         homepage = "";
         "hooks_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/hooks";
         "html_url" = "https://github.com/magicalpanda/MagicalRecord";
         id = 801795;
         "issue_comment_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/comments{/number}";
         "issue_events_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/events{/number}";
         "issues_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues{/number}";
         "keys_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/keys{/key_id}";
         "labels_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/labels{/name}";
         language = "Objective-C";
         "languages_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/languages";
         license =                 {
             key = other;
             name = Other;
             "node_id" = "MDc6TGljZW5zZTA=";
             "spdx_id" = NOASSERTION;
             url = "<null>";
         };
 
         "merges_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/merges";
         "milestones_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/milestones{/number}";
         "mirror_url" = "<null>";
         name = MagicalRecord;
         "node_id" = "MDEwOlJlcG9zaXRvcnk4MDE3OTU=";
         "notifications_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/notifications{?since,all,participating}";
         "open_issues" = 285;
         "open_issues_count" = 285;
 
         owner =  {
             "avatar_url" = "https://avatars1.githubusercontent.com/u/130841?v=4";
             "events_url" = "https://api.github.com/users/magicalpanda/events{/privacy}";
             "followers_url" = "https://api.github.com/users/magicalpanda/followers";
             "following_url" = "https://api.github.com/users/magicalpanda/following{/other_user}";
             "gists_url" = "https://api.github.com/users/magicalpanda/gists{/gist_id}";
             "gravatar_id" = "";
             "html_url" = "https://github.com/magicalpanda";
             id = 130841;
             login = magicalpanda;
             "node_id" = "MDEyOk9yZ2FuaXphdGlvbjEzMDg0MQ==";
             "organizations_url" = "https://api.github.com/users/magicalpanda/orgs";
             "received_events_url" = "https://api.github.com/users/magicalpanda/received_events";
             "repos_url" = "https://api.github.com/users/magicalpanda/repos";
             "site_admin" = 0;
             "starred_url" = "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}";
             "subscriptions_url" = "https://api.github.com/users/magicalpanda/subscriptions";
             type = Organization;
             url = "https://api.github.com/users/magicalpanda";
         };
 
         private = 0;
         "pulls_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls{/number}";
         "pushed_at" = "2018-01-31T20:15:01Z";
         "releases_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/releases{/id}";
         size = 8005;
         "ssh_url" = "git@github.com:magicalpanda/MagicalRecord.git";
         "stargazers_count" = 10762;
         "stargazers_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/stargazers";
         "statuses_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/{sha}";
         "subscribers_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/subscribers";
         "subscription_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/subscription";
         "svn_url" = "https://github.com/magicalpanda/MagicalRecord";
         "tags_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/tags";
         "teams_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/teams";
         "trees_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/git/trees{/sha}";
         "updated_at" = "2018-11-21T09:02:40Z";
         url = "https://api.github.com/repos/magicalpanda/MagicalRecord";
         watchers = 10762;
         "watchers_count" = 10762;
 
    };
 
    sha = f17716b239d75f8cc584b99e558cb4b0cf6f2ba2;
 
    user = {
         "avatar_url" = "https://avatars1.githubusercontent.com/u/130841?v=4";
         "events_url" = "https://api.github.com/users/magicalpanda/events{/privacy}";
         "followers_url" = "https://api.github.com/users/magicalpanda/followers";
         "following_url" = "https://api.github.com/users/magicalpanda/following{/other_user}";
         "gists_url" = "https://api.github.com/users/magicalpanda/gists{/gist_id}";
         "gravatar_id" = "";
         "html_url" = "https://github.com/magicalpanda";
         id = 130841;
         login = magicalpanda;
         "node_id" = "MDEyOk9yZ2FuaXphdGlvbjEzMDg0MQ==";
         "organizations_url" = "https://api.github.com/users/magicalpanda/orgs";
         "received_events_url" = "https://api.github.com/users/magicalpanda/received_events";
         "repos_url" = "https://api.github.com/users/magicalpanda/repos";
         "site_admin" = 0;
         "starred_url" = "https://api.github.com/users/magicalpanda/starred{/owner}{/repo}";
         "subscriptions_url" = "https://api.github.com/users/magicalpanda/subscriptions";
         type = Organization;
         url = "https://api.github.com/users/magicalpanda";
         };
 
 };
 
 "html_url" = "https://github.com/magicalpanda/MagicalRecord/pull/1325";
 id = 154662606;
 "issue_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/issues/1325";
 labels = ();
 locked = 0;
 "merge_commit_sha" = d1637949c0fe2290b14ce1dadb7cc5e3528799e4;
 "merged_at" = "<null>";
 milestone = "<null>";
 "node_id" = MDExOlB1bGxSZXF1ZXN0MTU0NjYyNjA2;
 number = 1325;
 "patch_url" = "https://github.com/magicalpanda/MagicalRecord/pull/1325.patch";
 "requested_reviewers" = ();
 "requested_teams" = ();
 "review_comment_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/comments{/number}";
 "review_comments_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325/comments";
 state = open;
 "statuses_url" = "https://api.github.com/repos/magicalpanda/MagicalRecord/statuses/f17716b239d75f8cc584b99e558cb4b0cf6f2ba2";
 title = "recommended warnings";
 "updated_at" = "2017-11-26T03:17:22Z";
 url = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls/1325";
 user = {
     "avatar_url" = "https://avatars2.githubusercontent.com/u/839992?v=4";
     "events_url" = "https://api.github.com/users/Coeur/events{/privacy}";
     "followers_url" = "https://api.github.com/users/Coeur/followers";
     "following_url" = "https://api.github.com/users/Coeur/following{/other_user}";
     "gists_url" = "https://api.github.com/users/Coeur/gists{/gist_id}";
     "gravatar_id" = "";
     "html_url" = "https://github.com/Coeur";
     id = 839992;
     login = Coeur;
     "node_id" = "MDQ6VXNlcjgzOTk5Mg==";
     "organizations_url" = "https://api.github.com/users/Coeur/orgs";
     "received_events_url" = "https://api.github.com/users/Coeur/received_events";
     "repos_url" = "https://api.github.com/users/Coeur/repos";
     "site_admin" = 0;
     "starred_url" = "https://api.github.com/users/Coeur/starred{/owner}{/repo}";
     "subscriptions_url" = "https://api.github.com/users/Coeur/subscriptions";
     type = User;
     url = "https://api.github.com/users/Coeur";
 };

}

*/
