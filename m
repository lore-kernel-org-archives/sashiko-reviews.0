Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C2233721
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785721589; cv=none; b=ZYb/lA3McRcLLwyQ1VyT3ML9Hou3HJlpt3+mh4DX3KSq3L+Wa+Ioxg8mAjwgeF+EIjTG8yo278cnGv4t14GgSWo+RDjNeu8M8xe/e9dia+nhBcnuqi3um7ocXXA0kQsmxiOJPxr0hGxAlKAbMTSoA5HdYel7JiYpQmzYv3hjq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785721589; c=relaxed/simple;
	bh=1jlWWIcmbOWWWFCr9ip0Pg4XNwbRnANeY4QcpjelTGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PET7pn5Q4ZdzNuMDssnIu+UPxYadu6Ax8/OPB0GOGF5POFqDLMIGJH2PpTu06oQcVIpjbo48zNTVKWL+9rKUyKXIS/GDCqBmb2TgXpxLqcbJKHLnIWg6c0h+gzd1G9v9qj04Qw3fGRJSXYuGBHO53UIBPKZqy+KKwTvIwGwdPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQar53Dw; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQar53Dw"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-47528970fbdso1254442f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 18:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785721585; x=1786326385; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vZFaJC56wzmLRHoaME7uR/uEBiTO3ECIXTOB5Z9VqnY=;
        b=DQar53Dw8iPvtQoEGUhFwd2n/JwmF6uP1KhxdB2ObWddtFGgAwv4PhYx2O1bswq/Ff
         iX1GQC9wb1lXv5v9DPvEF9DNIdid+SD+UjnjIzX2T+9y6nLdly0GiHIjv3j3VDcXoKqg
         xWbVLEIy4uEsDey05r1Z7ozNYekoUlDPGuRTYej7xcSL11fylvZMaFXtbDtuqSuqLTa+
         eaWx+vCY70LV/8u25KD58JXmaj4MUThcYFCtw9lj0sPD6cE95u/j6DKNZ+e6yguebY9W
         3vX/F7cjqKBEOVKROxYJdqnwTmKuuh9n85Ji/v7oB0y7U8kRcMMOeQViWZnow2/9c670
         EtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785721585; x=1786326385;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZFaJC56wzmLRHoaME7uR/uEBiTO3ECIXTOB5Z9VqnY=;
        b=l7ohnUiNOL6RvjAL9PizO7NVHL5g9lZnAPlXU7Xx28VQHvOinpdu2X81sutafmko14
         LGuwZrsMcmgZgCv1RJ8xj2KoyMUeNaMLECJP7ddS8hEoG4egoWQDvZczWN05rpGq/9PF
         masQU/lqszjqSXQp7t5BpmMD8FOZUYU61LwRPyBHL0/PubBOs4GWGwO1Yd3vRtTqJVpu
         B4IjFD6vtLPKmWQtDI0GsGREkL7zY+Qzmxa9gp08WSJl/DDSRA9ctmFCqQ/FyUO0EWsC
         twG3I3J7UfHnxyAJgezw0CTNhpwSS9oHssIAePsO/XjepvshI7uD/YGqp4xpQv8Kejjf
         OhGg==
X-Gm-Message-State: AOJu0Yx0JQwa3eCDnYS8e4/AgiCom45zabNK42aW/r3hu3EDjBlUFhte
	Dw+gIqSpKim8zT2PAFoAZebox3CjY5Bt4dilZCXSKtkKfx03KbG040xkBto1iLC+
X-Gm-Gg: AR+sD11hPmTG+W1AHYSZpZE0AbDFeFEfRLP5Me67GbMzPGamsisKTqnM7mrDwxHxR2G
	9UIUXgsiTSVlFeoVUc+J4bXLM7DC9qJ5yF4dPTq5VywYnbJbHDhEpNHZTYM2K3lMzeEpNbEVYyS
	meUGmgpjDgtGsCouEFpSJsMIwI3JcB/2t4vYGiQBUJpt+HrXlka7ARYoVrDjPkvj0u/TvoqonyD
	5GbiaUgtKAFEbDJPOAn2uwypwPGkc0W9KoejVknlcU2wbzwjbsm/OaF9kWDzpI92Gwe9QU4WJYi
	mgAy3CgyxmtW7jIZopHtYHrutnLaQRolEr8zFfRWPylq0M1iNvSkhoK6rCPr0n307GiKSoYfAIW
	XspwcBxPCnZN4Ds/QLpAswk4yzQdUHIqfEF5z/hjnzfvMatDrJ61gR8x2b0Uxe0etx16jolvSdA
	hrKn72j1iQGPkmAWUtzUyT0CK39TPwzv290dKfjlJ+gx6muTvMKA4DQ83FGw5xTf2MLyA4VGxS7
	TuCvEJ1CYC3E5nngMNP5HvhDeWyRFVB+nx1JgleNP35LL/KesjyqN0Be75cFvlM626X8ADhxyu+
	Ua1RA5Gn06DPufcO4vLMiD0Gs9Q=
X-Received: by 2002:adf:eac3:0:b0:47d:dfc6:b28b with SMTP id ffacd0b85a97d-47fd72e1887mr16054070f8f.30.1785721585395;
        Sun, 02 Aug 2026 18:46:25 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm27302753f8f.37.2026.08.02.18.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 18:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 03:46:22 +0200
Message-Id: <DKEXGY371CL4.1ALKCI5DILNFR@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Shivaji Kant"
 <shivajikant@google.com>, "Kuniyuki Iwashima" <kuniyu@google.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Allow IP_TRANSPARENT and
 IPV6_TRANSPARENT in bpf_{set,get}sockopt()
X-Mailer: aerc 0.21.0
References: <20260801051307.478469-1-shivajikant@google.com>
 <20260801053607.71C201F00AC4@smtp.kernel.org>
In-Reply-To: <20260801053607.71C201F00AC4@smtp.kernel.org>

On Sat Aug 1, 2026 at 7:36 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] bpf_setsockopt() bypasses MPTCP subflow synchronization for IP=
_TRANSPARENT and IPV6_TRANSPARENT.
> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/2] bpf: Allow IP_TRANSPARENT and IPV6=
_TRANSPARENT in bpf_{set,get}sockopt() ---
> commit c5ad31eb12f337883443730bb1839d63112c725e
> Author: Shivaji Kant <shivajikant@google.com>
>
> bpf: Allow IP_TRANSPARENT and IPV6_TRANSPARENT in bpf_{set,get}sockopt()
>
> This commit allows IP_TRANSPARENT and IPV6_TRANSPARENT socket options to =
be
> used with bpf_setsockopt() and bpf_getsockopt().
>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index c21c1daecf9d1..04a9f9d8d07b4 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -5645,6 +5645,7 @@ static int sol_ip_sockopt(struct sock *sk, int opt=
name,
>>
>>  	switch (optname) {
>>  	case IP_TOS:
>> +	case IP_TRANSPARENT:
>>  		if (*optlen !=3D sizeof(int))
>>  			return -EINVAL;
>>  		break;
>
> [Severity: Medium]
> Does bypassing the protocol-specific sk->sk_prot->setsockopt() handler he=
re
> break MPTCP subflow synchronization?
>
> Since sol_ip_sockopt() calls do_ip_setsockopt(sk) directly, it appears th=
at
> IP_TRANSPARENT settings applied via bpf_setsockopt() will not be synchron=
ized
> to existing MPTCP subflows. Could this cause the underlying subflows to l=
ack
> the transparent attribute after they are instantiated?
>
> [ ... ]
>
>> @@ -5671,6 +5672,7 @@ static int sol_ipv6_sockopt(struct sock *sk, int o=
ptname,
>>  	switch (optname) {
>>  	case IPV6_TCLASS:
>>  	case IPV6_AUTOFLOWLABEL:
>> +	case IPV6_TRANSPARENT:
>>  		if (*optlen !=3D sizeof(int))
>>  			return -EINVAL;
>>  		break;
>
> [Severity: Medium]
> Will this introduce the same synchronization issue for IPV6_TRANSPARENT o=
n IPv6
> MPTCP sockets?

For now I applied the current set. This does seem to be a real concern, but=
 it
seems other options have similar problem, so likely requires more thought.
