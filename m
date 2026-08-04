Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E6395D8E
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845137; cv=none; b=HaFbYzqO0DwHk8m1Gn7mm5Jr77F28bA+f6IsOz7mVEdFwty+gSeP+zUKeEyfwT4JJU0LIxToWRXpGZTWktRXZW41cAeE4Qjk1EXX01hUHEXH+pUQ1LnqxHxT5piZz+1dyIZNGCvT8uecouexrjlQXD07aR3upv3/BjdE+ngdzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845137; c=relaxed/simple;
	bh=lWS5a5/vbedZk6oKXNGp1pkGwJ/+uxENCtn1QAoSIfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyNgWkKU2DV0NK/w9ua0Hm5n+VO9wl2qJpvk5T+W8GJfqxv+nQ4jRaDUs/WJ+Cd8Tv+G80NzKOOl/49N/H1YjNIBiBlMEek5QGoCRe+F91eSlKs4kFoPNRYGIEB+CA0aKvoo2W7/rcQnHEFau7nxY7p+s8PrkqeYiwmx8pVZCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9C2bJbV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9C2bJbV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf452def93so7595315ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845133; x=1786449933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=079VLyHFfxOwyP8NPlhu0xH/NHBE7bjJ3ljhOCK/7oo=;
        b=E9C2bJbVeqGCcLO90rxLuyyUSyIiB1HguCMbB7YZxLq5u3iS9Tza53i/eTxi1e1ruf
         vM8x2vx8HwN9rxCeJlF8v6XOklsXiaj+TKRTwXcBhimT+tkI1B6tEwhKBHER1VbMC9O1
         wR3On9iVRoyHul7Su68gwwbYIZ9rcvOLy9xOeuDbKz4kkCxdv3LDh+OAZ7Zhnd9FGOeW
         aqLAZLmX1B6/fBXATiN9tCVkOth14VPoX7T7yMscF0qHsjB54ULpA/JlFkEV2YTwb2rP
         M3VYOm9RpigvYE3ZL/eHcmuysmktP6w6XnJjSJuO/p4wZ2fVGqXl84mJw1rijTNShRIt
         zXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845133; x=1786449933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=079VLyHFfxOwyP8NPlhu0xH/NHBE7bjJ3ljhOCK/7oo=;
        b=bBYScflQfiU9owuBlZhAghcEe9uPheaojqBJ6d8wXLuez1Vo4Xrf2GEhRrChTCkic5
         IFOnvKp95EnO+Fz9F6E1HG25LYs7AL0WINs5esfkprKSIXZgBGmgjg94H+xnmYd7gHZi
         oF/jWeLVvnJ5Ka2WHNhGDir+Tvw1EumjwW1eaxlSxdVo6429dRcDqoOgp4cyLLulLG2q
         yl92KWY5cpOnBO2Ru4uanblXScQK3w4DyB+ynGGurz1zhh5DqIVADQkD55BcjyX+8kmB
         UX0i/I66frIRJwWGcY9eID24X7a07j6V1yJjBGgrGP8ysZcsqPMsxoFhV8E0kPQSAc8K
         K2CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOFu5ohK0L3AM5We3vKIgxo5yv0NKt4DvzZmfnYq2IyttC6jEqWgZVoEYTlc/NhUO2bI7oQC7++dWlOlvQ4T0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx56oV+en3guq4QPM6S7kfMj5ZtcRk9tdJ+Srg1zl7PRtCaRvaj
	DNFR48TIV6Rux9Fhdk2iX9/9b3tNBdtdgrVQuvGWJ/I59IfODtfl8hKb
X-Gm-Gg: AR+sD13MN9wsDwzjUYiI+zqRqGaCUruCT22ZT0tTZThpQYi6RuksrJa3kF+Qj2kletm
	JPbpxx8htj2PDV38rv8SKjMr47L2to+JhNrKdK4X66cYKm1lx/RCtHLVOv+th/fbApVSDY9WzJO
	IBV61EeUbihzoGVa0I3mrn+cn5/3vcIuoL0hSVbwTmOHbWSMTKQY/5I6mHro6V/itXpPhxDjhHo
	pGpYgtIky4Orcgy9wIMkP3X2PNbQuHcSEbWD6ZeFgRG33DE1/RM16etk4pk0SguWNazgGoX1WKR
	gT22xMTwwCYLSUm/x0dHvSwgTWdriq1FOq7MbrZWQ/ZnC+MouJ5z9VdDCquqsXYce7ZL228kxgT
	otE7azgD4OACx4VSly0Q0wZbJ9kWsyvSpJZSozdWjcPYiMzhuQ3rdwOTqbeDf8XqI5AWzM+bt5s
	QpGzSZ1BRyWUv08w3WjJcgxEJQf8Gl2uPW/1H3/DAlnDvFqSJWfrvjvIw0Hf4NIRmW
X-Received: by 2002:a17:903:388b:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2d08abc8099mr31104685ad.26.1785845132898;
        Tue, 04 Aug 2026 05:05:32 -0700 (PDT)
Received: from celestia ([2402:1980:935:f4a7:6f5c:e816:9aba:2090])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f936e2sm6415235ad.2.2026.08.04.05.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:05:32 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH] mm/damon: introduce damos_sort_type for re-ordering regions list
Date: Tue,  4 Aug 2026 20:05:38 +0800
Message-ID: <20260804120541.122352-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804102312.E8F8F1F000E9@smtp.kernel.org>
References: <20260804102312.E8F8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Broken `stat.nr_snapshots` tracking in `damos_apply_sorted_scheme()` bypasses `max_nr_snapshots` limit enforcement.
> - [High] Sorted schemes are evaluated out of order, violating DAMON's strict scheme priority semantics.
> - [Medium] Silent disabling of schemes when `get_scheme_score` is not supported by the underlying operation set.
> --
> 
> --- Patch [1]: [RFC PATCH] mm/damon: introduce damos_sort_type for re-ordering regions list ---
> commit 2f127c3d13c04b9a2b95946211fee29deac96c0d
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> Subject: mm/damon: introduce damos_sort_type for re-ordering regions list
> 
> This patch adds a per-scheme sysfs attribute schemes/<N>/sort_type to allow a
> scheme to apply actions to target regions in descending order of their
> ops.get_scheme_score() values.
> 
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index 644daf5a16560..b0c52c9eabe82 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> 
> [ ... ]
> 
> > @@ -2673,6 +2684,107 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
> >  	}
> >  }
> >  
> > +struct damos_sort_priv {
> > +	struct damon_ctx *c;
> > +	struct damos *s;
> > +};
> > +
> > +static int damos_sort_score_desc_cmp(const void *a, const void *b,
> > +		const void *priv)
> > +{
> 
> [ ... ]
> 
> > +}
> > +
> > +static void damos_apply_sorted_scheme(struct damon_ctx *c,
> > +		struct damon_target *t, struct damos *s)
> > +{
> > +	struct damon_region **arr;
> > +	struct damon_region *r;
> > +	struct damos_quota *quota = &s->quota;
> > +	struct damos_sort_priv priv = { .c = c, .s = s };
> > +	unsigned long nr = 0, i = 0;
> > +
> > +	if (!c->ops.get_scheme_score)
> > +		return;
> 
> [Severity: Medium]
> When the operations set does not implement get_scheme_score, does this early
> return silently disable the scheme and prevent stat.nr_snapshots from ever
> incrementing?

You are correct. The original DAMON implementation still increments
s->stat.nr_snapshots even if damos_valid_target() returns false.

I will fix this missing behavior in the next revision.

> 
> The unsorted path gracefully handles a missing score callback by falling back
> to basic filtering without the score.
> 
> > +	/* Avoid unnecessary kvmalloc_array() */
> > +	if (damos_quota_is_full(quota, c->min_region_sz))
> > +		return;
> > +
> > +	damon_for_each_region(r, t) {
> > +		if (__damos_valid_target(r, s, c))
> > +			nr++;
> > +	}
> > +	if (nr == 0)
> > +		return;
> 
> [Severity: High]
> If there are no valid regions (nr == 0), this returns early without
> incrementing s->stat.nr_snapshots. Does this prevent the scheme from ever
> reaching max_nr_snapshots and automatically deactivating?

I am somewhat uncertain about the exact semantics of nr_snapshots.

The documentation defines it as:

    "Total number of DAMON snapshots that the scheme is tried to be
    applied."

But during damon_do_apply_schemes(), nr_snapshots does not increment
unless the scheme meets the aforementioned guard conditions, regardless
of how many times it has been attempted before.

> 
> > +	if (nr == 1)
> > +		goto single_valid_region;
> > +
> > +	arr = kvmalloc_array(nr, sizeof(*arr), GFP_KERNEL);
> > +
> > +	if (!arr)
> > +		return;
> > +
> > +	damon_for_each_region(r, t) {
> > +		if (__damos_valid_target(r, s, c))
> > +			arr[i++] = r;
> > +	}
> > +
> > +	sort_r_nonatomic(arr, nr, sizeof(*arr), damos_sort_score_desc_cmp, NULL, &priv);
> > +
> > +	for (i = 0; i < nr; i++) {
> > +		r = arr[i];
> > +
> > +		/* Check the quota */
> > +		if (damos_quota_is_full(quota, c->min_region_sz))
> > +			break;
> > +
> > +		if (s->max_nr_snapshots &&
> > +				s->max_nr_snapshots <= s->stat.nr_snapshots)
> > +			continue;
> > +
> > +		if (damos_valid_target(c, r, s)) {
> > +			damos_apply_scheme(c, t, r, s);
> > +		} else {
> > +			/*
> > +			 * There is no need to continue because the score is
> > +			 * already lower than quota.min_score.
> > +			 */
> > +			break;
> 
> [Severity: High]
> If a region fails damos_valid_target() due to low quota scores, this breaks
> out of the loop and skips the (i == nr - 1) check below. Does this omit
> tracking the snapshot and prevent the scheme from deactivating?

Yes. Same as the previous answers regarding nr_snapshots.

> 
> > +		}
> > +
> > +		if (i == nr - 1)
> > +			s->stat.nr_snapshots++;
> > +	}
> > +
> > +	kvfree(arr);
> > +	return;
> > +
> > +single_valid_region:
> > +	damon_for_each_region(r, t) {
> > +		if (__damos_valid_target(r, s, c))
> > +			break;
> > +	}
> > +
> > +	/* Check the quota */
> > +	if (damos_quota_is_full(quota, c->min_region_sz))
> > +		return;
> 
> [Severity: High]
> If the quota is full in this single_valid_region fast-path, it returns early.
> Does this also bypass incrementing s->stat.nr_snapshots?

Yes. Same as the previous answers regarding nr_snapshots.

> 
> > +
> > +	if (s->max_nr_snapshots &&
> > +			s->max_nr_snapshots <= s->stat.nr_snapshots)
> > +		return;
> > +
> > +	if (damos_valid_target(c, r, s))
> > +		damos_apply_scheme(c, t, r, s);
> > +
> > +	s->stat.nr_snapshots++;
> > +}
> > +
> >  /*
> >   * damos_apply_target() - Apply DAMOS schemes to a given target.
> >   * @c:			monitoring context to apply its DAMOS schemes to..
> > @@ -2695,6 +2807,17 @@ static void damos_apply_target(struct damon_ctx *c, struct damon_target *t,
> >  		unsigned long max_region_sz)
> >  {
> >  	struct damon_region *r;
> > +	struct damos *s;
> > +
> > +	damon_for_each_scheme(s, c) {
> > +		if (s->sort_type == DAMOS_SORT_NONE)
> > +			continue;
> > +		if (!s->wmarks.activated)
> > +			continue;
> > +		if (time_before(c->passed_sample_intervals, s->next_apply_sis))
> > +			continue;
> > +		damos_apply_sorted_scheme(c, t, s);
> > +	}
> >  
> >  	damon_for_each_region(r, t) {
> >  		struct damon_region *prev_r;
> >  
> >  		damon_do_apply_schemes(c, t, r);
> 
> [Severity: High]
> By iterating and applying all sorted schemes first, and then iterating to
> apply unsorted schemes via damon_do_apply_schemes(), are we executing sorted
> schemes out of order?
> 
> DAMON evaluates schemes in the order they are defined. If a user defines an
> unsorted scheme before a sorted scheme, this two-pass execution will cause
> the sorted scheme to evaluate the regions first, breaking the execution
> order priority.

Good catch! This is indeed a bug. I will fix this in the next revision
to ensure that the scheme evaluation order strictly same as the original
one.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260804100719.116538-1-aethernet65535@gmail.com?part=1

Best regards,
Rui Yan
