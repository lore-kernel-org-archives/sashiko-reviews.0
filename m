Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076699;
	b=CLoKJEP3W3WFP3jAiobXC613SDPKZlEE410E9AGhjBb5T2FeUblneCDmxlK3S04Ty21a
	 j1bSPEpmb4tsmChup3qaSR7GIEPsgsV2QVU4UPSRTbsHSB3KaZf+fHIBSEWGmMzYTGvMh
	 UBT+nsdiyKjL2gp5YrBXBe+/VOu7NrHXTdaNvyErOH/2lbDc4EDcuNMhpqpX1iHG+2I4j
	 dbzi5qKI3j5h0d+2uR1RD4GoONSRWVaLcDYD/0DaIg7SzCYlI0ZEzU1dd7ljeZSnQQy+Q
	 Uak7CpQ0Z9rajB9u/eI/3iQUdygnRuIVn1xhwHhtyjzvQmOKXH/9gR4RfA1GGXRxiHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076699;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=cPWULbQ6woqP/NAsptXcTt6XEbFzxz3GzS+cNv09yFE=;
	b=ldaapYtS13XsPCyadFZdCRsyW5wzo6kVyllr67RchWfwZbeTMVU1466TixpL8H54taBO
	 s4QyrOVu1+1aSBgY8uiT0T7wyoFaoMksIk/pObDNS82pqMMgTtCwNFwtm4uF+CoMH7bc6
	 ICum1QcfYP/ZxX2sZ+CBRtedGemM+bYaulbYZARWxyaIzw9DRjoWDuiNwrFonbJmujAZv
	 keKew4fJvO2JrdIonBjr97ew5rTpDOpNhhwrBGdgcY706QlYDkS/YvCcNTA1+x2MlgzX3
	 qQk45hawCZSkN61Bw0Rs8g8ky7tZ/Z/XzB+PeSRjzjKCcqBa0PfHxzawu//Huw86YSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6DKvMNv3;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC6606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 04:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6DKvMNv3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cPWULbQ6woqP/NAsptXcTt6XEbFzxz3GzS+cNv09yFE=;
	b=6DKvMNv3pCI7PlnT4QSw9d6prDNgixhCpcElj/h9cw6LDcgWF/iIJoDFs20QrFCt8Vto3o2Uu
	B9CXFGP9ZANnu/pNlSEaFbDEsvD560bsGfarOXm8mtMYMNThehNu25TVWaf8p5huSvwgyZUYy6M
	ciAUBTp5slJA9FhF14ubaGM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jDJ3w3xvwz1T4GR;
	Tue, 27 Oct 2026 12:51:24 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8259C40561;
	Tue, 27 Oct 2026 12:51:32 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 12:51:31 +0800
Subject: Re: [PATCH v4] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <3535aeb8-2f61-fc3d-a5a7-96d069459690@huawei.com>
 <20261026125001.2570619-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
Date: Tue, 27 Oct 2026 12:51:30 +0800
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
In-Reply-To: <20261026125001.2570619-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/26 20:50, Nan Lin Ð´µÀ:
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
> acquire inode_lock, perform write checks, call kiocb_modified() for
> setuid/setgid clearing, update mtime/ctime via update_mctime()
> (UBIFS sets S_NOCMTIME so VFS time updates short-circuit), zero the
> EOF hole, then execute the write with generic_perform_write(). This
> ensures proper serialization and security handling.
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
> ---
>   fs/ubifs/file.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 82 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index e73c28b12f97..6f2c83b6f433 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -202,6 +202,45 @@ static void release_existing_page_budget(struct ubifs_info *c)
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
> + * Must be called with inode_lock(inode) held and without ui->ui_mutex held:
> + * we block on the old-EOF folio lock, and ->writepage() and ->page_mkwrite()
> + * hold that folio lock while taking ui_mutex; the reverse order deadlocks.
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
> @@ -1220,6 +1259,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>   
>   	if (attr->ia_valid & ATTR_SIZE) {
>   		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
> +
> +		/* Must run before the size change loses the old boundary. */
> +		ubifs_zero_eof_hole(inode, new_size);
> +
>   		truncate_setsize(inode, new_size);
>   	}
>   
> @@ -1433,11 +1476,46 @@ static int update_mctime(struct inode *inode)
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
> +
> +	inode_lock(inode);
> +
> +	ret = generic_write_checks(iocb, from);
> +	if (ret <= 0)
> +		goto out;
> +
> +	ret = kiocb_modified(iocb);
> +	if (ret)
> +		goto out;
Hi,
I think file_remove_privs() is enouth, because ubifs inode has 
S_NOCMTIME flag and the iocb->ki_flags without 'IOCB_NOWAIT'.
>   
> -	return generic_file_write_iter(iocb, from);
> +	/*
> +	 * UBIFS sets S_NOCMTIME on all inodes, so VFS's file_update_time_flags()
> +	 * short-circuits and never calls ubifs_update_time() for mtime/ctime.
> +	 * We must call update_mctime() explicitly here.
> +	 */
> +	ret = update_mctime(inode);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * If the write position is beyond EOF, zero the stale tail of the
> +	 * old-EOF folio first.  generic_write_checks() has already resolved
> +	 * O_APPEND/RWF_APPEND and rejected invalid writes, so iocb->ki_pos
> +	 * is the final write position.
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

