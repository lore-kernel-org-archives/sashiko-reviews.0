Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F602D662F
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809338; cv=none; b=hPjQXUxrP4h2B21Tnsx1Pjt8ptGbqfsTzhEEfrKNQOvH5sfrzRHaH3zmInjkdmCBQRHvW2eEXuPvuIX5IyWAhYoEVXLe8oiP3rzOD3mqm0dUuBuNV/Tecj2dHRIoOTAI0TR085EfOJzi3DZegDXg3Kc69b0ReNoEPN6oevhmo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809338; c=relaxed/simple;
	bh=Ud7c7ziFdGIHMaWEoi0fi8loXZCXKJaP++l3geDTRd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbyquoxfokBd7BfJ+6OijD2dCEDULQFyCLW70NHgAdb81W0y7DWr7orcpVaxcX0l8GlGYGwBjAoYxzkCrHQmn14hhoIhcJBELX0oH+LDHVRWipXdefv2k9061THqM/OwoOkMc+WDtXm/nQXF41mJTDL7Avk51cVrzt/9+lD/nJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bg+H2qDD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bg+H2qDD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37c64d34032so1339410a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781809337; x=1782414137; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whmu7IhVKfdGkzE0JL0WMbR56gnvcartiKhVDhUrLW4=;
        b=bg+H2qDDIbS7W76Keiyvkl9b+rw+NFWWvCsWWrbRBohyVe+n9O5YS8l+5eDSPRRsYC
         48RZ4SjQcjeoiOrr2uzd17Y0du2skXjHRrOeBdin9v74hwbulYFavpsu8uJY1bd1fVlm
         64fyfcdj46vdXpU2ITG2mOknNAoWRztZBWygKiQN2nH8ag7ZBj3bcUVeJhW2LIPxpoBG
         lvZnTl+y3IISmz2IV8gb7AxEfzUL6gsiMVST1SDIosoNfmm86qHXHNOE/Rgtupzzsbor
         WNIKEQwF7/QWzPaytvcCir1zcquokH9NvE9FFW/+apyA7sQYh2Sd9TNxnB9y+kYYxlVx
         IDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781809337; x=1782414137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whmu7IhVKfdGkzE0JL0WMbR56gnvcartiKhVDhUrLW4=;
        b=IYQcjgCkyzHJoJk11KTcHjgEjAs4wDoxJlSKs1Y4qJfaQbUbDI4GosDl1C6QKfvEMm
         ePKguZxbK3fmd1lev4rxxGfgktrpG9xj9P9gLJgPAy97rT5xs/IXMYJr+VcrYbnwlqjb
         d0VGC3Qq1UEdyWqJaME9JdH/X365+EuY92osUS3Na4xFyC2qlnPoHdjOsJf5cWITPS59
         1KZzFaYv/qG/teZ+IayWluPzCtjEg35SRKFqx6uCxyoZjyXlS/ZItY4LdDST915aiI0e
         k6gJK9tXlgxP5UxUd8U6IJ6wl1bhVs+WQBPyNxsCAlxTO537Hhsqquxq/c8d18TUmEle
         P7XQ==
X-Gm-Message-State: AOJu0Yw8C79qyxViaacIP0Ecc10F75E2iZ0L5YBokfMGw+r1Xq8ONqyl
	aEXomNjanCPUwl0pMgMASV0VcvpFykPKnupIwT1C4zLwBdUM66JqvlK5UeuB8A==
X-Gm-Gg: AfdE7cki09awZ2xrOvGQJTLpTmE1VGZW+weLk20a3z7dfyciVsDxP93a+hC3FJqu21F
	cZtn1PGwraSlnOycz8BEP8T1eUyV+GpPKUF90d/fKaEvfCkpiZ0vqflP+4lcmLmT11ZZHJIOUjK
	CdT4zlMYOwBG39N838LjS75cqziNfnWQP+OTsze5s69nmfvmEvXyHzZYlCLZxmUPIWUBu19tAus
	OZwVW5yC7eMV1csvgGA+tORcVEE4iAZit6BnnWW41/NMNnjfgljimHZfg4zsVEBaSWuTTLIrSTV
	rg8C0mbeT3zHiMBRl2vMveyrn8leuhJGmIJdNi6zaF0Pci8KrDIjKOIPZuUrkLIJ/QRPYWPUoLk
	EYZS+TgUk7bXaoP44xSz2va7Ap3M7wQqIrUzkk/38hzeTKzZxjyhSpl8udIZVwMt2QrRmHXGi1O
	SmDDOhTeNIzw==
X-Received: by 2002:a17:90a:e183:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-37d1a30f02bmr225853a91.15.1781809336618;
        Thu, 18 Jun 2026 12:02:16 -0700 (PDT)
Received: from john-p8 ([98.97.43.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d157b7182sm415141a91.11.2026.06.18.12.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:02:15 -0700 (PDT)
Date: Thu, 18 Jun 2026 12:02:14 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Sechang Lim <rhkrqnwk98@gmail.com>, bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf, sockmap: fix BUG_ON in skb_to_sgvec() on a
 resized ingress skb
Message-ID: <ajRAgiUlvyNt5wlr@john-p8>
References: <20260613082442.3252576-1-rhkrqnwk98@gmail.com>
 <20260613083747.CA2991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613083747.CA2991F000E9@smtp.kernel.org>

On Sat, Jun 13, 2026 at 08:37:47AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] Returning -EINVAL when an SKB is shrunk by a BPF program causes the `sk_psock_backlog` worker to incorrectly treat the valid shrink as a fatal error, leading to an unintended broken pipe (EPIPE).
>--
>
>commit 54e4eaf90ac6a727b56c416746a6a961673b62f5
>Author: Sechang Lim <rhkrqnwk98@gmail.com>
>
>bpf, sockmap: fix BUG_ON in skb_to_sgvec() on a resized ingress skb
>
>This commit prevents a BUG_ON when a BPF program shrinks an ingress SKB.
>It accomplishes this by clamping the length to skb->len - off and
>returning -EINVAL if off is already past the SKB length.
>
>> diff --git a/net/core/skmsg.c b/net/core/skmsg.c
>> index e1850caf1a71a..2961178ebd1e1 100644
>> --- a/net/core/skmsg.c
>> +++ b/net/core/skmsg.c
>> @@ -550,6 +550,10 @@ static int sk_psock_skb_ingress_enqueue(struct sk_buff *skb,
>>  {
>>  	int num_sge, copied;
>>
>> +	if (off >= skb->len)
>> +		return -EINVAL;
>> +	len = min_t(u32, len, skb->len - off);
>> +
>
>[Severity: High]
>Could returning -EINVAL here cause the sk_psock_backlog() worker to
>incorrectly treat a valid SKB shrink as a permanent error?

Yep it treats it as a hard error and breaks the socket. The above
patch does enough to fix the BUG but doesn't actually fix the
underlying issue.

Sashiko AI review · 
https://sashiko.dev/#/patchset/20260613082442.3252576-1-rhkrqnwk98@gmail.com?part=1
