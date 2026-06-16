Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B7314D15
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616098; cv=none; b=LwOSaYXLipkDVzjIUXlv+as4GxXNN4lnBlF1atNSZB143AmRwii2M++Utl1P7V0+vzTJC5jb8TOpncT0ulwEWvPh4/FUvRNCAr2jLW1AhBSx15bDYuMqjWcmJakylDi2HmEpy5OKPBdlzJfkxhon6yBXMqG842bCsUc5F+kUvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616098; c=relaxed/simple;
	bh=0TZ7NH+EJGP19g0H/NtS6vYfxblG2tynO0iJo0ipomA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPTvGN/z1vXWo1k0kL3pwbWax/O242eplHCxBRSIwpEy5L7307HyuH1a1YGiwMxFScSBOGePZyh7FQgVLUTXl12eAXjbTcJ762YdXl/WhVnJlld53dnA5g7ElvdrwEkzKRqNKbfIbApHss2vcsyTmH4XKHVEuRxDACFe2ZnWRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bgKE2Mpa; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bgKE2Mpa"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781616091; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=W7+/mEMKJ0xgJqyq27LoIyHPeNpHeD6aM4ktEY/KdPM=;
	b=bgKE2MpaOJ2+WdtKHdLJQ+54QYhYR4LmNBQVkFVXb+IJAq7xHgKu0XuGypSqba2GRWZxncdfYmL5+7RLlukcqiunBp1LEgKetdf6uB+WxnbZXtLu5REWAPPBthXeBrkGgd0ZsftfvMdB/C+7Rf5YkP15eDnv0qrBWmR262MEzLM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X5.eoj3_1781616089;
Received: from 30.221.147.255(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X5.eoj3_1781616089 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Jun 2026 21:21:30 +0800
Message-ID: <daa731cc-ad1d-44f0-ba87-aa5582af1b5d@linux.alibaba.com>
Date: Tue, 16 Jun 2026 21:21:29 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ext4: skip overwrite check for aligned non-extending
 DIO writes
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huawei.com>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Peng Wang <peng_wang@linux.alibaba.com>
References: <20260611163441.2431805-2-libaokun@linux.alibaba.com>
 <20260611164741.34A3F1F00893@smtp.kernel.org>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <20260611164741.34A3F1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/6/12 00:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch breaks NOWAIT semantics for aligned non-extending DIO writes to holes. By skipping the extent state check, NOWAIT writes bypass the `-EAGAIN` rejection and proceed to block allocation, where they unconditionally block on journal start and semaphore acquisition.
> --
>
> commit bdbf8ead96e36f6fd25f65d829a85df07b09be6a
> Author: Baokun Li <libaokun@linux.alibaba.com>
>
> ext4: skip overwrite check for aligned non-extending DIO writes
>
> This commit optimizes aligned non-extending direct I/O writes by skipping
> the ext4_overwrite_io() extent state check. It avoids unnecessary exclusive
> lock upgrades for writes spanning mixed extents, improving concurrent DIO
> performance.
>
>> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
>> index eb1a323962b10..6f3886465ce3e 100644
>> --- a/fs/ext4/file.c
>> +++ b/fs/ext4/file.c
>> @@ -460,22 +471,19 @@ static ssize_t ext4_dio_write_checks(struct kiocb *iocb, struct iov_iter *from,
>>  
>>  	unaligned_io = ext4_unaligned_io(inode, from, offset);
>>  	*extend = ext4_extending_io(inode, offset, count);
>> -	overwrite = ext4_overwrite_io(inode, offset, count, &unwritten);
>>  
>>  	/*
> [ ... ]
>> +	if (unaligned_io)
>> +		overwrite = ext4_overwrite_io(inode, offset, count, &unwritten);
>> +
>> +	/* Determine whether we need to upgrade to an exclusive lock. */
>>  	if (*ilock_shared &&
>> -	    ((!IS_NOSEC(inode) || *extend || !overwrite ||
>> -	     (unaligned_io && unwritten)))) {
>> +	    ((!IS_NOSEC(inode) || *extend ||
>> +	     (unaligned_io && (!overwrite || unwritten))))) {
>>  		if (iocb->ki_flags & IOCB_NOWAIT) {
>>  			ret = -EAGAIN;
>>  			goto out;
> [Severity: High]
> Does this change break NOWAIT semantics for aligned non-extending DIO writes
> to holes?
>
> Looking at ext4_dio_write_checks() in fs/ext4/file.c, by skipping the extent
> state check for aligned writes, it seems an aligned NOWAIT write to a hole
> will no longer trigger this -EAGAIN rejection.
>
> If the rejection is bypassed, the write will proceed to block allocation in
> ext4_iomap_alloc(), which does not check for IOMAP_NOWAIT and will
> unconditionally block on journal start and semaphore acquisition:
>
> fs/ext4/inode.c:ext4_iomap_alloc()
>     ...
>     handle = ext4_journal_start(inode, EXT4_HT_MAP_BLOCKS, dio_credits);
>     if (IS_ERR(handle))
>         return PTR_ERR(handle);
>
> Could this lead to stalled io_uring worker threads and performance
> degradation since NOWAIT operations are expected to never sleep?
>
Hi,

Sashiko reported a NOWAIT semantics breakage, which I'll address in the
next version with the following change:

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c2c2d6ac7f3d..832794294ccf 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3672,6 +3672,9 @@ static int ext4_iomap_alloc(struct inode *inode,
struct ext4_map_blocks *map,
   int ret, dio_credits, m_flags = 0, retries = 0;
   bool force_commit = false;

if (flags & IOMAP_NOWAIT)
     return -EAGAIN;


A few other NOWAIT fixes will also be included:
 - Replace file_modified with kiocb_modified
 - Wire up NOWAIT in ext4_map_blocks() (both ext4_iomap_begin and
   ext4_overwrite_io paths), reusing the existing
   EXT4_GET_BLOCKS_CACHED_NOWAIT flag


Thanks,
Baokun


