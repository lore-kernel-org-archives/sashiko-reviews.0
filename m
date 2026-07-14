Received: from va-2-46.ptr.blmpb.com (va-2-46.ptr.blmpb.com [209.127.231.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224936E494
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009656; cv=none; b=GVqmWwJh7fgL254BEIqVKSCHgFtV8KKdZxR5UyW+fIBCaNQ/GRG6ducutzMy12HB8HHx6qZdXVCrxB9hTRE777tH7Mnjp8EydKFFXMNzV+Li6AjgMXppiTtF5rRMGSGhrzXIZQ2885dGXvcYe7QOBahJ4khbvdkUxnk+7J49c4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009656; c=relaxed/simple;
	bh=dxRmQOdXQ2fYbtslVMUjpZn2gv5GytLq/EMjeDfPNHw=;
	h=Content-Type:From:Message-Id:Mime-Version:To:Cc:Subject:Date:
	 Content-Disposition:In-Reply-To:References; b=NZ2Cv43008KgQzieW7n+N4c/YBj04GlcEw48j3fsMUaXVuCa38BC2UM8L5onalqjE17Y7uSmjFEMLo7oU0Q+7x2RU78crAmAOWlAEkc0xhyRbMPhhJyvEGdqOFi3bk2+7kM+2XnWrPsL83vRYbd0CjvoKNqQNfBCVkdzPOO6GP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=NV46Y87z; arc=none smtp.client-ip=209.127.231.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="NV46Y87z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784009648; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=h2kDDyA4R1iz8bA/Op/Mo9JnTpsOUBAxmXhZ+mnpboE=;
 b=NV46Y87zhnk6yUNBrvhz8sNBkMum6JkdOYGG9IrJcv/rpL3qs9YCRUrvrgvpHbYoMISTpI
 ff0GBbvASzVA8jX2VA1dsFtROFJgojbdHyO0uhzy2uWiZRdQ+O+mCf8y1xAkjl2nWGSdUN
 itnilJ6VhAaKZ7v0lRRieqh1oM7FhYjGhawiuONSoL6tDyJ4dYakJL0wk5nmE6VHA4EDrc
 kcYJ7V21Ik7Ybzh5bHRT0zijcPuk53vexkV2hca/GxozRMLDDLnxqbCLi2l8PZguafjXCn
 OzXiTsZKJimpx2janahPybBuxp4VQcKeMbdn3a48N9n9Tv/YNpcSREyaKQLbPQ==
Content-Type: text/plain; charset=UTF-8
From: "Zhaoyu Liu" <liuzhaoyu.zackary@picoheart.com>
Message-Id: <alXTqyPqSKwoOGZ6@hostpc>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a55d3af+f9e0ac+lists.linux.dev+liuzhaoyu.zackary@picoheart.com>
Received: from hostpc ([183.129.139.234]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 14:14:05 +0800
Content-Transfer-Encoding: quoted-printable
To: <sashiko-reviews@lists.linux.dev>
Cc: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] gpu: buddy: avoid repeated builds of root dfs when alloc range
Date: Tue, 14 Jul 2026 14:14:03 +0800
Content-Disposition: inline
In-Reply-To: <20260713133132.18DB21F000E9@smtp.kernel.org>
X-Original-From: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
References: <alTlW8TmTXLocWKP@hostpc> <20260713133132.18DB21F000E9@smtp.kernel.org>

On Mon, Jul 13, 2026 at 01:31:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Spurious -ENOSPC failure in __alloc_range() for fully free memor=
y ranges due to unmerged SPLIT blocks.
> --

As mentioned by AI, this is a pre-existing issue.
The reported problem is unrelated to the optimization patch we=E2=80=99re s=
ubmitting currently.
If this problem can be reproduced and confirmed as valid,
we will send a separate follow-up patch to fix it later.

Thanks,
zackary

>=20
> --- Patch [1]: [PATCH v2] gpu: buddy: avoid repeated builds of root dfs w=
hen alloc range ---
> commit 87b87afa0112d6b6bc23de2294a961d8ef1fb83e
> Author: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
>=20
> gpu: buddy: avoid repeated builds of root dfs when alloc range
>=20
> This commit optimizes the buddy allocator by avoiding wasteful repeated b=
uilds
> of the DFS list during range allocations. It introduces __get_candidate_b=
lock()
> to unify block acquisition, falling back to lazily fetching the next root=
 block
> only when the DFS list is exhausted.
>=20
> > diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> > index 3c73ae87f3c5b..72f521c51b3fa 100644
> > --- a/drivers/gpu/buddy.c
> > +++ b/drivers/gpu/buddy.c
>=20
> [ ... ]
>=20
> > @@ -1030,14 +1059,10 @@ static int __alloc_range(struct gpu_buddy *mm,
> >  		u64 block_start;
> >  		u64 block_end;
> > =20
> > -		block =3D list_first_entry_or_null(dfs,
> > -						 struct gpu_buddy_block,
> > -						 tmp_link);
> > -		if (!block)
> > +		block =3D __get_candidate_block(mm, dfs, &cursor);
> > +		if (IS_ERR(block))
> >  			break;
> > =20
> > -		list_del(&block->tmp_link);
> > -
> >  		block_start =3D gpu_buddy_block_offset(block);
> >  		block_end =3D block_start + gpu_buddy_block_size(mm, block) - 1;
>=20
> [Severity: High]
> This is a pre-existing issue, but could allocations fail spuriously in
> __alloc_range() due to unmerged SPLIT blocks?
>=20
> Looking further down in this same loop in __alloc_range():
>=20
>     if (contains(start, end, block_start, block_end)) {
>         if (gpu_buddy_block_is_free(block)) {
>             ...
>         } else if (!mm->clear_avail) {
>             err =3D -ENOSPC;
>             goto err_free;
>         }
>     }
>=20
> If a previous allocation attempt splits a large free block but fails and =
does
> not undo the splits, the parent block is left marked as SPLIT with fully =
FREE
> children.
>=20
> If the system globally has no available clear memory (mm->clear_avail =3D=
=3D 0), a
> subsequent call to __alloc_range() requesting a range that completely
> encompasses this SPLIT block will satisfy the contains() check. However,
> because the parent block is SPLIT rather than FREE, it hits the
> !mm->clear_avail condition and immediately aborts the entire allocation w=
ith
> -ENOSPC.
>=20
> Should this logic instead traverse down to allocate the perfectly free
> children instead of aborting?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/alTlW8TmTXLocWKP@=
hostpc?part=3D1
