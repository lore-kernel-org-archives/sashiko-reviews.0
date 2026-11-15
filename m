Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794786093;
	b=25ZJBgvg6m5FMeSidkDIbX/s4RfoZngPQV8brKkUMUQt/8gv+J9tahVXDZr763Kum6NJ
	 /EfnUaPymfxGIvyCOGZsU++tz4xFpoocSEh0bcmUIz+1uCxpUxEFP/eIDmsCE3eLPWN9g
	 TafBvyuIOZTn0tpruBdAMO5fRtLP8PdyrOhnbpUPOvNdRxqui7jFz7A/8m3IDV9emjo4W
	 bo2lI6EEK9FTpsum2SEKd/J1PJI4yFf5abltNlvxqQpnBcUHaQQBGlMZJK3T7korn3Rk1
	 KFaeFmrHRoS4Ik45987eoaTrGPosdMQLpEhaUAcuHabl5UJlH4dM0H2YHMtVBnCH/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WyF17ap9NFT3+TFXH/YKxpWHaCQanjgv65vU082yF3A=;
	b=fzwgwP/VatXTq1sUfmWmUPZ9+0iK5fKOaJbTfLMJ/nf/Z9GOxDPR66VY3E7xl43YxD7z
	 ejXlfGJJI4eNcs2Bu0CC+YdKbKtI24vXBjra5VAY6BQ01y1u9V+KFuvnqBv6RgH3BDkeS
	 wnIpEjCYWCTRqVo5P5ERpScrSMh1EXTVC9pkmoq40V9IysK48uCzZnPflv67JV5hYMArX
	 fCrfzYq6+/K+S2Rump5eB6ZPYZakXfs3GjU6fM+qteMBWp33kmx2cPppjaBUL7rbqkPZH
	 iPETsy+J7kiIsTFDN/kMcYS/ehXE/hpC7Fr9xiwQJftUlZgvkMdAe/yCjkCViMPvNwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=au9Xe5fv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFD606A31F
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AFD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=au9Xe5fv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2097505e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 15:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794786091; x=1795390891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyF17ap9NFT3+TFXH/YKxpWHaCQanjgv65vU082yF3A=;
        b=au9Xe5fv4tcHqOpST04ICCgX20jTd0PF0h+9SsOCzZjuisvMgl9zsKkJOJPb/KnIRi
         k1jdoLoIA8ATrgiuxqNcstXeRagwfQhXLmhBragmecHMMYr14V3bCPFFLhY8xxk0ZzUC
         bCP4NNqwqR5dT95dGrgWaGC/FVX40cxWIsEvQG9fpC6mQmfsW1WI5AilOXCgmrjiWQ87
         U9CO6acEVoeMldQt4ME76Pf0oHkyPKdTJFxE2D8xtv2zsERbr4IOFKjW3RYuWiVDk5Pe
         81b3X2LDpGUAcTCFD7HiWkTNNXbrzyIuLvTsmMa3/ZijFgXCcH92krPGAVy0jnMZi9XM
         wRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786091; x=1795390891;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyF17ap9NFT3+TFXH/YKxpWHaCQanjgv65vU082yF3A=;
        b=q3oJV2JvTlbKINkHWcGcQUHiWxz4iBQ73YdBMA0rVjKxKHhFIsCes4EazGEUg0yDaP
         +1BPCZ1ZfbvfugzkPwg1JlcM74Q/yqazytWaCL9VVw1yNkUqJV8LVGnL+1mWzu10pPnO
         odjRTszcbf9b8SHG4/aaeFK+xTwUV59hrs2X0/ii5uqe1U28SGE33iCSTKSv+tFLgXMz
         3tHd/IdXfadztRCBNU74bWJNFAYSXBuCufq7Kgzvk2IRQvCofgxIZp6o95N6sQMyyD8h
         fPat+b0KWY57veiMNj8btUB++gycqovWhb6f2RKsMD2vZ6zN7jZ2LB7jMN4vHH1/PGfN
         OLaA==
X-Gm-Message-State: APuU4Z8xmUmZguYllf4JbfGYKuaVA/i9OTC/OQAWc1BaLkpK8ZVXqEP8
	VPuDWblIstKHLaV9P7T1oQ8paw8QTsmj8b7qZcUzeTTyyl9pMz93BMYePlt4LYHPtIv8b8CXCxr
	6EJO3So4=
X-Gm-Gg: AYBFou0jYNuvy/YBsTQ6ZRYe29xNnPR6zLxz1QXyYDWgCUsIJZqK0GPl+mTzMHW88fa
	XwUB9J20gT6S4tOsnk+ZVdaQ6ApkdFqbutK5aQKISiP8RXKKN5qsnaKsp9sRMEGmkLI2vA+daQ0
	5uf4tUzyzJzky2UJ8+Q31gU3pCdHKUNt/ICP0/W1Dj/Zf9XHthLOIMDLuj2VEBs8HFCsGrmk4WR
	shotb27SAvQ/DVEcjXsTBIxt34k/AahlOy2C/CT+J/c5/1EZfix4kN8a+FL8ybGo9Yaq7OGNrJh
	zNmpvq/KMjopoSOHJ+MDI7FJKS99fPO2DvuLWnKHwSgPOqlONI7N/drhsdQBEy7X55GadxHyt1P
	m38gEYciRy8wEQ5rzru9Eq8bkWqrMhR1v6ylzEm/nCVqFEfD/DvNNx2lCz2i4l7EQn4QnWgTc0d
	Vz2pd00qtF/J2Jalu7vowYDPUMQ2KWhBNa6AvwugCFoCsSAWdW+NrjzC+9Mh7YPT06pZmc1ZiW6
	qWBmmCVTslrzBhYGcJZWx4d9n84h4aeijRlT3Dripidv2aRhlX7KDUsaiH24RO3M/sR4OqOTGJL
	98hPKAhIF5mm1skEzYPRVrd4LUAMUh30KrI=
X-Received: by 2002:a05:600d:644d:20b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4bb55a3cf01mr145342995e9.2.1794786091109;
        Sun, 15 Nov 2026 15:41:31 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm27122953eec.6.2026.11.15.15.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:41:30 -0800 (PST)
Message-ID: <fc616838-1eae-468e-b71f-9aaeaa08b005@suse.com>
Date: Mon, 16 Nov 2026 07:41:26 +0800
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
Subject: Re: [RFC PATCH v6 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261115154013.9379-1-heming.zhao@suse.com>
 <20261115154013.9379-2-heming.zhao@suse.com>
 <sashiko-outbox-215635@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-215635@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ocfs2: misleading unwritten extent comment in ocfs2_map_blocks()
> --
> 
> commit 36724870d23a63ee30eadf9855ab6d1cebde1f9f
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
> 
> This commit adds ocfs2_map_blocks() along with struct ocfs2_map_block and
> OCFS2_MAP_* flags to map logical blocks to physical blocks for iomap.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 4acdbb70882cd..28a13246e9fa9 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
>> @@ -126,6 +126,78 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
>>   	return ret;
>>   }
>>   
>> +/* ocfs2 never allocates in this function */
>> +int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
>> +		    int flags)
>> +{
> [ ... ]
>> +	map->pblk = p_blkno;
>> +	map->len = count;
>> +
>> +	/*
>> +	 * If we see this on a sparse file system, then a truncate has
>> +	 * raced us and removed the cluster. We treat this as a hole
>> +	 * and skip setting the iomap flags. The caller will set
>> +	 * iomap->type to IOMAP_HOLE.
>> +	 */
>> +	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
>> +		goto bail;
>> +
>> +	/* Treat the unwritten extent as a hole for zeroing purposes. */
>> +	if (p_blkno) {
>> +		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
>> +			map->flags |= OCFS2_MAP_UNWRITTEN;
>> +		} else {
>> +			map->flags |= OCFS2_MAP_MAPPED;
>> +		}
>> +	}
> 
> [Severity: Low]
> This isn't a bug, but the comment "Treat the unwritten extent as a hole
> for zeroing purposes." appears to be copied over from ocfs2_get_block(),
> where map_bh() is skipped on OCFS2_EXT_UNWRITTEN so the buffer_head layer
> sees an unmapped hole.  Here ocfs2_map_blocks() records map->pblk = p_blkno
> and sets OCFS2_MAP_UNWRITTEN instead of treating it as a hole.
> 

will remove this comment line in the next version

Thanks,
Heming
