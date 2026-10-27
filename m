Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090420;
	b=JRHk+bHukZuMCap4kINe60Q/++U5l1wL8mpb6fjQiophn+naMTdjU6lZFkX4WvkrJelY
	 xPDmwR4xSw9YjPVuyRICu47OvFQWLDw12iF8s/e8n+oHTKTiHNty7LiMpEauRzL4MmxwN
	 +zH1JIM1AZkfL54ifoF6ZGoEtHPrMPxYlm8l8EPpYjm42QIrO8WtNCtr5il65Cm0JyseM
	 stQ8CjwyGEOri9hvfTdaSVj6LGVPzwQbZZNFH7l9vg9hxp6tWNyL1VxBWk/jAjDynSRKK
	 cmZEadgHLI4yseYMyre+N+90jGh4fVSalccS5Vy4yskThkz4j5GQxGcxokNOmq8F2Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090420;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dEUMA+v6R68CAwNDCvh/sXJcOeG92Dey9ccxulz6V5I=;
	b=MEE2QPH1KYKKklzgPk/kU6EfTEAODqEZGUOPCkCWokYxL9rT++AxUXIjYI0sqLoYjf6D
	 6jSmfNAV/mAlw0lI7v5DpXB50TaV7+HEUxcJZLJXZKMufPUMAq2IG6gJ69mohUgXsE/+9
	 0PLVWBL/iaQaXezDKnT84xQO8MSg4ino26MFQQJY76XKKUch6Rv6AKJ4BMBIZ6E66Nl1T
	 PRlX+K1h08pWQjZ10MMoLTtC5f0z8VJUVTi+RiiyZmh8KIhlr57duI0iUbcV/wTo4w1u7
	 d07D69oaM1po0zBn3J6X2t90LcWEzG0RRxraYEDKsBpUbv/+YfNSRZ5UDmrpSq/BtvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="K/c8gj8J";
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681A606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D681A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=K/c8gj8J
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dEUMA+v6R68CAwNDCvh/sXJcOeG92Dey9ccxulz6V5I=;
	b=K/c8gj8JYshqDOVmIoV5rTx2+KW/NYjSOUn2iSFcfljWnak4hqBLjLKKm+P9lvl7K9TZ8YrHR
	2aWO3S2sCqf79Y3W70o285U9WkM/GaBf/2eOJdZm/tyXvkJ12h50CWx7MewMPJFTxEANn7ZkNPL
	/nWTlD1tXyri+43AnC/xLbM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jDP7m0j1QzpSt7;
	Tue, 27 Oct 2026 16:40:04 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id C76234057F;
	Tue, 27 Oct 2026 16:40:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 16:40:13 +0800
Subject: Re: [PATCH v5] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
 <20261027080536.3569047-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5d2101bc-92a1-d633-fd8c-e491fcecb5c0@huawei.com>
Date: Tue, 27 Oct 2026 16:40:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027080536.3569047-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/27 16:05, Nan Lin Ð´µÀ:
> mmap writes can dirty the page cache beyond EOF without changing
> i_size. A later extending write or ftruncate turns that region into a
> hole, but UBIFS never zeroes the partial page at the old EOF, so reads
> expose the stale data.
> 
> Zero the tail of the cached old-EOF folio in both size-extending
> paths: ubifs_write_iter() for writes starting beyond EOF, and
> do_setattr() before truncate_setsize() grows the size. This mirrors
> what ext4 does on size extension;
> 
> Restructure ubifs_write_iter() to match ext4_buffered_write_iter():
> acquire inode_lock, perform write checks, call file_remove_privs() for
> setuid/setgid clearing (UBIFS sets S_NOCMTIME so file_modified() is a
> no-op), update mtime/ctime via update_mctime(), zero the EOF hole,
> then execute the write with generic_perform_write(). This ensures
> proper serialization and security handling.
> 
> All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
> the folio_lock -> ui_mutex order of ->writepage(); the reverse order
> deadlocks.
> 
> UBIFS does not enable large folios, so the EOF folio is always a
> single page today; nevertheless, use folio-relative arithmetic
> (offset_in_folio(), folio_contains(), folio_size()) throughout so the
> code is correct if that ever changes.
> 
> Signed-off-by: Nan Lin <lin.nan@h3c.com>
> 
> Changes since v4:
>   - Use file_remove_privs() instead of kiocb_modified(), as UBIFS sets
>     S_NOCMTIME making file_modified() a no-op (suggested by
>     Zhihao Cheng).
> 
> Changes since v3:
>   - Add inode_lock and move zero-eof after generic_write_checks(),
>     matching ext4_buffered_write_iter structure
>     (suggested by Sashiko AI review & Zhihao Cheng).
>   - Add kiocb_modified() for setuid/setgid clearing.
>   - Keep explicit update_mctime() as UBIFS sets S_NOCMTIME.
> 
> Changes since v2:
>   - Move the extending-write check from ubifs_write_begin() to
>     ubifs_write_iter(), mirroring ext4_write_checks() ->
>     ext4_block_zero_eof(): the hole zeroing runs once per write()
>     syscall instead of once per ->write_begin() iteration (suggested
>     by Zhihao Cheng).
>   - Drop the ubifs_vm_page_mkwrite() zeroing: like ext4
>     (ext4_block_write_begin() with len = i_size - folio_pos),
>     ->page_mkwrite() does not zero the tail beyond EOF, and mmap
>     writes past EOF are the user's responsibility (suggested by
>     Zhihao Cheng).
> 
> Changes since v1:
>   - Both zeroing sites used PAGE_SIZE-relative arithmetic
>     (offset_in_page()-style) while folio_zero_range() expects
>     folio-relative offsets. UBIFS does not currently enable large
>     folios, so PAGE_SIZE == folio_size() and the two coincide in
>     practice, but switch to offset_in_folio()/folio_size() anyway so
>     the code is correct if UBIFS ever opts into large folios
>     (suggested by Sashiko AI review).
> 
> Note: The short-copy issue in ubifs_write_end() where i_size may
> advance to pos + len on partial copies is pre-existing UBIFS behavior,
> not introduced by this patch. It affects all buffered writes and
> involves write_end() budget/ui_mutex handling; worth a dedicated
> analysis/patch but outside the scope of this fix.
> ---
>   fs/ubifs/file.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 76 insertions(+), 4 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index e73c28b12f97..534e93793744 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -202,6 +202,44 @@ static void release_existing_page_budget(struct ubifs_info *c)
>   	ubifs_release_budget(c, &req);
>   }
>   
> +/**
> + * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
> + * @inode: inode whose size is about to grow
> + * @new_end: new end of the file, only used to bound the tail
> + *
> + * Zero the cached folio containing the old EOF for [old EOF,
> + * min(folio end, @new_end)) so a size extension does not expose stale
> + * data left beyond EOF by mmap writes.
> + *
> + * Context: inode_lock held, ui_mutex not held.  The old-EOF folio_lock
> + * must nest outside ui_mutex to match ->writepage()/->page_mkwrite().
> + */
> +static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
> +{
> +	loff_t old_size = i_size_read(inode);
> +	size_t from, to;
> +	struct folio *folio;
> +
> +	if (new_end <= old_size)
> +		return;
> +
> +	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
> +	if (IS_ERR(folio))
> +		return;
> +
> +	from = offset_in_folio(folio, old_size);
> +	if (!from)
> +		goto out;
> +	to = folio_contains(folio, new_end >> PAGE_SHIFT) ?
> +	     offset_in_folio(folio, new_end) : folio_size(folio);
> +	if (to > from)
> +		folio_zero_range(folio, from, to - from);
> +
> +out:
> +	folio_unlock(folio);
> +	folio_put(folio);
> +}
> +
>   static int write_begin_slow(struct address_space *mapping,
>   			    loff_t pos, unsigned len, struct folio **foliop)
>   {
> @@ -1220,6 +1258,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>   
>   	if (attr->ia_valid & ATTR_SIZE) {
>   		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
> +
> +		/* Zero before truncate_setsize() changes i_size. */
> +		ubifs_zero_eof_hole(inode, new_size);
> +
>   		truncate_setsize(inode, new_size);
>   	}
>   
> @@ -1433,11 +1475,41 @@ static int update_mctime(struct inode *inode)
>   
>   static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   {
> -	int err = update_mctime(file_inode(iocb->ki_filp));
> -	if (err)
> -		return err;
> +	struct inode *inode = file_inode(iocb->ki_filp);
> +	ssize_t ret;
> +
> +	if (iocb->ki_flags & IOCB_NOWAIT)
> +		return -EOPNOTSUPP;
>   
> -	return generic_file_write_iter(iocb, from);
> +	inode_lock(inode);
> +
> +	ret = generic_write_checks(iocb, from);
> +	if (ret <= 0)
> +		goto out;
> +
> +	/* Clear setuid/setgid; skip file_modified() due to S_NOCMTIME. */
> +	ret = file_remove_privs(iocb->ki_filp);
> +	if (ret)
> +		goto out;
> +
> +	/* Update mtime/ctime explicitly (VFS skips it for S_NOCMTIME). */
> +	ret = update_mctime(inode);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * Zero stale data beyond old EOF if extending.  At this point
> +	 * ki_pos is final (O_APPEND/RWF_APPEND already resolved).
> +	 */
> +	if (iocb->ki_pos > i_size_read(inode))
> +		ubifs_zero_eof_hole(inode, iocb->ki_pos);
> +
> +	ret = generic_perform_write(iocb, from);
> +out:
> +	inode_unlock(inode);
> +	if (ret > 0)
> +		ret = generic_write_sync(iocb, ret);
> +	return ret;
>   }
>   
>   static bool ubifs_dirty_folio(struct address_space *mapping,
> 

