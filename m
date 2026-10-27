Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095860;
	b=DUdZoQ4rGs0OS63DAzbvelz9ET7HgOgCWlOGdG1X2NmVHhu0ubdDqV+bphx56K0JVdu/
	 zV8PGAMC6u3m2uOjf8+ttBv/gJlq64vAZ+4Mni4PfJZTtlwquB1xkRQT4QyzvylFj4xkz
	 mhWV0dBLUMcriGOk86lnoPqfVgrmXJsFv4InTejr5fL/Jzrowief0wmmEWYhOm6UitQn5
	 7pyi0JCa3HeVD7/6QzLQSfV5r7bMqy9aS0gUHDrUWuH4UN8CmjMSDBeeEKVarEpklamR1
	 +U0yVJERsnW4rgXgpeiUvTDdVP9h0o4ojTZBhMQSmCdJdDRVxJQIXgBuVIfO0JHluyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095860;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=D1lqTZozMscar2SRArydDD07wjY6fFTz+QkMJLLtggA=;
	b=ZFbR9TI92UeRclM7mO+5HCD/K+0WYmzwXJkzdaq67E00DnwN/UkyHbW0dOTfAsmaGhMF
	 Bl2FB+zagD60/cwcu8SkbSnqi1ftMTnLeXzrBUVDc34Kq0k5+F1lCFxz7b8WZes4c1Bw3
	 ZjZ3oslcfiJKZEqAVDN6DfrYLuIAFT3V69lMWRiRkdWmWTfHTVzBFJda3Y93fBhckqKki
	 nNhtnj/XhuqwxfbM+CvwRKeTR6Ex4Rn454v9cLOZWpIy30kgFBEqxocpNM9AKdnKYSZ57
	 EzDodGif6J4WvDoIx7c5UvAvEDQ8WnaKVDlvV4ABqgGZy4yA2p0/q35JboCBZfHK+og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wfozcFUI;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D1606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 10:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wfozcFUI
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7mCns8oF/JGvEa3tDBNQgrUGs+q1oTADhXwFuSXq1t8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793095856; v=1; x=1793700656;
 b=wfozcFUIxF6HeLyyzZq0DgS7M/8mJ9x8Y0mBYo7Vzk7I9fvdH6ns86LSVxXC0f4HYzh78HB6
 zPF2CTYUA2PxjJA5nFC3IEUZaDOsqF5igl0C8ENDLJj+Y9JTkgSfOMutwwgiHi3zcqd8n7UjXqN
 qBtJOhRrhkGJVxtS7DCxeUrE=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id ffb86d557cbfa937;
	Tue, 27 Oct 2026 10:10:56 +0000
X-Mizu-Trace-ID: ffb86d557cbfa937
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 05/16] hugetlbfs: enforce F_SEAL_EXEC in setattr
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ed59aa45-0ce8-4e5b-8a19-b5323fbe7864@kernel.org>
Date: Tue, 27 Oct 2026 18:10:34 +0800
Cc: sashiko-reviews@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Gregory Price <gourry@gourry.net>,
 Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lukas Czerner <lczerner@redhat.com>,
 Carlos Maiolino <cmaiolino@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Daniel Verkamp <dverkamp@chromium.org>,
 Jeff Xu <jeffxu@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 David Stevens <stevensd@chromium.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 linux-mm@kvack.org,
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1C8137C-D05D-440C-B143-4B5371624598@linux.dev>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <20261026-fixes_shmem-v1-5-703206d5fa0c@kernel.org>
 <sashiko-outbox-186003@kernel.org>
 <ed59aa45-0ce8-4e5b-8a19-b5323fbe7864@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 17:51, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/27/26 03:22, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
>> - [Medium] hugetlbfs: uninitialized info->seals read in =
hugetlbfs_setattr() on root dir
>> --
>>=20
>> commit dfab7a0d71278312f805e82ce52518a8ea2f538d
>> Author: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
>>=20
>> hugetlbfs: enforce F_SEAL_EXEC in setattr
>>=20
>> This patch updates hugetlbfs_setattr() to call =
memfd_check_seals_mode() when
>> ATTR_MODE is set so that fchmod() cannot modify execute bits on a =
hugetlbfs
>> memfd sealed with F_SEAL_EXEC.
>>=20
>> Link: =
https://patch.msgid.link/20260629180247.2343229-1-eva.kurchatova@virtuozzo=
.com
>>=20
>>> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
>>> index 6656807ce4377..7f5c3962b5d56 100644
>>> --- a/fs/hugetlbfs/inode.c
>>> +++ b/fs/hugetlbfs/inode.c
>>=20
>> [ ... ]
>>=20
>>> @@ -841,6 +842,13 @@ static int hugetlbfs_setattr(const struct =
mnt_idmap *idmap,
>>> if (error)
>>> return error;
>>>=20
>>> + if (ia_valid & ATTR_MODE) {
>>> + error =3D memfd_check_seals_mode(info->seals, inode->i_mode,
>>> +       attr->ia_mode);
>>> + if (error)
>>> + return error;
>>> + }
>>=20
>> [Severity: Medium]
>> Can this read uninitialized or stale slab memory from info->seals =
when
>> chmod() is called on a hugetlbfs root directory?
>>=20
>> hugetlbfs_dir_inode_operations wires .setattr to hugetlbfs_setattr(). =
Unlike
>> hugetlbfs_get_inode(), which sets info->seals =3D F_SEAL_SEAL,
>> hugetlbfs_get_root() allocates the root directory inode via =
new_inode() ->
>> hugetlbfs_alloc_inode() without initializing =
HUGETLBFS_I(inode)->seals:
>>=20
>> fs/hugetlbfs/inode.c:hugetlbfs_get_root() {
>> 	inode =3D new_inode(sb);
>> 	if (inode) {
>> ...
>> 		inode->i_op =3D &hugetlbfs_dir_inode_operations;
>> 		inode->i_fop =3D &simple_dir_operations;
>> 		HUGETLBFS_I(inode)->resv_map =3D NULL;
>> 		/* directory inodes start off with i_nlink =3D=3D 2 (for =
"." entry) */
>> 		inc_nlink(inode);
>> 		lockdep_annotate_inode_mutex_key(inode);
>> 	}
>> 	return inode;
>> }
>>=20
>> Because hugetlbfs_inode_cachep uses the init_once() slab constructor, =
which
>> only calls inode_init_once(&ei->vfs_inode), newly allocated or =
recycled
>> hugetlbfs_inode_info objects are not zeroed on allocation.
>>=20
>> Previously, hugetlbfs_setattr() only checked info->seals under =
ATTR_SIZE,
>> which is not reachable on directories. With the new ATTR_MODE check, =
changing
>> any execute/search bit on the mountpoint root directory reads =
info->seals
>> and can fail with -EPERM if the F_SEAL_EXEC bit is set in =
uninitialized
>> memory or left over from a previously freed sealed hugetlb memfd.
>>=20
>> Should hugetlbfs_get_root() also initialize HUGETLBFS_I(inode)->seals =
=3D
>> F_SEAL_SEAL?
>=20
> Shouldn't we just skip the check for directories?
>=20
>=20
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 7f5c3962b5d56..293c7965f4894 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -842,7 +842,7 @@ static int hugetlbfs_setattr(const struct =
mnt_idmap *idmap,
>        if (error)
>                return error;
>=20
> -       if (ia_valid & ATTR_MODE) {
> +       if (S_ISREG(inode->i_mode) && (ia_valid & ATTR_MODE)) {
>                error =3D memfd_check_seals_mode(info->seals, =
inode->i_mode,
>                                               attr->ia_mode);
>                if (error)
>=20
> Because sealing of directories does not apply.
>=20
> Thoughts?

Make sense to me.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David

