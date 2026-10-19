Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47D4A3F1B
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413517; cv=none; b=La5XwyISU+0dHvYjsPNKk8cRPMZ2LbcF0T7m3ZPUGGuUnoWFPdW2yE3yjLIBNswdBUZtl10Bvy23UID2Iy8vagm4oSbQvUrhvUMzKOYuvGqs09/U0Xm9lCDWzpdnLtibMAmuDt9vvbuJIrb3AXENsubQ4oH7iqZtIk+3pMirDJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413517; c=relaxed/simple;
	bh=7NuO0BXWJ8oGd5pJ/0Jtp/7JeXo3VmBqEqGXK+cceEk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sKbxW+tejssCbd8AX//r0r0ragMUUNquYP6kWeV/Zftsj669Cnph7NGJO7jF201w0pIrMWcdMSqPNEV9xAKgwnkWOryXtqQq96vcP8/KuzPV+83bTmD6UQcg7Bvsogpjm1ccsrKuSSAcYbaBJSx+vbeeRHg2GUWX5wUNdSRK3l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=148TH0wZ; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="148TH0wZ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6fxc93ioLjZlwRQTL7IJErarmplqIha42aoi64sf2m4=;
	b=148TH0wZjHSTsfowwXVvD5KadakJFXLmADHcwcom+P4KgFQEBzi1LNgcl+sOQ+8Q7DNz+bEf8
	zy8S6E0EpntVH6FjerLH1C9CFKyMmJo/C2oGcl6hw9TFrG8fVLE8YH0Mhwkc2zRfIZyL/pBfdqV
	eeXrkygXjMY1Ju2FwMhU178=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j7ZpM5nsZz12LCg;
	Mon, 19 Oct 2026 20:38:19 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id AE9464056D;
	Mon, 19 Oct 2026 20:38:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 19 Oct 2026 20:38:18 +0800
Subject: Re: [PATCH v2] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>, <sashiko-bot@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <sashiko-outbox-174089@kernel.org>
 <20261019032530.2212601-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e85721bd-bc6d-5937-c601-377e9494a845@huawei.com>
Date: Mon, 19 Oct 2026 20:38:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261019032530.2212601-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/19 11:25, Nan Lin Ð´µÀ:
Hi Nan Lin,
> mmap writes can dirty the page cache beyond EOF without changing
> i_size. A later extending write or ftruncate turns that region into a
> hole, but UBIFS never zeroes the partial page at the old EOF, so reads
> expose the stale data.
> 
> Zero the tail of the old-EOF folio in all three size-extending paths:
> ubifs_write_begin() for writes starting beyond EOF, do_setattr()
> before truncate_setsize() grows the size, and ubifs_vm_page_mkwrite()
> so mmap writes cannot leave such a tail behind. This mirrors what
> block_page_mkwrite() does for buffer_head filesystems and what ext4
> does on size extension.
> 
> All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
> the folio_lock -> ui_mutex order of ->writepage() and
> ->page_mkwrite(); the reverse order deadlocks.
> 
> UBIFS does not enable large folios, so the EOF folio is always a
> single page today; nevertheless, use folio-relative arithmetic
> (offset_in_folio(), folio_contains(), folio_size()) throughout so the
> code is correct if that ever changes.
> 
> Signed-off-by: Nan Lin <lin.nan@h3c.com>
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
> ---
>   fs/ubifs/file.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index e73c28b12f97..1726714161a1 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -202,6 +202,53 @@ static void release_existing_page_budget(struct ubifs_info *c)
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
> + * Must be called without ui->ui_mutex held: we block on the old-EOF
> + * folio lock, and ->writepage() and ->page_mkwrite() hold that folio
> + * lock while taking ui_mutex; the reverse order deadlocks.
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
The filemap_lock_folio gets folio with FGP_LOCK, I think we should use 
'FGP_WRITEBEGIN | FGP_ACCESSED' just like ext4_load_tail_bh() does, 
because the folio may not exist in ram when calling do_setattr().
> +
> +	/*
> +	 * Re-read i_size under the folio lock: a concurrent truncate may
> +	 * have shrunk the file, turning this folio into valid data.
> +	 */
> +	old_size = i_size_read(inode);
> +	if (new_end <= old_size)
> +		goto out;
> +
> +	from = offset_in_folio(folio, old_size);
> +	if (!from)
> +		goto out;
Why skipping 'from == 0'? What if a user writes begin from 
offset-X(0<X<4096) to a new file(isize = 0)? Ext4 zero the range by 
ext4_block_write_begin->folio_zero_segments(folio, to, block_end, 
**block_start**, **from**), but ubifs not handle it.
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
> @@ -423,6 +470,14 @@ static int ubifs_write_begin(const struct kiocb *iocb,
>   	if (unlikely(c->ro_error))
>   		return -EROFS;
>   
> +	/*
> +	 * The write starts beyond EOF: zero the stale tail of the old-EOF
> +	 * folio before budgeting takes ui->ui_mutex. do_readpage() only
> +	 * sanitizes the write folio, not the old-EOF folio.
> +	 */
> +	if (pos > inode->i_size)
> +		ubifs_zero_eof_hole(inode, pos);
> +

The ext4 protection check is ext4_write_checks->ext4_block_zero_eof, I 
think we can add the zero hole check in ubifs_write_iter().
>   	/* Try out the fast-path part first */
>   	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
>   			mapping_gfp_mask(mapping));
> @@ -1220,6 +1275,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
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
> @@ -1494,6 +1553,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
>   	struct timespec64 now = current_time(inode);
>   	struct ubifs_budget_req req = { .new_page = 1 };
>   	int err, update_time;
> +	loff_t i_size;
>   
>   	dbg_gen("ino %llu, pg %lu, i_size %lld",	inode->i_ino, folio->index,
>   		i_size_read(inode));
> @@ -1553,6 +1613,19 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
>   		filemap_dirty_folio(folio->mapping, folio);
>   	}
>   
> +	/*
> +	 * Zero the part of the EOF folio beyond i_size so mmap writes
> +	 * cannot leave a stale tail behind (see ubifs_zero_eof_hole()).
> +	 * For a folio-aligned i_size the mkwrite entry check has already
> +	 * returned SIGBUS, so @from is always non-zero here.
> +	 */
> +	i_size = i_size_read(inode);
> +	if (folio_contains(folio, i_size >> PAGE_SHIFT)) {
> +		size_t from = offset_in_folio(folio, i_size);
> +
If the program enters into this branch, the ubifs file's isize is not 
zero, ubifs_read_folio has already zerod tail, do we still need this 
folio_zero_range?
> +		folio_zero_range(folio, from, folio_size(folio) - from);
> +	}
> +
>   	if (update_time) {
>   		int release;
>   		struct ubifs_inode *ui = ubifs_inode(inode);
> 

