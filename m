Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287963B7771
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356832; cv=none; b=Ly8eDQiFsHrOKOl9po1pdGe/pf28qnBK5yL1W/NTHgvN2AJ6UVzh0OMhWxnMSL0eUGGe2E9s0rJ/ycqlRk1MGoSzve671l6/qyxw0YyN5372ZcJtqdzHBrA0FzAOe4uQZEaCFuP7CD4grDE4jzdRSWOjSbhrE4NexUEKdGPGpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356832; c=relaxed/simple;
	bh=MeXfYhzXMPHdPIsGXHtVw7BYqOJa1dL6Rn+GgOZlz7Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R17RWkw53UZhhV1cfsLcS+4OzUtXLuwah51fjWpK2pcGtoYSEbuM4/r96VuJxuibpLdMP65aLX30ccAd8bR9GRWSAlor8Mto3RA9xBKJ5mN+R01Qv1s9qjW5T7ZowKPiVzyL0owQ1Z/aT1m3hseu5EBSpuPXQUIsUS1yG2ZgEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLhn2JGb; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLhn2JGb"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a18e266026so1615472a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786356829; x=1786961629; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K9UaDyUPuckC37zrOmaQcbngoaGVbYZA3xXl4q/mPgY=;
        b=kLhn2JGbexzoXgpBK0ZPIUEppQZOaKkTPBQNj9h5DvliIjZMcE2MBiyXC6ACc0Qmw7
         cAUTTGNJV5tMPZiYJOHNOR8De+AXUwd9CRqTCJ+cqMzMrJOAgSahEurr59pg0C6PMlYj
         H4/KWt+HZPsNSopUWO2Hs6HDm+QU9Cer664klOOgVcrtaUVW3McwpsaXQJiAi39uPPj2
         rtgfoIR8aIVX7TpCQMMqcVxT3qrZAB7bNc2QQPkL9Abdd8uPxHukpuAzIT7pDEup13yo
         QZOFdht91La7SA8+6no/GGlCgeAvv2lylaC5cIGj3ugm+3QjHmZGOWiygvJzPpXaIaSw
         NCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356829; x=1786961629;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9UaDyUPuckC37zrOmaQcbngoaGVbYZA3xXl4q/mPgY=;
        b=n4NsPre7xONQxEIv13d9qgcL1W7412hsbSzrp9kDSdBxmbsg4thanRKrp9TqgXfYYb
         V75jTWJApPDEAsiNy/g2JAFjMemY4UihVzWQW4i/KDl6ivU8QSwTYf8yu7iFXjJ9pZYk
         VYecTbPRLml5NJCh01GsfVMwqefePjyJiN2NlkePzUkkyq7cHIAZYTQ5MPSH0h/uLSUH
         RHgMXtWIqrr9bbsLK0f89s+JoSgSx2oBIZn81ls9iOwtydFjHVg3hYkTMgBodDdR4xtJ
         YRtpclDQYbtaqSskrb4zOgWbIlhW/lSKtZaeH163+oWiKkeFIJ/VhQi3CLXTcaiLx+rb
         lLJw==
X-Forwarded-Encrypted: i=1; AHgh+RoREdDPNc88KxmxaLwyN6WOIsHuQbn4hHy6T+6QYaQHctHMVt5XyiExsJtsYl70/a2EW87azM5+YO19pa1Wnsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YweZ+Fp7IzTIxGq4rf8JS7A7oSq8am4fuDkO+WFnT283FtQVnoC
	YA9SkaGZyGFullVqStCy6ggg+2DVQYCevl3rnwizahszAmZsFTFDp6EbED5o0amKrBXmFMuNQpL
	7Qe8yKgwYBaIyI74Nkg==
X-Received: from edyc9.prod.google.com ([2002:aa7:df09:0:b0:697:8356:d9d4])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:24db:b0:6a1:feb6:6d78 with SMTP id 4fb4d7f45d1cf-6a1feb6806amr5150242a12.18.1786356829111;
 Mon, 10 Aug 2026 03:13:49 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:13:47 +0000
In-Reply-To: <CAEvNRgGHuiXG1KZ24+kX-ZgTS_rqGPFqJMjoJhqf6GpZh4xN3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-2-tarunsahu@google.com> <20260728122245.AA83D1F000E9@smtp.kernel.org>
 <CAEvNRgGHuiXG1KZ24+kX-ZgTS_rqGPFqJMjoJhqf6GpZh4xN3g@mail.gmail.com>
Message-ID: <9huzjypy8eqs.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: tarunsahu@google.com
To: Ackerley Tng <ackerleytng@google.com>, sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Thanks for reviewing it.

Ackerley Tng <ackerleytng@google.com> writes:

> sashiko-bot@kernel.org writes:
>
>>>
>>> +config LIVEUPDATE_GUEST_MEMFD
>>> +	bool "Live update support for guest_memfd"
>>> +	depends on LIVEUPDATE
>>> +	depends on KVM_GUEST_MEMFD
>>> +	default LIVEUPDATE
>>
>> [Severity: Medium]
>> Is the implementation for this feature missing from this patch?
>>
>> The commit message notes that this patch enables live update support for=
 KVM
>> guest_memfd files, but the newly added LIVEUPDATE_GUEST_MEMFD symbol app=
ears
>> to be unreferenced in the tree. Since there are no Makefiles, C files, o=
r
>> preprocessor checks that use it, this currently acts as dead code.
>>
>> Could the implementation be missing, or was this intended to be introduc=
ed as
>> part of a larger series where the symbol is used in a subsequent patch?
>>
>
> Sashiko is right here, I think this patch should be squashed with the
> first usage.

Sure, will update it.

>
>>> +	help
>>> +	  Enable live update support for KVM guest_memfd files. This allows
>>> +	  preserving VM Memory backed by guest_memfd file across kernel live
>>> +	  updates.
>>> +
>>> +	  This can only be used for the guest_memfd that are fully-shared
>>> +	  and pre-faulted.
>>> +
>>> +	  If unsure, say N.
>>> +
>>>  endmenu
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121138.1=
103610-1-tarunsahu@google.com?part=3D1
