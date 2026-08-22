Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329825B099
	for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787369277; cv=none; b=FGv6D3wAbCtqLqtzHM6M0bZfnQnDPZVm2PUfqoU+D8SxDBSXxlKnFU3IBjrCyFJFALHFixc0YApDW12JsZg1NP5JunriYkO5Jdth3qIU/ztUlffKqjioJG69BdZ92yMz/Gfu6XUdSoxnxgov776FgcS5+UKRK6N0IjfRpvnAUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787369277; c=relaxed/simple;
	bh=r0rZITQKtQ0m93bjcwa195ZSrLZUfdfW1/mQ7LAgKJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiwuMsSEJ58PpFRBBIdxpI13vT+x6QyirJmsgLQnXYMPkzlyOjycAfCKoVBh7s4fyi3FifuyzPoAreGbxCQtGW14ymwCBpQ/u4lu19IybPCNkoc2S74RT83Cf8+C3nfKufwbKKcym3Y0ntow64o7K0nQUvHWp23nYfW7KRXg3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw67/pxy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw67/pxy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1729302a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 20:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787369275; x=1787974075; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOks5Q+WseXHaYrxJ0Gn8dlCqtIA9nboyxrTjV4SPVE=;
        b=Cw67/pxyH80x+5v6QEGT1Swp6jVxOSwo8oNb5Tlk9sbon804bDi++MXIAVf+EWlkZE
         O1cNw3+LsslYCuxluvOJmwzxcwu/NhKb0lR1l4vs345X/LrXElI9WBHlkEsQ6NwvBWtJ
         4kWKtoumAFT13G4ajc8QPBIs91twALwFJneIFShu2OAt7xyTzP068qJKWVdj6F+neF+R
         FC28IDKKHi3DpFnASbTzlvlbC8j6aFvgALoAU1S2mxlubOxoN0XZXlidlCSYPDlMAUjc
         kWh4AEZsZnQOTimyxV/Jz/V9zKD5GJJ2EQIgfIUeAiAVdfakqYQ4yc4ErNR5PVwAI9yJ
         zEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787369275; x=1787974075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOks5Q+WseXHaYrxJ0Gn8dlCqtIA9nboyxrTjV4SPVE=;
        b=sF2Vv9rX3rQ55e0aunVhuFvokbo16Vptp+wdiJsb9ltW5X0//O3iBLwud7ZHaHqJX4
         j4WtK4V96M5ylIqZDaJaDNAx+9hKFugGPbIIifu70HjBJc5UmG4ng1SfeNguVcoqj+ii
         ye7lRsM9Sa8Khzf3v3PS7WqLofM92nmxwtgKe4cJ8OgkRLI18XiJmfbW8D4v1y5ZOS4w
         oeSzE9di5QsOMM661BdLksSyQMe9sB2hp835vX5qcWq1z4u1e0qcx9UJPYV1tucKiyGF
         RSqUzhjCcc940ccsRSwvEEnv9j019dVzHU+L4lVoTHIl31m7Y/buo1QmOPm4KozKXRC+
         NL8A==
X-Gm-Message-State: AFuF++lm/um9Io5tanQoeOcmHgonCaMr4kAZkC0V2X5KNcQd4PLMTWe8
	S4fHPgn527bWqCzadFuzL5gUre1onzrulj+yjBjinKLLgHHEM0gkJ7Nmt8vBxgv9TgI=
X-Gm-Gg: AR+sD106fu6N3SRKcxU3fJxGWB0z6DmkALy9hemyk+igELrpTfIXARtkaRGtmaFpa+r
	+LgvTjcLPRIhzR/ICXpBdG0cFbeK85nYebVN2yEqtplWouF01fOcK7GrjcztRm4MycLF364DSJp
	idzB/0NQZgsEvOUPHjMPD1e8eABBaK1BWBEPsYRqHe5HcqMyqm1rFGtpqE0fSH5YYo4N6T0zMPo
	QOWA9WrWVdYX7mSZCKO5kougQeJpqhPZ/F/e7AIAKOW2thhAU6ODic9jRGNjpl00uOZYIoYbLQt
	b/RWUwLj9UYZn+/qUY/IIjjjJ9WeWWJISqlU2H/6AHKODGNw05SQcjCdnR5M3xj9cOG3GglNSHE
	K3klEfvBG6U3AlSR8HXCOeihEfhpFH2fpmNqNUgourdSexhV8CprlUjMswflTbzi3Q2sWVgNmgE
	6mPzOqeqRhY+5J0Q6l5hioMhRGjo2OjTzTr4UjK+fhOq495js5whWx9E3RFD7pcLtO7FYYstRB1
	e5ebxk5
X-Received: by 2002:a17:90b:3a8d:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-395dee528b7mr5092881a91.1.1787369275158;
        Fri, 21 Aug 2026 20:27:55 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4999471sm1154921a91.8.2026.08.21.20.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 20:27:54 -0700 (PDT)
Message-ID: <f99cb0f6-5a2d-4404-8799-6a67865e2965@gmail.com>
Date: Sat, 22 Aug 2026 11:27:25 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 29/32] ext4: add tracepoints for
 DISKSIZE_GROW_PENDING set, clear, and wait
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-30-yi.zhang@huaweicloud.com>
 <20260814101826.865151F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101826.865151F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Sequence counter deadlock in tracepoint when called from softirq context on 32-bit SMP.
> --
> 
> --- Patch [29]: [PATCH -next v5 29/32] ext4: add tracepoints for DISKSIZE_GROW_PENDING set, clear, and wait ---
> commit f14aeb9661220b55cf0eeb4ff49da9fa6a2a18ca
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: add tracepoints for DISKSIZE_GROW_PENDING set, clear, and wait
>      
> This commit adds trace events ext4_iomap_mark_disksize_pending(),
> ext4_iomap_clear_disksize_pending(), and ext4_iomap_wait_disksize_pending().
> These tracepoints track disksize-grow-pending state changes and waiting.
> 
>> diff --git a/include/trace/events/ext4.h b/include/trace/events/ext4.h
>> index 69596a216dcb1..4539ef8e5f86c 100644
>> --- a/include/trace/events/ext4.h
>> +++ b/include/trace/events/ext4.h
> [ ... ]
>> +DECLARE_EVENT_CLASS(ext4_iomap_disksize_pending,
>> +	TP_PROTO(struct inode *inode),
>> +	TP_ARGS(inode),
>> +	TP_STRUCT__entry(
>> +		__field(dev_t, dev)
>> +		__field(u64, ino)
>> +		__field(loff_t, i_size)
>> +		__field(loff_t, i_disksize)
>> +	),
>> +	TP_fast_assign(
>> +		__entry->dev = inode->i_sb->s_dev;
>> +		__entry->ino = inode->i_ino;
>> +		__entry->i_size = i_size_read(inode);
> 
> [Severity: High]
> Could this cause a sequence counter deadlock on 32-bit SMP architectures?
> 
> If a process executing i_size_write() is preempted by a block I/O completion
> hardware interrupt, and pending softirqs are executed on return from the
> interrupt, the softirq could call ext4_iomap_end_bio() in fs/ext4/page-io.c:
> 
> fs/ext4/page-io.c:ext4_iomap_end_bio() {
>          ...
>          if (io_mode == EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO)
>                  ext4_iomap_clear_disksize_pending(ioend->io_inode);
>          ...
> }
> 
> This would trigger trace_ext4_iomap_clear_disksize_pending() which calls
> i_size_read() here in TP_fast_assign.
> 
> Since i_size_write() disables preemption but not softirqs, the seqcount
> would be odd. This would cause i_size_read() to spin indefinitely waiting
> for the interrupted i_size_write() to complete on the same CPU.
> 

Yeah, I'll remove the i_size check in the next version. It doesn't
look like we really need it.

Thanks,
Yi.

>> +		__entry->i_disksize = READ_ONCE(EXT4_I(inode)->i_disksize);
>> +	),
>> +	TP_printk("dev %d:%d ino %llu i_size %lld i_disksize %lld",
>> +		  MAJOR(__entry->dev), MINOR(__entry->dev),
>> +		  __entry->ino, __entry->i_size, __entry->i_disksize)
>> +);
> 

