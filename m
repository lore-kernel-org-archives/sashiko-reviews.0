Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13F33C0626
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601917; cv=none; b=tfCdGuzrkbU/KujBw4GwQIeIeCioUDtzTJKroI1IYrn2Kn6Z3x0/0qmIJdtOcAILzquWAoH9EBkgJhHa2FAtx9oxlgdEsJDzf4lxt9WQAnVMQwv0XWuBZdxbBJrxJAKbWM3jru0IVjPCe45DNU1iXbXYwg391vOUT3bZxtuNGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601917; c=relaxed/simple;
	bh=pMCtAYw/2ribP9N9uQOEDCYn6zfk2FO7q2pgAbzIqiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdJ9TX2GblrlXGZ3fF4B3P1+nLhwbdO890iic5lbQUUP+tFQocB76itp+i7HgprDAeqSexFxu1U8gSiFUv4EiV6EcRMBCkysoQ5Y9EIGSSB0Z3mYlqwLjDXAD7ADqTRyi24rFL5s4fbKX6xx2R84lp3xmr5Pa3igqSHlD8EEz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al6bQzfj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al6bQzfj"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so108289a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791601914; x=1792206714; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SHh/xa/SK2kqTvZYLL1BXzklOLAk2qI5f7ULjUB1uA=;
        b=Al6bQzfjtT8d8N6xR8SGtCBodsj564tmeh9Vz5Z7AM6b4CAI2Uvmb8PEytUIi4PVWM
         rQ57y03kUX0L5FgASYz1lb92AdYiHvzt5uMXY+iyNLRP2AWXw+Z0K4TwgAPuso5tayqW
         MnFZ8k0U4+W0It7Dzkn1NpfFaFQEFsdNl5VS/ImlsQkjKZf+0+ixZqQbe44zT8iZqegv
         RnwBkE+IZhB93ZPS6AUZs2TAokG/Qrb5vEX0sW2/QDeGIx9HJbJBshuAknTs1dbwLyu6
         uSpH1w/febkqLn6wixNpeo1LLZVUV6+4bm6/YpZ8IJfdiUl8NM3pI+gBcTIBy57rMQQv
         VM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791601914; x=1792206714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SHh/xa/SK2kqTvZYLL1BXzklOLAk2qI5f7ULjUB1uA=;
        b=dLWJiejshBin0rIJsbFcXEZ391l/mZYLQQqSnzBymN0mH7IkUXurFuVgFEsetKiCl8
         VuyW0eDlFsF3UUzSawjb8ScJKY7QR3kDkZArhux5jYcfQWzue3+Xu/vZ0eogKDs+KmlQ
         LXqDm8ZfhckxDJ/GAargaukC2MHUw6/7JoeBdsN4f5NksLKype8shFhmzKQ6MC3ptNKv
         fzm20OLSR4GaniXjf6ABu7CdD581XC2pERfqyjfpC7W+6edfljipdz3aGJnE5rFJyvsI
         WX17528GV+vz9bQnGz9RgiXbnXchuVivYM9Ai1IR+r1eMrbKZvmAHc+A/12cmtRJTsT0
         jmgg==
X-Gm-Message-State: AFq9FYKV65UIfsVWnvLJmspzlczIPUW/+AxAuW19LD0Sh2Ll+Fu70dQa
	1Lbpr0eKXPfzS1ExaH9/kFEqgu30nPN50lsu3f5Tt1sF6sxpeIK9qhtChXv85OSbSO4=
X-Gm-Gg: AYBFou3WTbapbul6lTj2zHgc76n5LYVDqaKY53RjRD6e7ZCrhtRC/3K5LryEKWiii5E
	H4ETBM6kq9TAEZs864kqbQMulgWsBly+sR94rf5DxA6lvoLe5HkT+gdym6Xksgh8BIKuKkBB9Wq
	irkxM4NiEvB3TdP4AKTdNT4pvldnk6LQ7h00336uPT8vClgwx7qf2n3w54bGgNnld3KQzpo7t90
	CStgk2Q4mdEOyv0ki7sIs0jKYSZKN5Tfe5q1+DSoRFjVBIq7cjs+z7vtjWIVGlNJV2+NGloypfY
	Kwl1AsBtJ2HPPY9wNikT46fQzEx+6kdj0voMaNWf0VqQVV+KjlewO5Jgxs2bO46VKW//boKlvbW
	IfWeLz6f6mfb2w6ptkPp1J9rBL0OpNv9q8TBRVLl2uGsqsaAXAXoB2Z2lf37fgh8DYjX0LMN+Qv
	7Q9Wkc7FgWt/ogRtvlE9pRjeo+hBnP2f0HmasXKACg2NV+nOJZn/rYsjFe/nMDOD2KkHV6hdR1O
	QUDxJDHYLTtQ1TTI2nC
X-Received: by 2002:a05:6a00:4c08:b0:891:3e34:e080 with SMTP id d2e1a72fcca58-897c6c248f5mr3380575b3a.24.1791601913966;
        Fri, 09 Oct 2026 20:11:53 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107363sm1833002b3a.20.2026.10.09.20.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:11:53 -0700 (PDT)
Message-ID: <bd4ccce7-4e42-40a5-a7fd-d5716d0080d4@gmail.com>
Date: Sat, 10 Oct 2026 11:11:32 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/31] ext4: submit and wait for pending disksize-grow
 I/O on writeback
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-23-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165347@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165347@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4: multi-second stall in rsv_conversion_wq due to skipped locked folio
> --

This is a false positive again, for the same reason as in the v6
iteration.

Thanks,
Yi.

> 
> commit effefa308fc467b9330490d20efb3b9b03f85c73
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: submit and wait for pending disksize-grow I/O on writeback
> 
> This commit introduces the ioend mechanism for the pending disksize-grow
> I/O range. It attempts to proactively submit the pending range in
> ext4_iomap_writepages() so it completes in parallel, and waits for its
> completion in the ioend finish path to avoid exposing stale data when
> advancing i_disksize.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 9c45a0c01d1c1..76e070eaa6f89 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -4404,6 +4422,36 @@ static const struct iomap_writeback_ops ext4_writeback_ops = {
>>   	.writeback_submit = ext4_iomap_writeback_submit,
>>   };
>>   
>> +/*
>> + * If the current writeback range begins after the pending zeroed EOF
>> + * block range which straddles i_disksize, issue a separate writeback to
>> + * flush it first, so as to avoid prolonged waiting.
>> + */
>> +static void ext4_iomap_wb_submit_zeroed_eof(struct inode *inode,
>> +					    struct writeback_control *wbc)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	loff_t pstart, plen, range_start;
>> +
>> +	if (wbc->range_cyclic)
>> +		range_start = (loff_t)mapping->writeback_index << PAGE_SHIFT;
>> +	else
>> +		range_start = wbc->range_start;
>> +
>> +	plen = ext4_iomap_get_disksize_pending_range(inode, &pstart);
>> +	if (!plen)
>> +		return;
>> +	if (round_down(range_start, mapping_min_folio_nrbytes(mapping)) <
>> +	    pstart + plen)
>> +		return;
>> +
>> +	/* Keep the caller's sync mode to avoid stalling the background flusher. */
>> +	if (wbc->sync_mode == WB_SYNC_ALL)
>> +		filemap_fdatawrite_range(mapping, pstart, pstart + plen - 1);
>> +	else
>> +		filemap_flush_range(mapping, pstart, pstart + plen - 1);
> 
> [Severity: High]
> Does this code risk skipping locked folios and causing a stall later?
> 
> If wbc->sync_mode is WB_SYNC_NONE, filemap_flush_range() is used, which
> skips folios that are locked by other threads without returning an error.
> If the pending zeroed EOF folio is transiently locked (for example, by a
> concurrent buffered read or write), it will be skipped and remain dirty,
> and its pending bit will not be cleared.
> 
> However, the main writeback pass will continue and submit I/O for subsequent
> folios in the file.
> 
>> +}
>> +
>>   static int ext4_iomap_writepages(struct address_space *mapping,
> [ ... ]
>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 9b0e12b5463cf..697e12a54a49a 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
> [ ... ]
>> @@ -594,6 +622,9 @@ static void ext4_iomap_finish_ioend(struct iomap_ioend *ioend)
>>   	    end <= READ_ONCE(EXT4_I(inode)->i_disksize))
>>   		goto out;
>>   
>> +	/* Wait for disksize-pending zeroed data to be written out. */
>> +	ext4_iomap_wb_disksize_pending_wait(inode, pos, size);
>> +
> 
> [Severity: High]
> Can this wait block the rsv_conversion_wq indefinitely?
> 
> When the subsequent IOs complete, ext4_iomap_finish_ioend() runs in the
> single-threaded rsv_conversion_wq. It calls
> ext4_iomap_wb_disksize_pending_wait(), which waits for the pending bit
> to be cleared.
> 
> If the pending block was silently skipped earlier by filemap_flush_range(),
> the bit will not be cleared until the skipped folio is written by a future
> writeback pass. During this time, the entire filesystem's I/O conversions
> are stalled, potentially causing massive latency spikes or deadlocking memory
> reclaim.
> 
>>   	/*
>>   	 * We may need to convert one extent, update the i_disksize and
>>   	 * dirty the inode.
> 

