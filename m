Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678270;
	b=C+8E7r4Zi2VaUxeoONwPVtL6TzSTnBk68y5P8fyXxtjRtV6a9Z3j+vkx/MRmVKP0YQc2
	 Ord+NLOupf4Xh+BW6QHx1RebFWF4HXBUZQU0l7AxGxcjAHWRrBWkpC3koTO3twdVCpAyv
	 2WUkvUcO77AYcdX0gZJDIICIiFYWIAgZWWo6W6ntCG/SWyPf1aKpTgeuMGE/nk3bhW0zr
	 U+eTB332O76qfbHJ2xFnGYTzZu9kvhmqxxk6natQ7vo6ckdPE5GYCGkU70o4PqfGpXf/o
	 PWGMzrXohOylHAGZIYa6pM1kS6EbgMGYDdDKdmltVhNI47OKh7VksP2SPC3JMrLOe/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iRyksO0YLobR75bb2n3wA0ydtgFNs8F9swKUDXItpSo=;
	b=YaCqlmILglxZ9EjLRJVmBgm9aWeZyMQcxcVtJIGYaWNk2kS8q/tGmrquCqnJ2FGjhabL
	 pQEMs7UU4vrWpQ2oncQP+d9igP6sKbpP7p7vpViswAABt0Q0PV/FvvE1eLjBL5D9WUF4T
	 nLtHNAYgYKgU+/G6dC16UQUNPdXvP4g/Z8DVbw3KToIWd0Svo/YRT7IBDkFG8aF0/vZTC
	 rkjwTerWc4CYZ34CGlgNeKzWu3xsu2qwlWfTO9RiSHOR6Eub4hLMBmN49qWkT5hjVYcG1
	 wFBbbHLpdl8crDPSqFx1B4DfonUieU57HTzWcCY8P9ERhraVj1j0iiNQKPrdCtgztPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hF2sDi5n;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5741606A319
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 14:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5741606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hF2sDi5n
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2937c43f31so31185966b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792678268; x=1793283068; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRyksO0YLobR75bb2n3wA0ydtgFNs8F9swKUDXItpSo=;
        b=hF2sDi5n6TIXIe9xTgdQewGCLi1Wito92NBHlyFx1thYGTgPQG89TEyZn+zgd7xD5M
         XOcXroC8ur9H/kvfIG4OD1SwBQB8rGJh8cvo+3xX7rPADGvDyTb54m15eDVUrWOVFPiL
         W6/gBanXIwtVgzbi/62ZWYb4cXewd42xOyYbklekuZHQJJg00So7pQ8SMdTY5e5BUudn
         NlYt4MqLdhvdY58zM+Wg1hcKguhfTTKugrMMg9Rb4oRj6k/UpC7C8aj9kPzmyHdLakwa
         PI71cS02s6UdTS5fjMhEXQzwQPIg26rb4Xnwh2NMz8xhonbN/6FkvuwxsKniwMCuUUqb
         FAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678268; x=1793283068;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRyksO0YLobR75bb2n3wA0ydtgFNs8F9swKUDXItpSo=;
        b=XBHCuh/9zKw2ISyg/XJJWehztyX3a6TIoP81P6QNuWf9tCPAtRMFSiZb+X8EPaqACH
         h44SoryxufVegOL1SUSwdGwF7F5GW5AGK2MroPxR1DI69E1yRZfz4/2UVRqGgs43TdqJ
         iJAezgr8r0acEnfucHUMxdarfdwB0fT0tcPDjN4fBQXEHvA0Iu7PkD9j5wEl9mTtLP6z
         P0HU9y+m68VjSO5XL6WY88vbjFTcgGY9KnEac9DGXc+5/lQlWYEoZrksciwefrxBzlq4
         MeQMeMfNMCTVZITat99iE0jNPtMeAnyRLUgwNzaV+lO8G7qq3gxJ6+eY/4Zv3ip+kmi2
         w0zA==
X-Gm-Message-State: AFq9FYL320N7Q3wS3A5Qq/kYlorCRTQs2fXvho2uqlCcpLVfO5smLdnQ
	TNjgUc7AZ7rGZVkIEGIKZ7RITyCY6rJp/JXnVVhkqHyUhu+bGLBElrUCR0ZB4RcPCnsxhZTCcBK
	IXHkP53o=
X-Gm-Gg: AYBFou3Uq8+2eFxvRnJ5jcUEiEwezcwmgcycGRPMts8aflMQSPouObCNkUyHUTLZ4I6
	aYGjyHAUIamnRWD4uQJWaHanphBy5ntpKEBm4Cplm7ZF5CgrjvCOxDl5kKsX1YJCEvD97+anCWD
	UHpEslBvW2rVpS0G2HwkjLuEbJL6eZapi506CPH8TQsAgf8kShkeJnBJmed26Wl9zz3oGtL6Yrg
	q6aMANbmeQmEpOGhIl/Eq2+6g6JRRiUIte6ycLJzO8Hufp7P+HIThjFVTSyhHNxKgPtN6iSjaVc
	NYexpaVvEWHGQ2cEYCL4J4bnEvN7uoE5UOvSzFGFUnHTuqrsMbV6wUz+C8JQ6I9NfZHJZYqogvQ
	tM6Y9P1ppbC5pyMqafOe+CDe/6jN1+phvOIEeQ1Wel7Qu4SUcMzsIt/6lbTJk8UIFT24ci/CMYX
	JDLLtkOarJpWdGAI23N4FhBL9c6+SsLIDMEZ1mqZ7hzJY5NucdTQAg7M3UDR/hYHnf68MGqz+HD
	en2LKLsXP61tvs1YGvL8nNamUkTrPoFzONGI5lv7IhmEgaqIT5x7D296fX6dA==
X-Received: by 2002:a17:907:9407:b0:c32:8cbb:fac with SMTP id a640c23a62f3a-c467962728bmr609539766b.3.1792678268183;
        Thu, 22 Oct 2026 07:11:08 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895d8264sm2265365b3a.39.2026.10.22.07.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 07:11:07 -0700 (PDT)
Message-ID: <c444dce2-418f-40ae-b3c9-49c20489dacc@suse.com>
Date: Thu, 22 Oct 2026 22:11:02 +0800
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
Subject: Re: [RFC PATCH v3 4/4] ocfs2: remove legacy blockdev direct-IO path
 APIs
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261018143319.22329-1-heming.zhao@suse.com>
 <20261018143319.22329-5-heming.zhao@suse.com>
 <sashiko-outbox-176211@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-176211@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 22:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] ocfs2: ocfs2_file_open() skips FMODE_CAN_ODIRECT on inline-data inodes
> - [Low] ocfs2: unused OCFS2_DIO_MARK_EXTENT_BATCH macro in fs/ocfs2/aops.c
> --
> 
> commit c44e1e979977c124de60573ae7e8ca56edb710ca
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: remove legacy blockdev direct-IO path APIs
> 
> This commit removes the legacy buffer_head direct-IO callbacks and Kconfig
> selection from ocfs2, and explicitly sets FMODE_CAN_ODIRECT in
> ocfs2_file_open() now that direct I/O is handled via iomap.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 6564b3251b28b..ba63d983b6d63 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -2533,205 +2322,6 @@ static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>>   	return ret;
>>   }
>>   
>> -static int ocfs2_dio_end_io_write(struct inode *inode,
>> -				  struct ocfs2_dio_write_ctxt *dwc,
>> -				  loff_t offset,
>> -				  ssize_t bytes)
>> -{
> 
> [ ... ]
> 
>> -		if (++batch == OCFS2_DIO_MARK_EXTENT_BATCH) {
>> -			ocfs2_commit_trans(osb, handle);
>> -			handle = NULL;
>> -			batch = 0;
>> -		}
>> -	}
> 
> [Severity: Low]
> With ocfs2_dio_end_io_write() removed, is the OCFS2_DIO_MARK_EXTENT_BATCH
> macro definition earlier in fs/ocfs2/aops.c now unused, and should it be
> removed as well?

I will follow the same handling as in commit d647c5b2fbf81 by using
OCFS2_DIO_MARK_EXTENT_BATCH in ocfs2_iomap_dio_end_io_write().

> 
> [ ... ]
> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 04d676ff7aa59..2b7f878f25e24 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
>> @@ -129,6 +129,15 @@ static int ocfs2_file_open(struct inode *inode, struct file *file)
>>   
>>   	file->f_mode |= FMODE_NOWAIT;
>>   
>> +	/*
>> +	 * Direct I/O is served through iomap_dio_rw() from
>> +	 * ocfs2_file_{read,write}_iter() rather than an a_ops->direct_IO
>> +	 * method, so advertise O_DIRECT capability explicitly here.
>> +	 */
>> +	if (!(OCFS2_I(inode)->ip_dyn_features & OCFS2_INLINE_DATA_FL))
>> +		file->f_mode |= FMODE_CAN_ODIRECT;
>> +
>> +
>>   leave:
>>   	return status;
>>   }
> 
> [Severity: High]
> Should ocfs2_file_open() set FMODE_CAN_ODIRECT unconditionally here rather
> than skipping it when OCFS2_INLINE_DATA_FL is set?
> 
> Previously, ocfs2_aops had .direct_IO set, so do_dentry_open() always set
> FMODE_CAN_ODIRECT on regular files regardless of OCFS2_INLINE_DATA_FL. The
> read and write iterators check ocfs2_should_use_dio() under the cluster
> lock and fall back to buffered I/O when the file has inline data:
> 
> fs/ocfs2/file.c:ocfs2_should_use_dio() {
> 	if (OCFS2_I(inode)->ip_dyn_features & OCFS2_INLINE_DATA_FL)
> 		return false;
> }
> 
> Skipping FMODE_CAN_ODIRECT in ocfs2_file_open() appears to cause several
> regressions on filesystems with inline-data enabled:
> 
> 1. Opening an existing inline-data file with O_DIRECT now fails with
>     -EINVAL in do_dentry_open() instead of succeeding and falling back to
>     buffered I/O (or converting to extents on write).
> 
> 2. OCFS2_INLINE_DATA_FL is mutable and is cleared dynamically in
>     ocfs2_convert_inline_data_to_extents() when a file grows beyond inline
>     capacity. If an inline-data file is opened without O_DIRECT and later
>     converted to extents, file->f_mode still lacks FMODE_CAN_ODIRECT, so a
>     subsequent fcntl(fd, F_SETFL, O_DIRECT) in setfl() or RWF_DIRECT I/O
>     will fail with -EINVAL.
> 
> 3. ocfs2_file_open() reads ip_dyn_features without holding oi->ip_lock or
>     the cluster lock (ocfs2_inode_lock()), so a node with a stale cached
>     OCFS2_INLINE_DATA_FL flag can reject open(..., O_DIRECT) with -EINVAL
>     even after another node has already converted the inode to extents.
> 
> 4. Earlier in ocfs2_file_open(), OCFS2_INODE_OPEN_DIRECT is set before
>     do_dentry_open() checks FMODE_CAN_ODIRECT:
> 
> 	if (mode & O_DIRECT)
> 		oi->ip_flags |= OCFS2_INODE_OPEN_DIRECT;
> 
>     If an inline-data file already has another open fd (oi->ip_open_count > 0)
>     when an O_DIRECT open fails in do_dentry_open(), ocfs2_file_release()
>     will not clear OCFS2_INODE_OPEN_DIRECT because --oi->ip_open_count is
>     still non-zero.
> 
> [ ... ]
> 

I prefer the style of setting FMODE_CAN_ODIRECT unconditionally. This is also v2
code style.

Thanks,
Heming
