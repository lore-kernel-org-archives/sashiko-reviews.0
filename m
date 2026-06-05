Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753735F192
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780700484; cv=none; b=TN68bgHJM9lvwlbQHQK8Hmdt3hVLdHdR/EHG9sApSkOgGyMWpcWKKMrH84VLwmBuKFY5hfAWE+hYVIzRvLExjC11tLIu2btAzGXJ+NdjZivJFCsCxbkOIe3yjQIk7hIXtX4VbMMh0aRQjUawvPBNMQxKKaGiBX1Jq4GpPI6EYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780700484; c=relaxed/simple;
	bh=O8GdzxxXiZ3G7l1nv/53S34k1iKnVwkdcP6Nvg3W3iM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PkosYa2GILeGXzUOKj1Q9DCzZ/ZAA6SZ/4+cWOE4frr8NxwpjR2qNAcQevekj5TcU+xLgL8F+uhu79Fpm9wxwcyQ2ZcS7GpelQIPWqll3UjLpAv3keDteCWIZ1GHrdbVg0anZLnBOgyHL/tWruat3tWLbSkLwFeMDuaXvUQfFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=sBj/XHvH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="sBj/XHvH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842307472d4so841124b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780700482; x=1781305282; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMUU/6j6qQEoXyWYhsfpILaPga52Ykc268OSJ9blCEU=;
        b=sBj/XHvHwKelS/gOMNvn++0M2PW5vFC0ImhhDPZrsv6z59JXdCAAAIQh6LSxa4yj4k
         BluG36F+ql4F0s3mjFPEI8YFfNULESzQKjZwJq7YHxVjYRkkXbLIwNoqGBhvtF/G9m5E
         AZtDAsz1MYk0FMuQ0ygcWPs8QTjWxQ1LiLzeP7Z7phTjH+CVzXt5qAmXpIFpiNmQV68e
         cYwZfhM8CF/jlp6K1/lS0UEasobrZV2kCTyVJc5L52VZc7ykoizmjHvg55Y92fF5u75F
         iHv4qf8Xp9GDV13tbeKCPeN5P4YxD9IGp82UIcxGW0V3f/q8J4KuaYSaSKnSiRgFhfFc
         Cl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780700482; x=1781305282;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMUU/6j6qQEoXyWYhsfpILaPga52Ykc268OSJ9blCEU=;
        b=EBS9Pu64ARYqAogarBCt4XMR6djvhDOv6boam32wuL6cFdSsAJLT3SCNF2W9KgPCG7
         OyW9y0aRy2k0Qx3kv9u0tAo1UZE4nJ+N2TBwkJM5AQ9DNcnhdU7EfuqDkh1lLL6AHGbz
         1fXfFyoiygYCF0w4Qn9VRgPEsSgtnpGokpZatdVxwWeI17pKPYvM1t/Ze/9tFpc3kiBw
         dGwFCw9lx5cIdUDA1+7niIbCJbFPxr7R/UrXBcIZq+NsVP92yM6YhnLbmcIX32NF9CgH
         pXaSZnfoUhBt0KvtGX3tTU4OBCxsGygbWeY68qfg8CGz3I5XRS++9P370mWnr6f3ZSQO
         ucPA==
X-Gm-Message-State: AOJu0YzfStz+DqRk+DPPt6Vw62jZynPyoE0tE6uYfkm/fQa4y5qllJDG
	uAT6ZDyFGgtq1G5rYeJvr6cTBKOpn5xjgJ0Zboh/WY6xvM7J9ZpBWKLRZ7Omxe7y+8b1ZM3262M
	KJ1h3HQhIodZT
X-Gm-Gg: Acq92OGH9UvT8iVAuoU2wrvLb+hkt05COsXMU6GZnBCt/IogUfTmvKvtlnGCc3/fyD/
	+R5KI16vZ2Oms0B1zQcpWXlrIxaDynEpo9nsPMNLMBkFXNsDhzfvNaP5KByyjXh8bvNOz+XXlTM
	YCfHnPt8ZzcCgZt1JajiN1FcxbD9DWQUff5rrgUqoJlzQuV4BcWl1VnyEJoQlTVIM1bv+ryYK4A
	Hrbe82LOlaOKF6ZwNRsPc44sAAQrrppvPqu7f5ZWg7PteplFtlRBD/9+ntFr0ahD6wmmlFPXNqH
	kgWXh8Wp/CBpOsPwiGQqtCZSPmXBHbzyDaqXb8HmjH/9hFG3Y7V0KLXLvYl1sLMZPHchqm7TmjS
	0oNJIqu6qR7Su5OXS92Wrd9ubuFA/gH8f4pW2qVKurBO/dLIVuWeFPlIwHADumYtYaw5FxQuqcd
	2VeK6dGrU+/ZexSnyGd6tGj4/wRC1awuv6UdEE80TZaL/B6g==
X-Received: by 2002:a05:6a00:338c:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-842b104d70dmr5980160b3a.35.1780700482310;
        Fri, 05 Jun 2026 16:01:22 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882751sm10488015b3a.39.2026.06.05.16.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 16:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 19:01:21 -0400
Message-Id: <DJ1HN00TAYO9.3MAYZZJMB84PJ@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 1/3] selftests/bpf: libarena: Add rbtree
 data structure
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260605222020.5231-2-emil@etsalapatis.com>
 <20260605223052.D18201F00893@smtp.kernel.org>
In-Reply-To: <20260605223052.D18201F00893@smtp.kernel.org>

On Fri Jun 5, 2026 at 6:30 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Failure to check `can_loop` termination leads to severe tree cor=
ruption, memory leaks, and NULL pointer dereferences.
> --
>
> commit 090a58da31563cb07c7562cdaaf67470a54e90c0
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> selftests/bpf: libarena: Add rbtree data structure
>
> This commit adds a native red-black tree data structure to libarena. It
> supports multiple APIs for querying and modifying the tree, and uses the
> libarena memory allocator to manage its data.
>
>> diff --git a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c b/too=
ls/testing/selftests/bpf/libarena/src/rbtree.bpf.c
>> new file mode 100644
>> index 0000000000000..0e4aaec96b6fa
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
>
> [ ... ]
>
>> +__weak
>> +int rb_destroy(struct rbtree __arena *rbtree)
>> +{
>> +	int ret =3D 0;
>> +
>> +	arena_subprog_init();
>> +
>> +	if (unlikely(!rbtree))
>> +		return -EINVAL;
>
> [ ... ]
>
>> +	while (rbtree->root && can_loop) {
>> +		ret =3D rb_remove(rbtree, rbtree->root->key);
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +out:
>> +	arena_free(rbtree);
>
> [Severity: High]
> Does this code leak memory if the loop exits early due to the can_loop
> limit being reached? If the loop aborts early, the rbtree container is fr=
eed
> even though the remaining nodes have not been removed.
>
>> +	return ret;
>> +}
>
> [ ... ]
>
>> +static
>> +struct rbnode __arena *rbnode_least_upper_bound(struct rbnode __arena *=
subtree, uint64_t key)
>> +{
>> +	struct rbnode __arena *node =3D subtree;
>> +	int dir;
>> +
>> +	if (!subtree)
>> +		return NULL;
>> +
>> +	while (can_loop) {
>> +		dir =3D (key <=3D node->key) ? 0 : 1;
>> +
>> +		if (!node->child[dir])
>> +			break;
>> +
>> +		node =3D node->child[dir];
>> +	}
>> +
>> +	return node;
>
> [Severity: High]
> If this loop terminates early because can_loop evaluates to false, will i=
t
> return an internal tree node rather than a leaf node?
>
>> +}
>
> [ ... ]
>
>> +static
>> +int rb_node_insert(struct rbtree __arena *rbtree,
>> +		   struct rbnode __arena *node)
>> +{
>> +	struct rbnode __arena *grandparent, *parent =3D rbtree->root;
>> +	u64 key =3D node->key;
>> +	struct rbnode __arena *uncle;
>> +	int dir;
>> +	int ret;
>
> [ ... ]
>
>> +	if (rbtree->insert !=3D RB_DUPLICATE)
>> +		parent =3D rbnode_find(parent, key);
>> +	else
>> +		parent =3D rbnode_least_upper_bound(parent, key);
>
> [ ... ]
>
>> +	node->parent =3D parent;
>> +	/* Also works if key =3D=3D parent->key. */
>> +	if (key <=3D parent->key)
>> +		parent->left =3D node;
>
> [Severity: High]
> If rbnode_find() or rbnode_least_upper_bound() returns an internal node
> due to a can_loop timeout, does unconditionally overwriting parent->left =
or
> parent->right here permanently detach and leak the existing subtree?
>
>> +	else
>> +		parent->right =3D node;
>
> [ ... ]
>
>> +static
>> +int rb_node_remove(struct rbtree __arena *rbtree,
>> +		   struct rbnode __arena *node)
>> +{
>> +	struct rbnode __arena *parent, *sibling, *close_nephew, *distant_nephe=
w;
>> +	bool free =3D (rbtree->alloc =3D=3D RB_ALLOC);
>> +	struct rbnode __arena *replace, *initial;
>
> [ ... ]
>
>> +	while (can_loop) {
>> +
>> +		/* Balancing reached the root, there can be no imbalance. */
>> +		if (!parent)
>> +			return 0;
>
> [ ... ]
>
>> +		sibling->is_red =3D true;
>> +		node =3D parent;
>> +		parent =3D node->parent;
>> +		dir =3D rbnode_dir(node);
>> +	}
>> +
>> +	if (node !=3D initial) {
>> +		dir =3D rbnode_dir(node);
>> +		parent =3D node->parent;
>> +		sibling =3D parent->child[1-dir];
>> +	}
>> +	/*
>> +	 * Almost there. We know between the parent, sibling,
>> +	 * and nephews only one or two of the nephews are red. If
>> +	 * it is the close one, rotate it to the sibling position,
>> +	 * paint it black, and paint the previous sibling red.
>> +	 */
>> +
>> +	close_nephew =3D sibling->child[dir];
>> +	distant_nephew =3D sibling->child[1 - dir];
>> +
>> +	/*
>> +	 * If the distant red nephew is not red, rotate
>> +	 * and repaint. We need the distant nephew
>> +	 * to be red. We know the close nephew is red
>> +	 * because at least one of them are, so the
>> +	 * distant one is black if it exists.
>> +	 */
>> +	if (!distant_nephew || !distant_nephew->is_red) {
>> +		rbnode_rotate(rbtree, sibling, 1 - dir);
>> +		sibling->is_red =3D true;
>> +		close_nephew->is_red =3D false;
>
> [Severity: High]
> Can this cause a NULL pointer dereference if the rebalancing loop above
> exits early due to can_loop?
>
> An early exit bypasses the guarantee that the sibling has red children,
> which means both nephews, including close_nephew, might be NULL here.

No. We don't care what happens if can_loop triggers. Same for the rest
of the bot feedback. The only outstanding actionable nit is imo the
mismatch between the function names in the patch description and the
actual code for spmc, for which I can send another version if necessary.

>
>> +		distant_nephew =3D sibling;
>> +		sibling =3D close_nephew;
>> +	}

