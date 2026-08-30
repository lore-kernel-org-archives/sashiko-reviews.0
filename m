Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A32343BE
	for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788078581; cv=none; b=f8IO1YmoKVtAy9OHwUqcPE0gLoDpJvWicOmWvRA7U4ZN3vMxvd7QqvpqVy01yU2tcerJmM+sn72FahiXBAGY8pRCZrpt9zDH3mlxfiqGpzQkxRdg48fP9gUt0svAX+aBaYfG6a2J0P7Rmd62WM7pTt+bhdNHg1EV9kfSKNsIETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788078581; c=relaxed/simple;
	bh=to/mnFz3Sdy+MoJVCvhdKpeQX7gmxQzEWjh8Fvj0T/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b539OyyLpl365izaW95GMhqPo88hHmGBfo8oMljQIw7Qk2J6xIArhRDHAe9K6TNJ7zrGqowIjsssJSzxs6wc75GSMw69xeYpsBIlpo5NG7oAwTEHnisUWwTqsXFd4CqKfm+s73/a1WjxVvY5d698NBXhNxN9ik9/vKO4Y5ogK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpasXYGX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpasXYGX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caed617615so19202315ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788078580; x=1788683380; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nWMihv823IoDlCSZO2g9p7eWH22ZFgAcJbVXkCTWMs=;
        b=MpasXYGXvecbiFakzauvgIxsTri2oYGsDip5nGkoAK+p0skgpXxNtfXKAPjtqcu1t8
         AjHwV1xVrRg1l1KpfgRtHfpaKCUfMeinCE2b+JgBE0XndWfXPudaHy0OWhjLkA8khbbr
         j5yQxn+BtzMHs8R8jhNn26Fk32Qbu1U0i8RtLZE3zzBqOZxIo4VH7gL7ze2IhUE4tOQy
         lg4H6dFEmtU2g7ekeuuswWLvTVHdiKIxJBpsLQOsqSBP7KgnH0UXRNKwrkscL2I4ORs/
         HpBFAG8Uis2WYfSLKky8A18sqgdyi/Xe1j75JcpmkAIgXbHdyyaclJBhEIysv9VPxLDI
         V/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788078580; x=1788683380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nWMihv823IoDlCSZO2g9p7eWH22ZFgAcJbVXkCTWMs=;
        b=ILzAi/htr/7/1Bp3xz6OlN5F8A29BpYo/4jckqydHBenqwKwIUEtohCysIbeHlSMYi
         hYyhM/+QtOE4haeQw7l6GfHpG5ETbTCgGT7QPhKsWz+yixCnWAGDHL5gbxMR8ZUhn9Lf
         SHlXKzQgjGeXOdwtqhXIW9k9FCjek4/CtXKhOchqtFDRPnpKZIlutP7UOqijMV6Brjeh
         3gu79CqRt3dBRGSNvI+RwSesBpm7CipAVxhmroGdKvS8levKwBT0eYIxzwtTBGpBb9by
         A2CPnNHj0pkhhCSTP1dMPkl4IDNLFZ0lj43n+93tNg4Vu9oBQDqoBxA/aiH6R60g1w9o
         qv7g==
X-Forwarded-Encrypted: i=1; AHgh+RpT5s/t7PjYEci3WsvtSCzSuauvExFYTUHAgRJ3Yt19tWYcBg821F9y6deY+YfJ0ULdVG8wLWF6HBKL5ZY4MVc=@lists.linux.dev
X-Gm-Message-State: AFuF++kkgFsVZnGdOnRlYgwKKccsZCAYz13yijQsChcEwbCF80/F0KI8
	0JrEB6ZB53/jhxASXsasIoQsY5RVd9rvbxlM6jM+P9zOurPTxeka2PB+
X-Gm-Gg: AR+sD10WPrWJEPlP1KgYI8WaNnD6H6hhBuo684RC6QDvxB4rq7lmqFsI5OCaZOxKTDQ
	+10LLQSKy5uw5v8rwh5u4be6lyDftwObWpCPGA7ejiAfMHFQgCSA4os44/2tQAoUXoAL8P4QAww
	AsKrB8wUbSN9NlxttDy91eLCQUVxoCwzQ8lGemdfzhOkysMBIGTa+MWSQXtVqxCyd1KH5nXfXjm
	p6ktBLGKQJyfEd6AkEMpeJjBmpt7Xv4sgVwGMgMfjfQSTBNxr9dvp+QBwaEBxHDYHCPrXuC0NCQ
	Is7jPsQb3ni6HNXyEKPIP0BAyVchF/GPS/c2gSL7Lp7BPQuRGap6MkmtvI7ZDGhWBb9g/FB4riX
	gtvmoWF6r5SAxQfhKgottvLgHQQMollgbxYSu72iTtttHood1b5WGwbiycFtHvuSFpGertTrYnR
	Cv/EWTgg/0IYemm8P6B1hklXV9tpBuCvGi7itpbVYCwWzu88zkAuu04mQcsdJWzcnkcbfFbNaeL
	TKAPnN9+EwQ3RMZ
X-Received: by 2002:a17:902:e544:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d74dbfd1f1mr268597265ad.2.1788078579626;
        Sun, 30 Aug 2026 01:29:39 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986d3b7sm20854025ad.41.2026.08.30.01.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:29:39 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org,
	sj@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] mm/damon/core: fix unconditionally skip last region
Date: Sun, 30 Aug 2026 16:29:46 +0800
Message-ID: <20260830082948.18940-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830064708.40CA61F000E9@smtp.kernel.org>
References: <20260830064708.40CA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 30 Aug 2026 06:47:07 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] A preexisting bug causes DAMOS scheme application to permanently stall for all subsequent targets if `quota->charge_target_from` points to a target that becomes invalid or loses all its regions.
> --
> 
> commit 630d73d512e66245612cbdfe5c49647aa6ed2874
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> mm/damon/core: fix unconditionally skip last region
> 
> This patch fixes an issue where the last region of a tracked target could
> be unconditionally skipped and reset without being processed when a scheme
> quota is exhausted. By modifying the reset logic, it ensures the last region
> is appropriately handled rather than always skipped.
> 
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index 644daf5a16560..fb76b530bbc68 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -2342,36 +2342,39 @@ static bool damos_skip_charged_region(struct damon_target *t,
> >  {
> >  	struct damos_quota *quota = &s->quota;
> >  	unsigned long sz_to_skip;
> > +	bool skip = false;
> >  
> >  	/* Skip previously charged regions */
> >  	if (quota->charge_target_from) {
> >  		if (t != quota->charge_target_from)
> >  			return true;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this logic cause all
> subsequent targets to permanently stall if the target currently stored in
> quota->charge_target_from becomes invalid?
> 
> If the monitored process dies before the next window, kdamond_apply_schemes()
> appears to bypass it without clearing the saved target:
> 
> mm/damon/core.c:kdamond_apply_schemes() {
>     ...
> 		if (c->ops.target_valid && c->ops.target_valid(t) == false)
> 			continue;
> 		damos_apply_target(c, t, max_region_sz);
>     ...
> }
> 
> Because the target is skipped entirely, we never call damos_apply_target()
> and never reach the clearing mechanism inside damos_skip_charged_region().
> 
> When this happens, wouldn't all other valid targets continue to evaluate
> (t != quota->charge_target_from) as true here, permanently skipping scheme
> applications?
> 
> It appears a local user could reliably trigger this by setting a restrictive
> quota on a memory-intensive process they own, waiting for the quota to
> exhaust, and then terminating the process.

Thank you for pointing this out!  Yes, this can happens.

I just wrote a simple fix, this fix introduces damon_target->'bool
has_charged', which was added to prevent entering the
damon_target_remove_ref() (new function introduces by this fix) loop
every time an invalid target is encountered.  However, adding this field
may be unnecessary, or it might better to use something like 'unsigned
int charged_ref_count' instead.

'''
diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..19d46d792858 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -93,6 +93,7 @@ struct damon_region {
 struct damon_target {
 	struct pid *pid;
 	bool obsolete;
+	bool has_charged;
 /* private: */
 	/* Number of monitoring target regions of this target. */
 	unsigned int nr_regions;
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..6c14b2d4e9cd 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2630,6 +2630,7 @@ static void damos_apply_scheme(struct damon_ctx *c, struct damon_target *t,
 		if (damos_quota_is_full(quota, c->min_region_sz)) {
 			quota->charge_target_from = t;
 			quota->charge_addr_from = r->ar.end;
+			t->has_charged = true;
 		}
 	}
 	if (s->action != DAMOS_STAT)
@@ -3216,6 +3217,26 @@ static void damos_trace_stat(struct damon_ctx *c, struct damos *s)
 	trace_call__damos_stat_after_apply_interval(cidx, sidx, &s->stat);
 }
 
+static void damon_target_remove_ref(struct damon_ctx *c,
+					 struct damon_target *t)
+{
+	struct damos *s;
+
+	damon_for_each_scheme(s, c) {
+		struct damos_quota *quota = &s->quota;
+
+		if (!quota->charge_target_from)
+			continue;
+
+		if (quota->charge_target_from == t) {
+			quota->charge_target_from = NULL;
+			quota->charge_addr_from = 0;
+		}
+	}
+
+	t->has_charged = false;
+}
+
 static void kdamond_apply_schemes(struct damon_ctx *c)
 {
 	struct damon_target *t;
@@ -3241,8 +3262,11 @@ static void kdamond_apply_schemes(struct damon_ctx *c)
 	max_region_sz = damon_region_sz_limit(c);
 	mutex_lock(&c->walk_control_lock);
 	damon_for_each_target(t, c) {
-		if (c->ops.target_valid && c->ops.target_valid(t) == false)
+		if (c->ops.target_valid && c->ops.target_valid(t) == false) {
+			if (t->has_charged)
+				damon_target_remove_ref(c, t);
 			continue;
+		}
 		damos_apply_target(c, t, max_region_sz);
 	}
'''

SJ, when should this bug be fixed?  Along with this patch, or before
this patch?

> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260830063159.6347-1-aethernet65535@gmail.com?part=1

Best regards,
Rui Yan
