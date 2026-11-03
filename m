Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697903;
	b=P0io4Z+xqyuazuKkb46hvhQjiMhiDeXGva1ZukvZWY9HQ7KNMSqnZ5fI1/AQAunsnJO4
	 JcdyAshhK7ZvNxJ36ErcWfFJQdILoLQVwKJM+nMr+/uJNcA9e/qLF0HYR/KDMImK6C0Ck
	 Nk/aTy9eyA50M27GmNcWqPXr1k23P+pGtdCJcauvSFj6J33MfK6iMWfuo/fwnFuoI25pC
	 uHhFVLqhOUDBzGupRUQ6Yfyz5FiITLg80ckvAFJHNbWkHlLKyQ8nVrWYoFHcIFGtm78Da
	 ko1wnhEy2MgegVH8nXyiX7C4AUiBSCLpz0uLr3XTCRajprCZZsQ6RHebrBfTjMDkE/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697903;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=znfwk2ucOi906Els7Tq5ow5yT3CmRKhld7c73Wmlhuc=;
	b=V2viG8aAoM/zeOJLWwFuNmirZpNGR+EJZP8a8l0VEeU9HRp9l/kvhQFGeWgN5Xt6Z229
	 sNKeJBOfzGAk4PiP1uZI0mR3VMmqPdngZ3+ecG7gk+7Nw/zmueXaQpGEXwu6a/JK0aHVv
	 IW5bYP5iy+2TTX3KMLBocZtNixnEM1XfxwjgBS3N6RY4CyutVwhercMXIgBh+bOn0LX62
	 VlV184pRuYE5rLPZodNTYPdO3Agavg5cM4ug78J8qZo9yfapLKvomoqQ0+U8Z1vhz/NWu
	 Q0pcMSmmDuvdqkv7JipGXQ6ZQnhc475PiIMcg+E4cY8VGrTqOjc701fQzyP0VatYlaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YOhDyW1v;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBD606A329
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DBD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YOhDyW1v
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793697899; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=znfwk2ucOi906Els7Tq5ow5yT3CmRKhld7c73Wmlhuc=;
	b=YOhDyW1vS9s/LHcpOYsQaaDd//6JamEVYqpVndhgVpoxA1Xt/omuC9CZcTsA7ut39kNq6Pb26hm7fdPH4PKMNy8uyYyhj4Wg2iYrAMmtrhPQlGv0137X9Egexj27ppFoHU/Vu5dBVoeWvtgMVREszAjxFkIVz4xDzo8GpQlXAvQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XE2Mb2w_1793697898;
Received: from 30.74.132.52(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XE2Mb2w_1793697898 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 17:24:59 +0800
Message-ID: <155615c2-2f2b-46e5-a3ab-a332657a4bfc@linux.alibaba.com>
Date: Tue, 3 Nov 2026 17:24:57 +0800
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
Subject: Re: [PATCH] tools/mm/thpmaps: handle carriage returns and non-UTF-8
 filenames
To: sashiko-reviews@lists.linux.dev, Andrew Morton
 <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org
References: <20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org>
 <20261102085419.696232-1-tongweilin@linux.alibaba.com>
 <sashiko-outbox-194896@kernel.org>
Content-Language: en-US
From: Weilin Tong <tongweilin@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-194896@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/11/3 16:54, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] tools/mm/thpmaps: UnicodeEncodeError in vma_print() on non-UTF-8 filenames
> --
>
> commit 5f793a93e6fde4bbef2fd7ad6b6bda119aa8b288
> Author: Weilin Tong <tongweilin@linux.alibaba.com>
>
> tools/mm/thpmaps: handle carriage returns and non-UTF-8 filenames
>
> This commit updates VMAList.__init__() in tools/mm/thpmaps to open
> /proc/<pid>/smaps with newline='\n' and errors='surrogateescape' so that
> carriage returns in mapped filenames do not split header lines and
> non-UTF-8 bytes do not raise UnicodeDecodeError while reading.
>
> Link: https://lore.kernel.org/linux-mm/20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org/
>
>> diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
>> index a1a9bc30514f3..f89568bd499ec 100644
>> --- a/tools/mm/thpmaps
>> +++ b/tools/mm/thpmaps
>> @@ -196,7 +196,8 @@ class VMAList:
>>       # instance to receive VMAs.
>>       def __init__(self, pid='self', stats=[]):
>>           self.vmas = []
>> -        with open(f'/proc/{pid}/smaps', 'r') as file:
>> +        with open(f'/proc/{pid}/smaps', 'r', newline='\n',
>> +                  errors='surrogateescape') as file:
> [Severity: Medium]
> When VMAList.__init__() opens /proc/<pid>/smaps with
> errors='surrogateescape', non-UTF-8 bytes in a mapped filename are decoded
> into lone surrogate code points in vma.name.
>
> In default (non-rollup) mode, do_main() passes each VMA to vma_print():
>
> tools/mm/thpmaps:do_main() {
>      ...
>                          if args.rollup:
>                              ...
>                          else:
>                              vma_print(vma, pid)
>                              stats_print(stats, vma_anon, vma_file, args.inc_empty)
>          except (FileNotFoundError, ProcessLookupError, FileIOException):
>      ...
> }
>
> And vma_print() writes vma.name directly to sys.stdout via print():
>
> tools/mm/thpmaps:vma_print() {
>      print("{:010d}: {:016x}-{:016x} {}{}{}{} {:08x} {:02x}:{:02x} {:08x} {}"
>          .format(
>              pid, vma.start, vma.end,
>              'r' if vma.read else '-', 'w' if vma.write else '-',
>              'x' if vma.execute else '-', 'p' if vma.private else 's',
>              vma.pgoff, vma.major, vma.minor, vma.inode, vma.name
>          ))
> }
>
> Under standard UTF-8 locales, sys.stdout uses errors='strict' by default,
> which rejects lone surrogates. Doesn't printing a VMA with non-UTF-8
> filename bytes in vma_print() still terminate the script with an uncaught
> UnicodeEncodeError unless sys.stdout is also reconfigured (for example with
> errors='surrogateescape' or errors='backslashreplace') or vma.name is
> sanitized before printing?


Thanks for the report. I reproduced the failure under en_US.UTF-8.
I also confirmed that valid Unicode filenames fail when stdout uses
strict ASCII encoding.

I'll address both output encoding cases in v2 alongside the smaps
reading fixes.

Thanks,
Weilin

>
