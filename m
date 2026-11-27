Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750250;
	b=LjagV/yVQ0R3bGsDYpXOdLUqkzjqBuavyA3ZLvAgaaqthzorjJy2Y8MqX7kL/yDa7qFV
	 p/QRqWQDRUFX+LQdoJmQAd2ju4ub1E+bbUm5ifSErtXWRbqi8YYz6f9ncAx5rl6D3qtKa
	 Lu5ZnyrNCUTsilUwo9nc1n2JeNEnVbYqeAfavk745VfN1Ama2rq+HdLb3RbUUD+aoSeDt
	 xif07InggAvONETWevyDpJ+awiNFS83MvgqQLQkOSUJD3nu29BVTgldF1Cb3He4UTn98t
	 hl7nWURVGr7TXMQP5Jcjc7YsTf54q4H/Li4En7LkF9OVeqLQcwn3lW3FKHqV3WuCe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
	b=OFgZsYinHkQziXhJQZBxnDCgFSxQx18bZvgWxbQ/x4zqsKyBxdG1LHA/FZRTqFDaWsQT
	 npFaBlyVGF9xHMWkePN+voFkjB02pm+/ZMMpKufTTkJ3XZ6NZIIxafIRGRXFNhqvkwEox
	 HIi/h7Uh+vrFPyPFdIQxuA06685e/Z/pgxch0ArgMxfhzTgvAW42F6XhJvBvFcmRDXTbT
	 1bt1JE0MsAiV0+ppJCNoSupqt7t+Xv15h59BEp4UYh5ThC9/9z0dMAybYU6XJ1IEzEfSE
	 fwtC63c5AS9qSYkYJpJ57GQ+0CG35FTiNZywtaOJgyMpB3CcXzrB5Rkr0Lr+Z2M/x/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Hm9w/6Rh";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A9606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 03:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 761A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Hm9w/6Rh
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c506187deb9so125816266b.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 19:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795750248; x=1796355048; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
        b=Hm9w/6RhSJ4GPvNQvpxVQ0/XYFpHxyoUtrm4rPcgwqzNKbaByQfPJOLkw7S7bYIwPp
         7tb4r0Cpa7Ejry/ee8dYwZ8pXqEKQIoDSNMvY8oZvHLtp9vLWHD8TWY6D0VbMNDidwQ3
         q4dLeGiffZkZvMTbvF1SU5qcOysVARW/R1DP80I9OkU3acur/eAOtDmXF3KN4mYfw2GX
         C1tN23N3QHokMb7CI3S/PnRgudjlzuFYWH2kkRgLiXhfoe6tcvMU7ZHXYT8KktgmgbgT
         EKYUiPe6aeKKcQeV8KweqyfZGL3EXxd06XKH2HTGMl5rX1UB/9tLW5hjOa4NSWUuBtRR
         OW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750248; x=1796355048;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WntL9HcIOIR5AycSmIyUOX5AWULz5zCJD14PkRWd7w=;
        b=tFGH3SzjJYyMk6IBLk6w+bASKOWovLSXUbThn1f22V3yTjr8m7LeRkSZFyV0r34Uky
         ULPGl8xRV5n1U5dgg87WEP/pDxvf7PabTCTRN4BkOiaMh2Emkrlo+psj9yPfai+E9a0V
         OyFzOwuRTCmTLhIOgDQ8VVQp59sxJJpVlH2hqWUmC4X+mnOPuAySJ4TNsryvM1PLuBup
         T/jQZIfZAtHz6WEnSe+d6pv2e11QyVRaUztyV5tW6PQRpJKoWKfLZc35BT5m0V3sDEN+
         B/31HmJDv/+I1yXIALbikr9rch86snR3llVP7sj2ma7nZ3nZOYTkMY2KxPP978lVsImH
         nBzA==
X-Forwarded-Encrypted: i=1; AL+hErG7gkkjxzYxz36jHOAPSfrX88CeoI+zZ8XHzTxE/R9diBYvshj3K/4CpAoRljuNxBmflDHjPT4jNESCf75jCPY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8qcLraf9McC+xjorVH079UubMPzkmFR/S9r+ksjONx5+lF6U10
	tNMw4BvWkMWEJsbBhQjVCpLdC0pKC0ffFAvsJ199LgfnoqISFFFalP2+LQCxn0FQtLg=
X-Gm-Gg: AZFdTZdhof4frSM0CbgAqq1lTeKWvlGeVwAunJrjOnlsYFTQJhS8xr4CL1YrUjfNbjn
	x6R13+yLqB6txt1q1ml8RaDqPlm1wpKdTg5VQ39CO+Kmll/rdE6UDbRoWmXJnRdJJBdtj7j/ny/
	bA62mer2gNOKpDn2I3NLMePmHoeQJCp45QyXeLYsZOyqIDsRPTAitDQ4WoIf2HHSR1NGWv7rv8z
	MR3a9e+phwchTNsH8qiXySQRQxSkgqucUD34biqXbTX7BoX9RIe69A6KqJl+GQSUi6J5ry9Q3hy
	b7qejh2HqumIrdjFcyDN3VhVac2TWKEyauMhTcpMpm/UYSvMNbUwE5Htgc2BKZCew6UdpRrMkQc
	hlqqgwVhYSUt05oU2Hc6Pns2e8PCDEaTACCnVKeIqziFbfdMWbroV9Lw9NZxsa/+CmamurK74l6
	29oQnGSMRko5VczaNBpc+4BqS7g14G82+yy1FfFKUyGKPySQGfvG+dmLqgW+/f9+RUhjg8CBTsi
	t6xcTQ8iR9EcQMcUkL9UYipQL5S27C/Fi9g+VQ5R5FtOqSvl68xwOQQnzhwLNzw9iBd4USF+F32
	XG9UvEAKw9HnaytVEZ3mi5Pd0sfW0AdcK4k=
X-Received: by 2002:a05:6402:a545:10b0:6b4:2960:d381 with SMTP id 4fb4d7f45d1cf-6ba37c76e50mr15405397a12.1.1795750247803;
        Thu, 26 Nov 2026 19:30:47 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm38346233a91.16.2026.11.26.19.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:30:46 -0800 (PST)
Message-ID: <97e7fc50-80ff-4c73-a3a2-7e09c9d8849c@suse.com>
Date: Fri, 27 Nov 2026 11:30:42 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v12 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: Joseph Qi <joseph.qi@linux.alibaba.com>, sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
References: <20261125154626.22335-1-heming.zhao@suse.com>
 <20261125154626.22335-4-heming.zhao@suse.com>
 <sashiko-outbox-233793@kernel.org>
 <a9224bf6-9d1b-4fdd-9980-a70c39b11b57@suse.com>
 <843bc832-5731-4f06-835c-9594c53a4cd1@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <843bc832-5731-4f06-835c-9594c53a4cd1@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/26 10:11, Joseph Qi wrote:
> 
> 
> On 11/26/26 11:07 PM, Heming Zhao wrote:
>> On 11/26/26 01:05, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 11 potential
>>> issues to consider:
>>> - [High] ocfs2: missing fsync tid and i_blocks update in
>>>     ocfs2_dio_end_io_write()
>>> - [High] ocfs2: buffered and mmap writes do not wait in
>>>     ocfs2_unwritten_check()
>>> - [High] ocfs2: ocfs2_dio_cleanup_range() fails on zeroed folios past
>>>     i_size
>>> - [High] ocfs2: missing IOMAP_F_DIRTY in ocfs2_iomap_begin() for
>>>     uncommitted metadata
>>> - [High] ocfs2: orphan entry and block leak on failed or short DIO write
>>> - [Medium] ocfs2: overestimated metadata reservation in
>>>     ocfs2_write_begin_nolock() for DIO
>>> - [Medium] ocfs2: per-cluster multi-MB allocation thrashing on ENOSPC in
>>>     ocfs2_dio_wr_map_blocks()
>>> - [Medium] ocfs2: per-cluster w_desc kvcalloc, ip_lock scans, and
>>>     duplicate lookups in DIO
>>> - [Medium] ocfs2: preallocated extents truncated in
>>>     ocfs2_dio_clear_orphan_locked()
>>> - [Medium] ocfs2: stale inode state after lock drop in
>>>     ocfs2_dio_upgrade_rw_lock()
>>> - [Medium] ocfs2: ocfs2_should_use_dio() forces buffered I/O for
>>>     sub-page DIO overwrites
>>> -- 
>>>
>>
>> It feels like the more code I modified, the more issues I introduced.
>> Furthermore, Sashko has started reporting performance issues.
>>   
> 
> I'll take a look this weekend.
> And then we discuss and come to an agreement which could be left in this
> series.
> 
> Thanks,
> Joseph
>   
> 

I will send v12.1 for fixing following issues:

- [High] ocfs2: missing fsync tid and i_blocks update in
   ocfs2_dio_end_io_write()

- [High] ocfs2: ocfs2_dio_cleanup_range() fails on zeroed folios past
   i_size

- [High] ocfs2: missing IOMAP_F_DIRTY in ocfs2_iomap_begin() for
   uncommitted metadata

- [Medium] ocfs2: overestimated metadata reservation in
   ocfs2_write_begin_nolock() for DIO

- [Medium] ocfs2: per-cluster multi-MB allocation thrashing on ENOSPC in
   ocfs2_dio_wr_map_blocks()

- [Medium] ocfs2: stale inode state after lock drop in
   ocfs2_dio_upgrade_rw_lock()

After v12.1, I will stop fixing bugs/issues until we discuss what to do next.

Thanks,
Heming
