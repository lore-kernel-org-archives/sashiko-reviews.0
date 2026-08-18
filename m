Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DB442370
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065857; cv=none; b=NL9g2/B72Lu1GuSWdgT0dPmp89DqjAXHrUrpwgaa5GIYq0HFThknW3XHosHysl2IP5QrDBN23ZqSyqjpl86uiyCI9i15dLOtjafN8QrDy6l33sotMEtTiIgQD5nfehDeaiUACUsyLhsnEdoJv7XiBr8hnoyFJvUhdURPNSFXh+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065857; c=relaxed/simple;
	bh=Ot/t5jxTjZvC7XADL+f6swv4cIZk8SpzpVukjiWB11o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzyRLq1bftKEl5U8T00z+0/O3YBJjHUI27EPxUInkxCi1bchbjL+q0w7U5aXYEAyIAq4OfyWDQ4pUnIoyZmD/1YGV7AS65rfbYz/fJuXSnctLbRAHQuiH7vrNhO+U4cRTxd3JrFC5pEM2200pPhpU4Cwt8AStGLhD0m1qLS4M/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PngNkD/q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PngNkD/q"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84a652535dcso17737b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065855; x=1787670655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoK9jdkq2s9TIMfxVwD9tr8LjrjLh+loBroz5RPO2Yg=;
        b=PngNkD/qU6KGmvOXjWyE6c/pJBcOw/zDwNx8uC1it2KLRMR5k8ALdYuDqAUbIivZ06
         RXF4YiTzVIgAnpSSQeWQmC2L/4h5HUX99r7wmB0TJbZCqkgJ2OxOGPYNaPY1etR4MZEf
         1voZVWnjvgZCCI1B1lvUtzPZCeIVDMJAG6Gtyz9dkVU5z72UpA62aGz+V9qDHbRkDCBU
         H+OHNhJEW+vPNHwPkPIBsxMiR9qnrBkO1YxJcV6pjX4YdAnAXoz1FKP49Mj9p6cVnEMH
         YiXpgbwTHW2sWHqD/4A99myxh9aD1+mgqBcaP4Y2ej7dYN1kUmJ8MpU8WDFLkiRsZ2Yq
         HsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065855; x=1787670655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoK9jdkq2s9TIMfxVwD9tr8LjrjLh+loBroz5RPO2Yg=;
        b=DW2vek/Ga19H2SK8GXRHQUnycfXMxGc4kf08p5flrpTBdwFKGIyqk6YqCA+/t55mKk
         YB/ra1wDzGKrF8Fzq0kLfpzbgSzmW2GImVuwQMiVBm49vZAywvnB4MVEbOeT4CqvnCcM
         TTF4RZhDofbg6xUw8jlrxUaOnrN1XXfGvSiksJJrNLJzQxkrY20pzNAKp5RvW84EjE+Z
         IPwBvgJEBRBGqOYZUhzsN5jxn6hCotbWneBDsPf1LYR+bi2iqA0A2fzeCDuORqZqZFuP
         sUl7LI0Lmp13pLAbP5jHa3EsRdO3FkPSGfltcRBIXxlFm14yRhCtvDcMLXhFtUR4CCxD
         bbvQ==
X-Gm-Message-State: AOJu0YzWKQufsvJaL8mRSe9VbUgzmkL95OjWrw7fcDquq9v+PL9kJPr8
	+eN9TNgFH0+0mGYPQ6sZwEufwFan5c463VY5I7USjX/4Bgfrmlb2HZEJa5/AhnDWiuQ=
X-Gm-Gg: AR+sD114Dn4A064RWeWaMKKJxfa1ribsZlfgqnnLi9t82B0UrnU2GDRRD2g7GpNyanU
	mD7dp4ZeP7vIm9UYWO/oh8U4JOD6goO4w5qe7ppRxqwfdngsIsh5P6CKt6X/irvHMkZbLo3t/ka
	DVzMbVjasJMTxb94RVLyTb5zzVjOQ3woJDKexFpfaHAgLgCQUjd9lMuhZC3VCydGShDZu9SWmOQ
	AcROvaAJBdkCevlkXKZiULD+5ZIODBuAPoTDgIkxmP9y7HDr5Fz9jPwId9zeJCu8ms0la0WraR0
	8r4os+eXXzHA1JomifKTiopueoOThUmihV+Y45eNuayQ8+MkfwRBUxrpOvZKtOPFkz9KoXrHP7t
	7uI6Urq9+C4KDXg9YjVj8WfF4y+xOP5k9BZE6dIklYSUMNsYTXFH6LQ3b520XXnHLiQJ3sJ9iTv
	MjlwdnNQlcXU/ASkA1JDep3PSChAgXbQGWreZ3WkSBRz3uNSvQdmZY6zN+fDDkvVkxhpHrNSNan
	lO+vDKN
X-Received: by 2002:a05:6a00:3754:b0:851:92fe:504b with SMTP id d2e1a72fcca58-85192fe58f5mr17921064b3a.7.1787065855241;
        Tue, 18 Aug 2026 08:10:55 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fc20dasm1667432b3a.46.2026.08.18.08.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 08:10:54 -0700 (PDT)
Message-ID: <330f29cb-ec4f-4f7b-b0ff-47414e1290eb@gmail.com>
Date: Tue, 18 Aug 2026 23:10:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 26/32] ext4: submit and wait for disksize-grow
 I/O in fallocate paths
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-27-yi.zhang@huaweicloud.com>
 <20260814102837.9BF8F1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814102837.9BF8F1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] In `ext4_do_fallocate` with `O_SYNC`, the fast commit can execute before the workqueue updates `i_disksize`, resulting in lost file extension on crash.
> --
> 
> --- Patch [26]: [PATCH -next v5 26/32] ext4: submit and wait for disksize-grow I/O in fallocate paths ---
> commit 918bb376bb323b629f0c4b2e5c84c055d7c4c754
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: submit and wait for disksize-grow I/O in fallocate paths
> 
> Collapse range and insert range update i_disksize directly under
> i_data_sem. If the operation runs while the zeroed EOF block is still
> awaiting writeback, i_disksize could advance past the zeroed boundary
> before the zeroed data is persisted, exposing stale data on crash.
> 
>> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
>> index fc5aa2dbefcff..dda6d50e96e30 100644
>> --- a/fs/ext4/extents.c
>> +++ b/fs/ext4/extents.c
>> @@ -4928,10 +4938,20 @@ static long ext4_do_fallocate(struct file *file, loff_t offset,
>>   	if (ret)
>>   		goto out;
>>   
>> -	if (((file->f_flags & O_SYNC) || IS_SYNC(inode)) &&
>> -	    EXT4_SB(inode->i_sb)->s_journal) {
>> -		ret = ext4_fc_commit(EXT4_SB(inode->i_sb)->s_journal,
>> -					EXT4_I(inode)->i_sync_tid);
>> +	if ((file->f_flags & O_SYNC) || IS_SYNC(inode)) {
>> +		/*
>> +		 * Sync the pending zeroed EOF block to ensure the
>> +		 * i_disksize update is persisted.
>> +		 */
>> +		if (new_size) {
>> +			ret = ext4_iomap_sync_zeroed_eof(inode, 0, LLONG_MAX);
>> +			if (ret)
>> +				goto out;
>> +		}
>> +		if (EXT4_SB(inode->i_sb)->s_journal) {
>> +			ret = ext4_fc_commit(EXT4_SB(inode->i_sb)->s_journal,
>> +						EXT4_I(inode)->i_sync_tid);
>> +		}
> 
> [Severity: High]
> Can this fast commit execute before the workqueue updates i_disksize,
> potentially losing the file extension on a crash?
> 
> Looking at the bio completion path in fs/ext4/page-io.c:ext4_iomap_end_bio():
> 
> 	if (io_mode == EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO)
> 		ext4_iomap_clear_disksize_pending(ioend->io_inode);
> 	
> 	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
> 	if (list_empty(&ei->i_rsv_conversion_list))
> 		queue_work(EXT4_SB(ioend->io_inode->i_sb)->rsv_conversion_wq,
> 		           ...);
> 
> It appears the EXT4_STATE_DISKSIZE_GROW_PENDING flag is cleared before the
> workqueue is actually dispatched and executed.
> 
> If ext4_iomap_sync_zeroed_eof() wakes up immediately after the flag is
> cleared, could it proceed to ext4_fc_commit() before the workqueue gets a
> chance to update i_disksize?
> 
> If a crash happens right after the fast commit in this scenario, would it
> persist the inode with the old i_disksize, causing a regression by
> violating the requested O_SYNC guarantees?

Yeah, this is right. In ext4_iomap_sync_zeroed_eof(), we should
replace the filemap_fdatawrite_range() +
ext4_iomap_wait_disksize_pending() calls with just
filemap_write_and_wait_range().

Thanks,
Yi.

> 
>>   	}
>>   out:
>>   	trace_ext4_fallocate_exit(inode, offset,
> 

