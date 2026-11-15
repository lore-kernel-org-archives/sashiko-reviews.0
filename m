Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794786305;
	b=rBBhJ5JSvPtzLYhLa7Le8dS0M3It1bt1rhMfhdLxA+C73QJcSupNmlq8ECawesdtvJzy
	 fwhbNrtMHFQiOSnSbY/AIcQh43hnkbLvZY6QgU8NnUbY9mjxx8jQneMqX0ZikmexMN5k4
	 orgV4M/HtB9dMNNj8Y4xITlBA9JzuSqgmK4idC+IXHIHcua8asKbu0cHKPCn9LweAMvPv
	 k9eqSthSzvgFyJQ/17MYsWVvAUooJpwnvWLX2fpXl6wFDxTXUj7oNBqH4OJClt8QGjDjG
	 y4eiw9SbxdwsxLjcBMEMEvAGEJjZKKIs2PYI2cu3iLbX19omT2l6oBxY4YadfySZQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wwQMLaf11WQtDIzK00IgyV63j2HrzneupcpyRZW3XV4=;
	b=BkOkXvFaw28LIgKWaekVHnxBgTUqryA49+5VNRVMljpPxggaITshbmMKQIdVSfHZud7q
	 oBeD3jP+NEwae6aC4tIj2AM4CVj5FPavXlLJG+Rq9Njz8i4pvbyWcqqb1027yLi5niExV
	 OSOlfXXPip/SaDZpItwOC+ewk1VFDRuFKhDNM7Ikge/+X7aj6KLGslo4do33RXNE6oeOG
	 lTkXBGzFKw1A63KlPzeLtwiVMimInfj3sviiNyZHlhWfyPQl/kUGL/OG7Fpu3/I2/jLOc
	 ksFDZWPHicWbqutQSTdiE40BShHcuPoijMkArQec5uRW/rkDvh2cthTIyDeWKXynGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LsMcVU6E;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25802606A32F
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25802606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LsMcVU6E
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb609d9bf4so3026595e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794786303; x=1795391103; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwQMLaf11WQtDIzK00IgyV63j2HrzneupcpyRZW3XV4=;
        b=LsMcVU6E83zFnPBGsC3PQj+0lZfczONlWCHPrvQSOb4CJhbXyqelRkAYctz+O8UvC6
         gO8YEzO9X6SQ6kBIK09lBOLX2TKI/Fbfqg9yvu3VxfUYgPN427ate/IqKTLgIwfhXxI5
         8bK3NuTHQXB98cT4JIDo+J250q2PpRTBhi0fLYn+px/KBDd6EkuzlcJQ42FnUvmwbQ0L
         reXrGy4x4qgDciSuJUbI4Nc7nHCWYdsFJQVW8P45p0cJzl0mgzqMdz3m7rmAnrzJXlLr
         v/ImtPVQTv+IsgteeF+RkNDeER3P4COeGvQIRSgv0OzKmHFRDt8KbjzeRSHlkwmnqmIZ
         WMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786303; x=1795391103;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwQMLaf11WQtDIzK00IgyV63j2HrzneupcpyRZW3XV4=;
        b=AwsxHVhNu3Npn6WAZN/6wRHCYNlSzWr9TpzdXQSDhPYSJJ65sOC0K0RfOkWddL0fUO
         q4OhwjdOXsQtXnrlfd2QjGqMdNZ0JC5F7P0QkUxBYQ4/uLiV4gc008bfRMSH1VKQ6XRe
         ZGWlic7l29C4If3ev4NXw9wGkPwXhCU3jPy1E+AKm+nvZwFYM/4huZ/KrGqLwdZDUW91
         L3va7o4JdjiQVaZtE2PLzs3p6MZBVhjKdxP3uCdcqsy9AtZaZq6eUt72ejeE0r4M5Qrx
         IMu1mHga9F8IGOZLM/K9KBjB9c1lShHfmvl+kktUByMIol0ibsKUFka6TLHmSXQm+MMO
         r4Nw==
X-Gm-Message-State: APuU4Z8Y2sAwqjapUv3F6jhQgUl5yl3GrsdlwWCXK0g//ZU5Kbb2ha3m
	hRMBzYaRyPwfwqdSNi7n7I6bME/nJAKbaZcJZkam7U6UK+In51/LQGx4jVGO6oAeDw4PaG8/WmN
	wUWzdnu4=
X-Gm-Gg: AYBFou0l3sSI3NcOCxy9qWFCfhhjxslGvaOrtSXZQpDY88i4AJP2m+V7nKz0rwZQZ7n
	21y4t4yLLhzrKi2TtNsUSNzoU7j6PvkiVY+dUZH9Tyr0iXf73uiWL3KPMHVttRleAdnn2wXQ0XE
	BmczGvyI+Q0gc0rxhUy0UgT6AIOtofVU593lFdGUB8tUYtpeb6ukmyBNy2uWn6TMZEOcaUaXmOt
	kySX9FLBQ5cEUGo/GD3kD/GXvjo+32hk7+/3f9MTr5c8KES+X5xmtqFXxs99PP/G6m1dhkTmEa/
	DpK5AizfRrMynJGW1T461qX5A3HUfDAq5mkw6cuoSgBEOm66NvVedhSIsUe7gyol0SNNP5Pf245
	eNAiSj2n4EMV41kHnvrhK/J/kjlOxQECIZm4Jz52mUHVgyrc3l/1JEZ6XYTUJGylwHHIzskEkPC
	wfDXaAwFt0FPZVFlaBpwvjXIz3mj9RtX7hhvT+6OpUbXeuIwQYSwwtUMiKYYOflMTFqCBZrnIl8
	nf0w0Kaa+q5wq9vJnP70PrJdPdAQIhw+Mf3hufdH1o1wqI/YTSZgTFRyfXsWoVyquU92w7SHIBU
	r6y//5omfXBBVCPfiWi+aUeD1y2GJ6Zl8F0=
X-Received: by 2002:a05:600c:6d90:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4bb55999f9fmr135777465e9.0.1794786303610;
        Sun, 15 Nov 2026 15:45:03 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm31375779c88.5.2026.11.15.15.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:45:02 -0800 (PST)
Message-ID: <ca19697a-b86e-401d-9405-0afbf7eda594@suse.com>
Date: Mon, 16 Nov 2026 07:44:59 +0800
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
Subject: Re: [RFC PATCH v6 2/3] ocfs2: switch DIO read path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261115154013.9379-1-heming.zhao@suse.com>
 <20261115154013.9379-3-heming.zhao@suse.com>
 <sashiko-outbox-215637@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-215637@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ocfs2: use of removed struct iomap_ops breaks build in
>    ocfs2_file_read_iter()
> - [Medium] ocfs2: wrong check of map->pblk against past_eof in
>    ocfs2_map_blocks()
> --
> 
> commit f6ba1e8d47250dad525939255c96ed39f19c41f1
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch DIO read path from buffer_head to iomap
> 
> This commit migrates the ocfs2 direct I/O read path from buffer_head to
> iomap, adding ocfs2_iomap_begin() for block mapping and using the split
> __iomap_dio_rw() and iomap_dio_complete() APIs to manage cluster rw_lock
> lifetime.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 28a13246e9fa9..6158ab6515ad2 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> [ ... ]
>> @@ -173,8 +190,11 @@ int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
>>   		}
>>   	}
>>   
>> +	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
>> +
>>   	if (!ocfs2_sparse_alloc(osb)) {
>> -		if (map->pblk == 0) {
>> +		/* detected a hole (unallocated extent) in a file */
>> +		if (map->pblk == 0 && map->pblk < past_eof) {
>>   			err = -EIO;
>>   			mlog(ML_ERROR,
>>   			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
>> @@ -189,8 +209,6 @@ int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
>>   		}
>>   	}
>>   
>> -	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
>> -
>>   	if (create && (map->lblk >= past_eof))
>>   		map->flags |= OCFS2_MAP_NEW;
> 
> [Severity: Medium]
> Should this check map->lblk < past_eof instead of map->pblk < past_eof?
> 
> Since map->pblk == 0 is already true here, map->pblk < past_eof is true for
> any non-empty file regardless of the logical offset.  Because
> __iomap_dio_rw() does not clamp iomi.len to dio->i_size before iterating, a
> direct I/O read on a non-sparse filesystem that starts before EOF and spans
> into unallocated blocks at or past EOF will hit this branch and fail with
> -EIO instead of returning a short read.

Hallucinating? The code here is actually "map->lblk < past_eof"

> 
>> @@ -2534,6 +2552,79 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>>   				    ocfs2_dio_end_io, 0);
>>   }
>>   
> [ ... ]
>> +const struct iomap_ops ocfs2_iomap_ops = {
>> +	.iomap_begin	= ocfs2_iomap_begin,
>> +};
> 
> [Severity: High]
> Does defining ocfs2_iomap_ops as struct iomap_ops break the build?
> 
> Commit 82f677376a90 ("iomap: remove ->iomap_begin()/->iomap_end() legacy
> path") and commit 9e8fc16dc6b4 ("iomap: pass iomap_iter_next_fn directly
> instead of struct iomap_ops") removed struct iomap_ops and changed
> __iomap_dio_rw() to take an iomap_iter_next_fn callback directly.  This
> needs DEFINE_IOMAP_ITER_NEXT() and DECLARE_IOMAP_ITER_NEXT() (and passing
> the generated callback to __iomap_dio_rw() in ocfs2_file_read_iter()).
> 

will align the latest iomap code style in the next version.

Thanks,
Heming
