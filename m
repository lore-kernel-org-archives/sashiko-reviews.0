Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677304;
	b=HecktQHI6IF0Do4LumSqNMW8ZzsRy401x3ckdIRDmjm3SBmPJE3EPo0wV/yiJhFtufnB
	 rUuwbGATZZ5R4X60pRnTmEugrM9IJas3X/rxsusH4TQnru5O9x60JkykAzaIRBvVhujyk
	 nKvIgeNrZhYzLPh4ym0jVre0g1usnUuRxRA+LZ3kJiC4wdhi8G94SzpQoVFdbyhM4lttq
	 52zIQoTmpmQ05O9jHCAh1rFSLE6NfDchpp4uOhSMAYN43su0XH/rrmltDne/0dEqbbQhZ
	 FDILiB6N2J4hjiYUzjHgA0AoLvccVyO3/+qRkYiZwirOyXGwNHkNsRbXSahIVy1CbZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677304;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5BsMfkeVKf6/6NYf7cNfBlIy3p+cOAo6iw/vAUH7MuQ=;
	b=jfgg11Tfg2VBzgStlY3Rw7bSDWRwHA6FhMzu9EK2P1JIcQXUNej+XVXmVw9nz1UxBlDV
	 c1t7FD48GzwGVk5g9iN4LdDstrGgAm9WV65Z4feLh6ayXOmYL3YTZdrZHhyjPud9OZ2MY
	 4EuTI09YcdnnofPJzzWfZh5R55u0tqFlxFWml23lwkyeFews/hEpUYLD81QLKJgZJNYQq
	 OoLtydxI8KPdJ1FxLI8oLuloVhsA4uLFbfoxZTzYoZXY0Bw6dMLS0wld543KV4L9lafI9
	 mRolfrxmF/efPlLghCaWuT97NLUsudfRw2WfPsucq5PDiM5a7bKi4QJ9jeo3YiCdHQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bUnEFeJh;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06ED606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 13:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bUnEFeJh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5BsMfkeVKf6/6NYf7cNfBlIy3p+cOAo6iw/vAUH7MuQ=;
	b=bUnEFeJhvTvLaGQ7vxP7lTuip+fpR+DdwpzyXeA0QFVyDJK+e+aBLyOPKgqAuXeSDqOYnZJTC
	SvGneUVLre54SAXGzyL7Ce+Wk3gdRhihD4ig3AjbADb+BktfGiSO7RbLZ+owPrVLM4gGbB0pmyj
	v8+6/16qu0dGwHowdvqDfUA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j9SMM1jYmzpSvH;
	Thu, 22 Oct 2026 21:54:55 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D55B40538;
	Thu, 22 Oct 2026 21:54:57 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 22 Oct 2026 21:54:56 +0800
Subject: Re: [PATCH v2] ubifs: zero stale data beyond EOF before file size
 grows
To: Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
	<wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
References: <9b07df29-a459-f607-e06c-07aa6b9cf290@huawei.com>
 <20261022131509.3006011-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d79ef729-5cb2-6128-7075-be95be77580c@huawei.com>
Date: Thu, 22 Oct 2026 21:54:54 +0800
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
In-Reply-To: <20261022131509.3006011-1-lin.nan@h3c.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/22 21:15, Nan Lin Ð´µÀ:
>>> Hi Cheng,
>>>
>>> Thanks for the detailed review. My responses are inline.
>>>
>>>> The filemap_lock_folio gets folio with FGP_LOCK, I think we should
>>>> use 'FGP_WRITEBEGIN | FGP_ACCESSED' just like ext4_load_tail_bh()
>>>> does, because the folio may not exist in ram when calling do_setattr().
>>>
>>> ext4_load_tail_bh() needs FGP_CREAT because in Ext4 the block behind
>>> an unwritten/delayed extent holds garbage on disk, so the zeroing must
>>> reach the media. UBIFS does not have this problem -- stale data can
>>> only live in the page cache, never on flash:
>>>
>>>     writeback:  ubifs_writepage() zeroes the straddling folio on every
>>>                 invocation and skips folios fully beyond i_size, so
>>>                 stale tails never reach the media.
>>>     read-in:    do_readpage()/read_block() zero the tails of holes and
>>>                 short data nodes, so a folio loaded from flash is always
>>>                 tail-clean.
>>>
>>> So when the EOF folio is absent from the cache, there is nothing to
>>> zero anywhere: FGP_CREAT would merely allocate a fresh (already zero)
>>> folio to zero it again. Returning early on IS_ERR() is the correct and
>>> cheaper equivalent of Ext4's path.
>>
>> There is one case makes me confused:
>> File f, isize = 0
>> 1. setattr(f, isize = 3)
>>     do_setattr -> ubifs_zero_eof_hole -> filemap_lock_folio // gets no folio and returns, nothing happens 2. pwrite(f, "123", offset = 6, len = 3)
>>     ubifs_write_begin
>>      ubifs_zero_eof_hole -> filemap_lock_folio // gets no folio and returns, nothing happens
>>      folio = __filemap_get_folio(FGP_WRITEBEGIN) // create a new folio with random content
>>      if (!folio_test_uptodate(folio))
>>        do_readpage // does nothing
>>         while (1) {
>>           ENOENT = read_block
>>         }
>>     ubifs_write_end
>>      isize = 9
>>
>>    ubifs_writepage
>>     folio content looks like
>>    | random | random | 123   |   zero       |
>>    0        3        6       9             4096
>>
> 
> do_readpage() does run here: pos(6) != folio_pos(0), so the
> skipped_read branch is not taken. With i_size = 3:
> 
>    do_readpage():
>      beyond = (3 + 4095) >> 12 = 1
>      block(0) < beyond(1) -> no early exit
>      read_block(block=0):
>        ubifs_tnc_lookup() -> -ENOENT (no data nodes yet)
Oh, I missed the folio_zero_range in read_block(), sorry for the noisy.
>        -> folio_zero_range(folio, 0, 4096)     /* whole 4K block */
>        -> return -ENOENT                       /* file.c:52-59 */
>      hole branch: err = 0, folio_set_checked(), folio_mark_uptodate()
> 
> So read_block() zeroes the full 4K block *before* returning -ENOENT. The folio VFS copies "123" into is:
> 
>    | 0 ... 0 | 123 | 0 ... 0 |
>    0         3/6   9        4096
> 
> not "| random | random | 123 |". The random bytes never survive:
> every !uptodate folio passes through do_readpage(), and read_block()
> zeroes every block whose TNC lookup returns -ENOENT.
> 
>> According to the current implementations, could above process happen?
>> If it is, I think we need to do two points:
>> 1. The folio(even not cached) zero range is necessary when setting a new
>> bigger size?       -- For 0~3 case
>> 2. The folio(even not cached) zero range is necessary when writting
>> starts after old isize?       -- For 3~6 case
>> I think zeroing the whole folio in ubifs_read_folio(ENOENT case) is a simple solution?
>>>
>>>> Why skipping 'from == 0'? What if a user writes begin from
>>>> offset-X(0<X<4096) to a new file(isize = 0)? Ext4 zero the range by
>>>> ext4_block_write_begin->folio_zero_segments(folio, to, block_end,
>>>> block_start, from), but ubifs not handle it.
>>>
>>> from == 0 means the old EOF is folio-aligned, so the EOF folio has no
>>> bytes beyond EOF and there is no hole in it:
>>>
>>>     from != 0:  |/////valid/////|stale|   <- zero [from, to)
>>>     from == 0:  |/////valid/////|         <- nothing beyond EOF here
>>>
>>> For the i_size == 0 case: a zero-size file cannot hold a polluted
>>> folio. mmap cannot create one (page_mkwrite returns SIGBUS when
>>> folio_pos >= i_size), and write() followed by ftruncate(0) invalidates
>>> the folio. The [0, X) part of the write folio itself is zeroed by the
>>> existing do_readpage() path ("block >= beyond" -> folio_zero_range()),
>>> which is UBIFS's counterpart of ext4_block_write_begin()'s
>>> folio_zero_segments() -- the work happens at folio read-in because
>>> UBIFS's block size always equals the page size.
>>>
>>
>> This question is similar with the previous one.
>>
>>>> The ext4 protection check is ext4_write_checks->ext4_block_zero_eof,
>>>> I think we can add the zero hole check in ubifs_write_iter().
>>>
>>> Agreed. This mirrors ext4_write_checks() -> ext4_block_zero_eof() and
>>> runs once per syscall instead of once per write_begin() iteration.
>>> Will move it there in v3.
>>>
>>>> If the program enters into this branch, the ubifs file's isize is not
>>>> zero, ubifs_read_folio has already zerod tail, do we still need this
>>>> folio_zero_range?
>>>> Oh, there is one case, UBIFS file has isize without data nodes(eg.
>>>> isize = 3, the first block is a data hole), ubifs_read_folio won't
>>>> zero the page tail, we still need folio_zero_range().
>>>
>>> Right -- and one more case on top of the hole-inode one: mkwrite also
>>> runs on already-cached folios, and earlier mmap stores may have
>>> re-dirtied the tail after ubifs_read_folio() cleaned it (only folios
>>> fully beyond EOF get SIGBUS; the straddling folio stays writable
>>> across its whole length). So the tail must be re-zeroed on every
>>> (re-)fault, and the folio_zero_range() stays.
>>
>> I;m still confusing about the necessary of this folio_zero_range().
>> For a hole inode(isize = 3, no data nodes), if the folio is cached, ubifs_read_folio has zerod the whole folio content(Suspend we have applied the simple solution from the previous question). The subsequent dirty setting will not write the page content after the 3rd byte to a data node.
> 
> Yes, I agree: ubifs_read_folio() zeroes the tail at read-in, and
> writeback does not persist bytes beyond EOF (the straddling folio's
> tail is zeroed and do_writepage() only writes i_size
> bytes). My concern is the cached tail of the EOF folio: a previous
> shared mapping may have modified it, and a later write fault may
> reuse the uptodate folio without calling ubifs_read_folio() again.
> The zeroing will clear that stale tail before page_mkwrite() returns.
> 
Agreed with the analysis of the multi writing processes. Anyway, user 
must be aware that he is modifying a file beyonds EOF by mmap(). The 
user should be responsible for the memory content beyonds EOF.
> This is not a general fix for read-only re-mappings, since those do
> not invoke page_mkwrite(). In this scenario, I see the hunk as a
> defensive cleanup of the cached EOF tail on a later write fault,
> rather than a fix for writeback correctness. A userspace reproducer
> may race with writeback. I'd lean toward keeping it as a defensive
> measure, but I haven't yet demonstrated a correctness issue without
> it. What do you think?
> 

Well, this is not a practical issue and will not have any impact on the 
user, and other filesystems(eg. ext4) behave like UBIFS for this case, 
so I prefer to keep the original implementation.

