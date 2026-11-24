Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487544;
	b=0kqc5twodU+Qid0D6hNTa704C3ufTOWqHYv9l+DYviQyB0YX+bKZ436tZLPUZ04hrsHH
	 IDJKEqfpgeuCYzey6Iu7yLPxq78sXAGugxtZDyYlbr4Y1jYsap0+GTmby4RI0yPR3ILVE
	 yIatWyCA+jRefv3po4bkHQXdybE9ABK09VxxXRjamCcDXgQGsR+7PBp0ansFiuDzW0msB
	 6FPXVjGrZqv17w+5cJtmrBNUN28pZwHYroERoilwFBoHQl7d/ucmx94Pgs4lxmQOVg0a4
	 C44YPLL6+6vo1JiTSg0mykR9lQVSII2A0A0yXRXFwGRhDCxMVAXo+hUUKjBf82+uhEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dUdCchKrORdM1hEShauXvFsMPZWna8Pp+rEMieXmpAw=;
	b=etbvT4QKznStcE2fC7pHx+6BhvD/oe8vuVHptpI8lYPgkqswygu/a0qj/iHqF0f+2YIZ
	 1E2HiLSJxQtzRGqf6gNIB9rxMsKzT+Pjom8+UvKWXiAGZrkjaYmanZV/HPJD8fJhv7fSr
	 zxKYE3qnAdMSJuKpGjJSnx6FlfjJFr9/c+W8W7PNACWqQfOHEGr+ZxfFNz53b7woo0hR3
	 B9Mo8wzJ5mpvuUyq00NqaVpZjQCbTvd6S4EgnfYBgDpoYOoOaPg771fom7HRBVbDQe1t3
	 X+/uuY6b106FAFfqumh/rWYT1jXRF3RbrJ//+iYPrQtnv9KwT90iy4FfesjwVAEJirw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=U1r1UmsB;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C03606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 02:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=U1r1UmsB
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba1e6068c3so413301a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795487543; x=1796092343; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUdCchKrORdM1hEShauXvFsMPZWna8Pp+rEMieXmpAw=;
        b=U1r1UmsBR1PA75PcE9LRHXTU6u7Y+mjixCXoFIbqxFFnz1jjb9TL3iuneTXgyAWGlj
         rXvzBnLLsLhJFWpnn0lmFR0Rw+ikv3d+wy8ztFky4tnlScyA3xROUHLqBc9rMyYlJKSh
         6D/EKHxgxI9cCyDy2Tgag5eXrp33pPzBKch8+EAYa/T0JdI7PsseuS5dsU7WYKbmnERD
         3UMlFIIeot1v9mJsAfZ1+hZxuNSBI4Vu6mGfxxQK9Rm5q6ZtDG76oX9KLIdb+7BDLt8/
         rQ4XmyE/chM+xWbM+wNBZ4J8OEjYR/L8JYe4cuME9hFQtZcagmNS9lMH2XlggR61nK1l
         btpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487543; x=1796092343;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUdCchKrORdM1hEShauXvFsMPZWna8Pp+rEMieXmpAw=;
        b=waAOY5FQTAxzX19h0RF7M5SjdLN8fFesMrD6ybYEfO2zuJQgG2Q2/wE9Ki4LGmoMPT
         1yUHpQJVfHtfWGEed8/xfC1l7w0nQ8Se4rC2ZdecDoCvNrp/P+a6glFSrcS1wSEUJy+Z
         orHw5CnYKxuPN6RWP+axWGrm04uR/TdARruiZSDAMtGHdt/b2Ad3Ast4ONC9HZY5iEZz
         wvyHGFFBsZdJXyLqS2k5OpxMZYuNQJ/Zd069bsj97irn58Y5ZRW3DTm+6CFgWslzioq9
         Bunvqs5ExJKtfllFkFaNH2maALfFgkT9N8hD7qSZh9iW3Efst8z5seHyHyK+Yhvsyr9A
         l9hQ==
X-Gm-Message-State: APuU4Z+4GkdbHgaA1gw2joEItrxMXoVbxdpUIRyDrIzgu/1tub84ooyk
	SHJhSOzl23a6CqTUQAq0QygtqO2GnguKrvbQsDCrmODfY0T8yrW3ucwrqnSnWI/EA4v6BZK5u01
	r/H5uhVA=
X-Gm-Gg: AZFdTZcPLRnJ47cz1y4/af3gXMnL1tgSlapLLZtXYnv5fRRsrRcTN1YvH94Z/y3zwjA
	OeBBtZBTTVMCTmyBHz+83WBdL2CmAIw/Kl21pdEJXVb9iQ6FUZXeKOUW2NqA+n7uVcJJ1VC0Lhb
	QdJDxX6JXQ+AQ10+RWtwLEh6X5kaz+7cN6ztJiFXkaAhOQPkVqLBu946AVHRlrUslCucCek+Jaz
	lhnGqtl3oIF5TbsCavTveh9Fd7JL9cQxP8Byj9zG2QPj3iPxII84o52lb6nh/8ANNJeGKLjwBMg
	TktQxmgBHb03BIwdJEvAcnHt1EZcEQ3v2rjQ8k4iMJt+qZXgjuaHa20NnRW1cix7d4zHZSEKrpb
	FqDeLY81PVSFKfq+2HR0V0j7KoXiN2BPLdZYk8koQa9IyPKuD5IeRDAMU4F6LrObglvPqJ3XCw1
	2VxNEuw2EnfFFg/XuBcw1wpoEVV0ghj/Z7JIQO+hkk5W/XYvx3oGAnvSNuSe0E9D2v+lZA/cfhK
	6YAlA+f4EZQZAbZID8XwooVnY0CFReIjrp2rSKiQVpEEBM5/4iXnwj8PINS9m1IDlaU5X9QoOaI
	PgdeSS4BZdnMPrCye3W7S593pKBoGybTrwg=
X-Received: by 2002:a05:6402:404d:10b0:6b8:7d2e:838 with SMTP id 4fb4d7f45d1cf-6ba37c769cdmr9366180a12.1.1795487542595;
        Mon, 23 Nov 2026 18:32:22 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm20285073a91.0.2026.11.23.18.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 18:32:21 -0800 (PST)
Message-ID: <d7178ba3-f698-44da-acfa-458dda05d743@suse.com>
Date: Tue, 24 Nov 2026 10:32:17 +0800
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
Subject: Re: [RFC PATCH v9 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
From: Heming Zhao <heming.zhao@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261120060014.12087-1-heming.zhao@suse.com>
 <20261120060014.12087-4-heming.zhao@suse.com>
 <sashiko-outbox-224583@kernel.org>
 <dc40ec4a-0bff-4b66-bbb7-f9da7dc3156c@suse.com>
Content-Language: en-US
In-Reply-To: <dc40ec4a-0bff-4b66-bbb7-f9da7dc3156c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 08:49, Heming Zhao wrote:
> On 11/20/26 14:47, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential
>> issues to consider:
>> - [High] ocfs2: orphan entry and block leak on failed or short DIO write
>> - [High] ocfs2: premature DIO check and rw_level in
>>    ocfs2_file_write_iter()
>> - [High] ocfs2: unwritten extent data corruption in
>>    ocfs2_unwritten_check()
>> - [Medium] ocfs2: wrong cluster count check in
>>    ocfs2_dio_clear_orphan_locked()
>> - [Medium] ocfs2: preallocated extents truncated in
>>    ocfs2_dio_clear_orphan_locked()
>> -- 
>>
>> commit 3b2172b84eea7db7460d8820186e4b0c444ba7e1
>> Author: Heming Zhao <heming.zhao@suse.com>
>>
>> ocfs2: switch dio write path from buffer_head to iomap
>>
>> This commit converts the OCFS2 direct I/O write path from buffer_head to
>> iomap, replacing ocfs2_dio_wr_get_block() with ocfs2_dio_wr_map_blocks()
>> and updating unwritten extent conversion and orphan handling.
>> ... ...
>>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>>> index 3d717200d53a4..327997a7061ee 100644
>>> --- a/fs/ocfs2/file.c
>>> +++ b/fs/ocfs2/file.c
> ... ...
>>
>>> @@ -2527,31 +2595,142 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>> [ ... ]
>>> +        if ((iocb->ki_pos + count) > i_size_read(inode)) {
>>> +            /*
>>> +             * Complete before i_rwsem is dropped: i_size is only
>>> +             * updated by ->end_io(), and the next writer would
>>> +             * zero the gap between the size it still sees and its
>>> +             * own write, over the data this one has just written.
>>> +             */
>>> +            dio_flags |= IOMAP_DIO_FORCE_WAIT;
>>> +
>>> +            if (ocfs2_clusters_for_bytes(inode->i_sb,
>>> +                             iocb->ki_pos + count) >
>>> +                ocfs2_clusters_for_bytes(inode->i_sb,
>>> +                             i_size_read(inode))) {
>>> +                /*
>>> +                 * when we are going to alloc extents beyond file
>>> +                 * size, add the inode to orphan dir, so we can
>>> +                 * recall those spaces when system crashed during
>>> +                 * write.
>>> +                 */
>>> +                ret = ocfs2_add_inode_to_orphan(osb, inode);
>>> +                if (ret < 0) {
>>> +                    mlog_errno(ret);
>>> +                    goto out;
>>> +                }
>>> +                WRITE_ONCE(OCFS2_I(inode)->ip_dio_orphan_pid,
>>> +                       task_pid_nr(current));
>>> +                WRITE_ONCE(OCFS2_I(inode)->ip_dio_orphan_end,
>>> +                       iocb->ki_pos + count);
>>> +            }
>>> +        }
>>
>> [Severity: Medium]
>> If a file has unwritten extents preallocated beyond i_size with
>> fallocate(FALLOC_FL_KEEP_SIZE), will an extending direct write that ends
>> short or bails out before completion free the preallocated space?
>>
>> Because this check orphans the inode whenever iocb->ki_pos + count extends
>> past the cluster containing i_size_read(inode), any short write or early
>> abort triggers ocfs2_dio_clear_orphan_locked() -> ocfs2_truncate_file(...,
>> i_size_read(inode)), which truncates all clusters beyond i_size including
>> pre-existing FALLOC_FL_KEEP_SIZE extents.
>>
> 
> This issue is also present in the legacy code. I consider this patch to have
> introduced a regression. Previously, when an error occurred, the space
> allocated via fallocate(FALLOC_FL_KEEP_SIZE) was not freed immediately;
> instead, it was cleaned up upon the next invocation of
> ocfs2_add_inode_to_orphan() or during the recovery process. With this patch,
> ocfs2_dio_clear_orphan() is added to ocfs2_file_write_iter(), which leads to
> the immediate deallocation of the FALLOC_FL_KEEP_SIZE space in the error path.
> 
> Note that it's a little bit hard to fix this issue. An ideal fix has not been
> worked out so far.
> 
> I suggest add a TODO comments like:
> ```
> TODO:
> If a file has unwritten extents preallocated beyond i_size with
> fallocate(FALLOC_FL_KEEP_SIZE), an extending direct write that ends short or
> bails out before completion, the preallocated space is freed. The reason is
> that "ocfs2_dio_clear_orphan_locked() -> ocfs2_truncate_file(...,
> i_size_read(inode))", which truncates all clusters beyond i_size including
> pre-existing FALLOC_FL_KEEP_SIZE extents.
> ```
> 

I will use the old code logic, in ocfs2_dio_end_io_write()@fs/ocfs2/aops.c,
current patch:
if (READ_ONCE(oi->ip_dio_orphan_pid) == task_pid_nr(current))
         ocfs2_dio_clear_orphan_locked(inode, di_bh);

will change to:
if (!ret && READ_ONCE(oi->ip_dio_orphan_pid) == task_pid_nr(current))
         ocfs2_dio_clear_orphan_locked(inode, di_bh);

This change can not fix this issue, I just restored the old code logic to
keep the code behavior as before.

Thanks,
Heming
