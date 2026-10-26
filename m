Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001934;
	b=LRSjKWWIoysOmgj51TFcMJPQpkBQwl6MU9ryf+mn/1uUn9rDVhoMGS/W85mnpazbHidk
	 VQpAqdW84Xnra5B+dhVmClGstGRbdTozGOsnurZbPrQRilUde+kMJjFew15j2oQo/7vp2
	 T7035Ps2V2mZ1APwy36VBHcTDoIWyG1XhHyEngMOGuN12HPj8mmHXwafUC5QbdJN8xVJS
	 sqszFgQw2FfwfZxNUnTyvJss+oHwX19j2Vj7KVFIe09jQt9ki40cgoJPWI3Q+w6+KvPPr
	 9ileuAwAtaW98jqA3QR7zUpKU9KUVYfD+zOu64G2rlcXFjgOicVC1eTYTZIaaI+IL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001934;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Cnr746bBy+0862ipN0y1HuRBMT/2NGY/EZj6rhpmL/4=;
	b=zJWc5hwCqXh4Ug94E2tqnJAlgXsRTzqR1BvNurXIVwVqGHK5hsfvdiTUmjkcmg7hI+HO
	 vn77qA7N4cL/aeKuewtqL2rb5gADXA5puKwklnKBNimKOOB3nfmyQOW7+sxMcWZqn3pvK
	 y4w5aRg0qJACtE6RmgkvNZzjBFh2E+HVLJbzadADqYx1lscbmo0s7r7rzY+D1N6qRjpxj
	 qIQ7TJLbaxBcUY36lZmUG8GWiehg84U5q5943eKnGjk4dYvzlh9UqrJJkA7GdufoKCNAv
	 G2mi9en5/x3sLRLNut/7VmZk7wXfDTikETPxj739C1f4hNXKXcjAvccCBCxqN+h7CoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=c5NaRVTl;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED83606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 08:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED83606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=c5NaRVTl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Cnr746bBy+0862ipN0y1HuRBMT/2NGY/EZj6rhpmL/4=;
	b=c5NaRVTl0NCHeCumEPuw6Iv82OdEQOw7hLf7nDb7G5AVl0JpNtZCX3cbIiGbmSxAatNdjDn03
	4aW8R/qDZgkFgxwGQGbJmDU9AtWAe+uD9mRVPlyENZ+6t7YDk6OJoyVktB3JQOsoSPPcEgmIwCH
	KSOx9GWFksaC6wA5NZrLxD8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jCmQB1Fcxz1cySd;
	Mon, 26 Oct 2026 16:05:22 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E39E40561;
	Mon, 26 Oct 2026 16:05:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 16:05:26 +0800
Subject: Re: [PATCH v3] ubifs: zero stale data beyond EOF before file size
 grows
To: <sashiko-reviews@lists.linux.dev>, Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <wangxiaoqing@h3c.com>,
	<zhou.kete@h3c.com>
References: <9380b1bc-45b6-5d95-7260-5a8dc92acc09@huawei.com>
 <20261023071141.3507024-1-lin.nan@h3c.com> <sashiko-outbox-182417@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3535aeb8-2f61-fc3d-a5a7-96d069459690@huawei.com>
Date: Mon, 26 Oct 2026 16:05:25 +0800
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
In-Reply-To: <sashiko-outbox-182417@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

在 2026/10/23 15:35, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] ubifs: unlocked ubifs_zero_eof_hole() in ubifs_write_iter() corrupts data
> --
> 
> commit f10b956c6f33e7d0c8aba1ed8f979c3d9e1197bf
> Author: Nan Lin <lin.nan@h3c.com>
> 
> ubifs: zero stale data beyond EOF before file size grows
> 
> This commit adds ubifs_zero_eof_hole() and calls it from do_setattr() and
> ubifs_write_iter() to zero stale post-EOF data in the cached old-EOF folio
> before extending a file's size.
> 
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index e73c28b12f97f..e94fbcae6d3d5 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -202,6 +202,53 @@ static void release_existing_page_budget(struct ubifs_info *c)
>>   	ubifs_release_budget(c, &req);
>>   }
>>   
>> +/**
>> + * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
>> + * @inode: inode whose size is about to grow
>> + * @new_end: new end of the file, only used to bound the tail
>> + *
>> + * Zero the cached folio containing the old EOF for [old EOF,
>> + * min(folio end, @new_end)) so a size extension does not expose stale
>> + * data left beyond EOF by mmap writes.
>> + *
>> + * Must be called without ui->ui_mutex held: we block on the old-EOF
>> + * folio lock, and ->writepage() and ->page_mkwrite() hold that folio
>> + * lock while taking ui_mutex; the reverse order deadlocks.
>> + */
>> +static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
>> +{
>> +	loff_t old_size = i_size_read(inode);
>> +	size_t from, to;
>> +	struct folio *folio;
>> +
>> +	if (new_end <= old_size)
>> +		return;
>> +
>> +	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
>> +	if (IS_ERR(folio))
>> +		return;
>> +
>> +	/*
>> +	 * Re-read i_size under the folio lock: a concurrent truncate may
>> +	 * have shrunk the file, turning this folio into valid data.
>> +	 */
>> +	old_size = i_size_read(inode);
>> +	if (new_end <= old_size)
>> +		goto out;
>> +
>> +	from = offset_in_folio(folio, old_size);
>> +	if (!from)
>> +		goto out;
>> +	to = folio_contains(folio, new_end >> PAGE_SHIFT) ?
>> +	     offset_in_folio(folio, new_end) : folio_size(folio);
>> +	if (to > from)
>> +		folio_zero_range(folio, from, to - from);
>> +
>> +out:
>> +	folio_unlock(folio);
>> +	folio_put(folio);
>> +}
> 
> [ ... ]
> 
>> @@ -1433,7 +1484,17 @@ static int update_mctime(struct inode *inode)
>>   
>>   static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   {
>> -	int err = update_mctime(file_inode(iocb->ki_filp));
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +	int err;
>> +
>> +	/*
>> +	 * The write may extend beyond EOF: zero the stale tail of the
>> +	 * old-EOF folio first.
>> +	 */
>> +	if (iocb->ki_pos > i_size_read(inode))
>> +		ubifs_zero_eof_hole(inode, iocb->ki_pos);
>> +
>> +	err = update_mctime(inode);
>>   	if (err)
>>   		return err;
> 
Hi, Nan Lin
I think the sashiko report is an effective improvement. The inode_lock 
is needed, and zero eof check should be executed after 
generic_write_checks().

> [Severity: Critical]
> Unlike do_setattr() (called with inode_lock(inode) held via notify_change())
> and ext4_buffered_write_iter() -> ext4_write_checks() ->
> ext4_block_zero_eof(), ubifs_write_iter() calls ubifs_zero_eof_hole() before
> generic_file_write_iter() acquires inode_lock(inode) and runs
> generic_write_checks(iocb, from):
> 
> mm/filemap.c:generic_file_write_iter() {
> 	inode_lock(inode);
> 	ret = generic_write_checks(iocb, from);
> 	if (ret > 0)
> 		ret = __generic_file_write_iter(iocb, from);
> 	inode_unlock(inode);
> }
> 
> Can calling ubifs_zero_eof_hole() without holding inode_lock(inode) and
> before generic_write_checks() cause data corruption and other regressions?
> 
> 1. If ubifs_zero_eof_hole() reads an initial old_size in folio 0 (for
> example, old_size = 100) and calls filemap_lock_folio() on index 0, a
> concurrent writer or extending ftruncate() holding inode_lock(inode) can
> extend inode->i_size into a later folio (for example, old_size becomes 5100
> in folio 1, while new_end is 10000 in folio 2) before folio 0 is locked.
> At that point, all of folio 0 is valid committed file data.
> 
> When ubifs_zero_eof_hole() acquires the lock on folio 0 and re-reads
> old_size = i_size_read(inode), new_end <= old_size is still false, and there
> is no check that folio_contains(folio, old_size >> PAGE_SHIFT). Computing
> from = offset_in_folio(folio, old_size) masks the new old_size into folio 0
> and calls folio_zero_range(folio, 1004, 3092) on folio 0, zeroing committed
> in-bounds file data while leaving the actual old-EOF folio (folio 1)
> unzeroed.
> 
> A concurrent shrinking truncate that moves i_size into an earlier folio
> before truncate_pagecache() evicts the locked folio will similarly zero the
> wrong folio. And if a concurrent extending ftruncate() updates i_size in
> truncate_setsize() right after ubifs_zero_eof_hole() re-reads old_size,
> userspace mmap writes to the newly in-bounds region can be overwritten by
> folio_zero_range().
> 
> 2. Because inode_lock(inode) is not held and folio_lock is dropped before
> update_mctime() (which can sleep in ubifs_budget_space()) and before
> generic_file_write_iter() locks the inode, a concurrent truncate or write can
> change i_size or an mmap write can re-dirty the post-EOF tail in the window
> between ubifs_zero_eof_hole() and __generic_file_write_iter(), leaving stale
> data beyond EOF unzeroed.
> 
> 3. Because generic_write_checks() has not run yet:
> - For O_APPEND or RWF_APPEND writes where ki_pos was positioned past EOF,
>    generic_write_checks_count() later resets iocb->ki_pos to i_size_read(inode)
>    so no hole is created, but ubifs_zero_eof_hole() has already modified the
>    page cache.
> - For zero-length writes (iov_iter_count(from) == 0) with ki_pos > i_size,
>    generic_write_checks() returns 0 without extending the file, after
>    ubifs_zero_eof_hole() has already zeroed the folio tail.
> - For RWF_NOWAIT writes (which generic_write_checks_count() rejects with
>    -EINVAL since FOP_BUFFER_WASYNC is not set) or writes failing
>    generic_write_check_limits() (-EFBIG), ubifs_zero_eof_hole() can block on
>    filemap_lock_folio() and mutate the page cache before the write is
>    rejected.
> 
> Should ubifs_write_iter() acquire inode_lock(inode) and run
> generic_write_checks() before calling update_mctime(),
> ubifs_zero_eof_hole(), and __generic_file_write_iter(), or otherwise ensure
> that ubifs_zero_eof_hole() runs under inode_lock(inode) after write checks?
> 

