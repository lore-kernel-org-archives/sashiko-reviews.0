Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5F3469EE
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716012; cv=none; b=ToO5aY0zrNEzhyJBWHpcIu8oHHK/wpxnnAWDSGIwm+Hneo3dXbuGXaFLAyRb8SJgxHAwtZrd5wWtAX13ERsc1ljs8LLcNxIMJz6WXkPlGOTt1IclaMpZUp/OLxkrGwTLjiVq7n6bg8C5oGglWTt1kF5jc7BXe8MwEb7TUXEwU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716012; c=relaxed/simple;
	bh=TQCVbJzN093KkdDUdao1srurBeR5qvLyrNvei/7fvE4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qwBWcT00O39yF7FtokYXz2sdZ14YPplZ/7BfXIWIlRuWqFle3FCdRiCeb8mKh7XzwmjeXK9pgAPP+AbX2Ur9qBisZvHjC9h11axBz7Xrxc/PH33weZLsLTvMDvhthiW36rrlrvFi1jZcsDE0bkBEBSI5HlJ+v9oTorBdF8hbS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCSPgdKF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCSPgdKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786716010; x=1818252010;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=TQCVbJzN093KkdDUdao1srurBeR5qvLyrNvei/7fvE4=;
  b=LCSPgdKFSGMAn7oejrXXnJ/yQK5L3ny2wST/WCpEU1z260J17cchpv8I
   CfRmUiDDzWFAd2Xtq28Vi2dLl4w+927DN2DfAYwJ5//zUsGi34BgU5iFF
   48YwdEw7+oaQBl8RueLdSUPHhFbj40SRxZ+20bhi0VRkhem1Ir5U6Hba4
   gZ6AHRm2ebvke2APCH9/Ep7ML5x0U3S9PZ0k2WCM0hyw5TvEk993hnFuB
   x8atAK4DZ+R7GnIqNR7QK3VWVCNjTB/V4p5DJI0qoGr1UMxhaNKRHlIyx
   a2K7OOXPKrqluYau6I5H+yw9nGgZYSmKayHn2NkV9lxtlQm+NNEK439ny
   g==;
X-CSE-ConnectionGUID: M93R+BEQQdKys0cGsgeE+w==
X-CSE-MsgGUID: hKgfp4PnR8OVutb1pgwsfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87316338"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87316338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:00:09 -0700
X-CSE-ConnectionGUID: J+37JIwMT1i/d5Cefxbd/A==
X-CSE-MsgGUID: tBCcGRqrRruokPPv24d6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="269418457"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.164]) ([10.245.244.164])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:00:07 -0700
Message-ID: <89b0b1f748a8e971d4f066dcc51c47f167215261.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: Represent LRU bulk moves as nested sublists
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 16:00:05 +0200
In-Reply-To: <20260814134602.9AD981F000E9@smtp.kernel.org>
References: <20260814133231.3193-1-thomas.hellstrom@linux.intel.com>
	 <20260814134602.9AD981F000E9@smtp.kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-08-14 at 13:46 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] Missing cursor adjustment in `ttm_lru_bulk_move_add` when
> re-seeding an empty bulk move anchor causes recently-used resources
> to be prematurely evicted.
> - [Medium] Computing `&man->lru[j]` when `man` is NULL in
> `ttm_bulk_move_drop_cursors` invokes Undefined Behavior and will
> trigger UBSAN panics.

Both issues verified as real and reachable. Will update for v3.

Thanks,
Thomas


> --
>=20
> --- Patch [1]: [PATCH] drm/ttm: Represent LRU bulk moves as nested
> sublists ---
> commit b97657bee6dc1cddf7841bc260d33b4b040368e4
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Subject: drm/ttm: Represent LRU bulk moves as nested sublists
>=20
> This patch changes the LRU bulk move mechanism to track each group as
> a
> real nested sublist instead of ranges. Each group gets a persistent
> anchor
> node linked on the manager LRU list along with a sublist holding its
> member
> resources, simplifying cursor tracking and eliminating range-
> corruption bugs.
>=20
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/5387
>=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index 4e6d3d658d858..195f960b2d738 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>=20
> [ ... ]
>=20
> > +static void ttm_bulk_move_drop_cursors(struct ttm_device *bdev,
> > +					struct ttm_lru_bulk_move
> > *bulk)
> > +{
> > +	unsigned int i, j;
> > +
> > +	for (i =3D 0; i < TTM_NUM_MEM_TYPES; ++i) {
> > +		struct ttm_resource_manager *man =3D
> > ttm_manager_type(bdev, i);
> > +
> > +		for (j =3D 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > +			struct ttm_lru_bulk_move_pos *pos =3D &bulk-
> > >pos[i][j];
> > +			struct ttm_lru_item *lru, *next;
> > +
> > +			list_for_each_entry_safe(lru, next, &pos-
> > >sublist, link) {
> > +				struct ttm_resource_cursor
> > *cursor;
> > +
> > +				if (ttm_lru_item_is_res(lru)) {
> > +					WARN_ON_ONCE(1);
> > +					continue;
> > +				}
> > +				/*
> > +				 * This cursor descended here; its
> > main hitch
> > +				 * already sits on the manager
> > list, so just
> > +				 * detach it from this sublist.
> > +				 */
> > +				cursor =3D container_of(lru,
> > typeof(*cursor),
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > sublist_hitch);
> > +				cursor->cur_list =3D &man->lru[j];
> > +				list_del_init(&lru->link);
> > +			}
> > +			list_splice_tail_init(&pos->sublist, &man-
> > >lru[j]);
>=20
> [Severity: Medium]
> When ttm_manager_type() returns NULL for unused memory types, doesn't
> the
> pointer arithmetic &man->lru[j] result in undefined behavior?
>=20
> If the kernel is compiled with UBSAN, this can trigger a panic even
> if the
> list operations don't actually dereference the pointer. Should there
> be a
> check like if (!man) continue; before the inner loop?
>=20
> > +			list_del_init(&pos->marker.link);
> > +		}
> > +	}
> > +}
>=20
> [ ... ]
>=20
> > +/* Add the resource to a bulk_move sublist */
> > =C2=A0static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
> > =C2=A0				=C2=A0 struct ttm_resource *res)
> > =C2=A0{
> > =C2=A0	struct ttm_lru_bulk_move_pos *pos =3D
> > ttm_lru_bulk_move_pos(bulk, res);
> > +	struct ttm_resource *first =3D
> > ttm_lru_first_res_or_null(&pos->sublist);
> > +	struct ttm_buffer_object *bo =3D res->bo;
> > +	struct ttm_resource_manager *man =3D
> > +		ttm_manager_type(bo->bdev, res->mem_type);
> > =C2=A0
> > -	if (!pos->first) {
> > -		pos->first =3D res;
> > -		pos->last =3D res;
> > +	if (first) {
> > -		WARN_ON(pos->first->bo->base.resv !=3D res->bo-
> > >base.resv);
> > -		ttm_lru_bulk_move_pos_tail(pos, res);
> > +		WARN_ON(first->bo->base.resv !=3D res->bo-
> > >base.resv);
> > =C2=A0	} else {
> > +		/*
> > +		 * Group empty (first activation, or all members
> > were pinned
> > +		 * or swapped out); re-seed the anchor at the tail
> > so it
> > +		 * counts as recently used.
> > +		 */
> > +		list_move_tail(&pos->marker.link, &man->lru[bo-
> > >priority]);
> > =C2=A0	}
>=20
> [Severity: High]
> If an active LRU traversal cursor has descended into this sublist and
> all
> resources are subsequently removed, the sublist becomes empty except
> for the
> cursor's hitch.
>=20
> When a new resource is added and 'first' is NULL, we re-seed the
> anchor to
> the tail of the manager's LRU list. However, could this leave the
> descended
> cursor parked in the sublist without adjusting it?
>=20
> If ttm_lru_bulk_move_pos_adjust_cursors() is not called to detach it,
> the
> resumed traversal might immediately process and evict this newly
> added
> resource, violating the LRU guarantee.
>=20
> > +	/*
> > +	 * The resource may still be on another list (manager LRU
> > or
> > +	 * bdev->unevictable); move it unconditionally to keep
> > group
> > +	 * membership consistent.
> > +	 */
> > +	list_move_tail(&res->lru.link, &pos->sublist);
> > =C2=A0}
