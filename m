Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873074;
	b=XUnpEh7IJCpWS503sTmHYQ9NMo33d39r1j3sAM3xUuNZJC7NVOPrQwRbKjZGpCyG2P7u
	 cKNS/vXguI+lKT3eYG9LOipJQnfYaLa/UnfyBnQYINBRvRCuwCwiqbSK7XEpVhL6inD7I
	 gOqG0Hkf7PfW2JJJVmd0AbCzAg9OFwhH+jPng93GeNWyqOXgceUBFwaMRlo5JEXiR04Mz
	 HIbumG+kU1kZpV8iyBzQiK1LB2zXXKGvvXlwlNkELdGG8NPTiyel/Z3H7ATwIWpBIzUnI
	 AmiYzcyp4jZLP2P8Uy8i4ASUHUpPsbN+hZfkLWBzULazCysU5ikgMQv83C/4jPW6GxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OdFzYdW0PtsvjfeoaECx2qFk8wCGGyIWLPkuLrA/JYE=;
	b=lnT5sjB/eUeQX8rYATMeg2i5JqgxSgOFhHfr7Cb7NTOpnTVmqEpupTiQDYZJ9brPM9nA
	 It0usGMGnZ07RyESgC+ZzRtZhDEI3PyKRdoAnApB5l0FuJyMad86rJ3/KFVMmAlTvbHX3
	 6OPd4GNKSNDFtddF9OmIjCO74hc/9iwn3gM7tXhzk+JQo9UhFlH1d8i4tvuwPTTnDcvLs
	 6MZaTtIM3Ofd/IsNwC1t/Zrv0Ltw0n9aF+qEDbedvEVX4Z2j6Oi9vHrll4W0SxVkPBRnt
	 8b9HSRVjYpyA4bxz7KVRLtEkx8wDgUmrFEljlM7NLoEPF+2tTzyfyFGuI8IR5eVMjNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ei36Ep8q;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92C606A32E
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 10:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D92C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ei36Ep8q
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cd28978b8so28406266b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793873072; x=1794477872; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdFzYdW0PtsvjfeoaECx2qFk8wCGGyIWLPkuLrA/JYE=;
        b=Ei36Ep8q1ftrsnyiAenAYJ3XhDgRnS9wxCcQtLuSe7Ei2zXroq+eAHi6wiKtNIE4qG
         TA+8T5r00p82AFHMNFxXH2JaubmN/o1I8dd2FLezj8u5wU7IndKDYKRTBpaiK5EmOCgt
         H+JRIo+AzCTN54A7POBZIgHpcLhDCqBfHA6JsSz2VtYL8cxo6VT+3IusTpyrMkBzXJRb
         LKcOWcp0Apgz81cCg7zU5Px2RoaUa1fSvQamvqVTSys9NCdKKdJ9UGswiCCR20VZNBoy
         pJgiIlwzSp7ECq6hiuabWln8q5jkNpFp42O0dGwBCU5kChmWKhotJ2aybEUmdzC7a1e4
         nF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873072; x=1794477872;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdFzYdW0PtsvjfeoaECx2qFk8wCGGyIWLPkuLrA/JYE=;
        b=Mfn7qSXLfCtXdD4C5SX36YgtJNN5+Vrv0c/WcsspU9b8+G86lR2yUoYkkV/Z1PguK4
         iFfvZ6w5s0++AvF12/PpRLDA7ovVjOCHpZPc/x/MXBdEMWZMI92wsTS4YafKnNzC/9ej
         omfU3t0KHjXb1rCTXEkk81gKTZL9GzVWyR4rshoc69PErGZ7f9jWAy5O2TG6VypfBosy
         rCblX2tj1JlMdAfMktgKBQsKHWxyL9CaDR19rIfLhZUyM2PGmbnoT/nVvgmeTYzOOP9C
         85v0Z2F7JzstMqep5XZIQy3ZhkvdBWEGVJP5RbRTMeG63P1bSwECHU2sjyFTiPjF96Se
         p9Xw==
X-Gm-Message-State: APuU4Z+6ypMXKBeNYniNxkphZaOZx/b21YWU9DL6kIU4qtZmIM+lbhE8
	OMueCLGmZLXwhzOfp3tUHxeMo5vrTMzjrL55YikUHALnB62C9kOtH6IiAqFJsjw427R5flZXt+e
	SseSmf0Or+Q==
X-Gm-Gg: AYBFou2A2iYgG/ZRGgBCUeiOHXu3FmuB56pNqAiSYuxIn4WE2zPjAewO13AqG4/Yxnf
	pr4dCBDrKdheb2QOpPrIGf3hT0nopuF2Uw88hCEeHjTqVQKPMEG+1wfq3W/498wElRwGdx0Ke1Q
	W6nOzpCqhkaog3VVg7dsuvjM42aa1zhMjqJk8LtQa5jCX3dnd7noBJYpYcZybtMTh0B4T1t73bX
	ZSYvGe7zyXzx9AKeDwXC9Qep3uRhDuePkd4VlgIi/v0AMm0S+8/6LgHaQrLW3fz7iElPwdiocMF
	ciRGUEB11otAlwwvTWMMpFq39giEvHYB+rD4KBVXONwauhjdZpWKnUdeyV8Jv+3ej4sFmmNT/XQ
	Zy9RrXVHxXaH8Qg0/xChbMGIuBiGrgAJIdjRNwy5c8w/gk1c0xDm0cxRKEeMhYUYo8hSXsSWCZt
	EhBPObF4RYccyhjsT+nidjDhq4L2qO1gMx4zciz8EXWAevdUEkaLVIGUibL7GMuzN4nVSSNcsQX
	MsLGWFmozjl7X4IJ1wGZvQmPMPPutTw4u1S3329Beo9TDyHSzr1TNMF94vSWm3oDCFKuf2ZdOP9
	yND+Q2t0c2uOJC3N8pWa7ual0Hgfhj12HPfOAkX2
X-Received: by 2002:a17:906:b055:b0:c49:ce7c:8a60 with SMTP id a640c23a62f3a-c4ca7a0feebmr1688446866b.2.1793873072410;
        Thu, 05 Nov 2026 02:04:32 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm15454992c88.14.2026.11.05.02.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:04:31 -0800 (PST)
Message-ID: <0506cc79-8c36-4b53-b354-8cbcd84f1045@suse.com>
Date: Thu, 5 Nov 2026 18:04:27 +0800
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
Subject: Re: [RFC PATCH v5 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261105071930.16399-1-heming.zhao@suse.com>
 <20261105071930.16399-2-heming.zhao@suse.com>
 <sashiko-outbox-198676@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-198676@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 15:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] ocfs2: contradictory unwritten extent comment in ocfs2_map_blocks()
> --
> 
> commit 81e76d9c346a545682addc2f47f30d7dee94c200
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
> 
> This commit introduces ocfs2_map_blocks() and the OCFS2_MAP_* mapping flags
> to replace buffer_head-based block mapping routines in preparation for
> migrating OCFS2 direct I/O paths to the iomap framework.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 4acdbb70882cd..0f7502de9b8d1 100644
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
> 
> [ ... ]
> 
>> +	if (p_blkno) {
>> +		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
>> +			map->flags |= OCFS2_MAP_UNWRITTEN;
>> +		} else {
>> +			/* Treat the unwritten extent as a hole for zeroing purposes. */
>> +			map->flags |= OCFS2_MAP_MAPPED;
>> +		}
>> +	}
> 
> [Severity: Low]
> As reported by Sashiko on RFC v4 [1], this isn't a bug, but is the comment in
> the else branch of ocfs2_map_blocks() in fs/ocfs2/aops.c left over from
> ocfs2_get_block()?
> 
> In ocfs2_map_blocks(), unwritten extents are handled in the if branch by
> setting OCFS2_MAP_UNWRITTEN, while the else branch handles written extents by
> setting OCFS2_MAP_MAPPED, so the comment stating that unwritten extents are
> treated as a hole contradicts the code here.
> 
> [1] https://lore.kernel.org/r/20261103135605.22943-2-heming.zhao@suse.com
> 

Sorry, I just noticed this. I will fix the placement of the comment in the next version.

- Heming
