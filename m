Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E113D53C
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781659187; cv=none; b=nsktibflxEZcnAECSbwWSjeGB3eRb4hVLiaBBt7W2svRlMkc8mAiqeGQbakjMJ16pN+n9+NZEAN/cDCz3f6rIzRwpAOKltnqq/ZRyr4xhh5CYUtMdAVxa2auZAH4dQhfHn3erwft/nEViaDBGDv/MnwiUiGLmBqTkjPyqPRzHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781659187; c=relaxed/simple;
	bh=sTH9HHQl0lFCgAsKzg6XHuSikL70DNcqx6O4LDhhPHQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nox3Ne3x/sf+amcozrY27nIp5o5kxRaCSclawOtxATQCvXF0uSK+kwOp6D83L52vl3jUbMH4M6+UB0em/pe4gpbxfKG08JZQf8YwhNPOJMVfWoh90kcN+qcnPv8PDyB0WMWLSOJozyAhdhbu1VDHCpJPRwtgHtewE/PbpM/azWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=OT/rMCjb; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="OT/rMCjb"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1688200eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 18:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781659185; x=1782263985; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUoFwkrunjip/o5mE9aOfiRs/1adrK0vkFTMn8eCPxk=;
        b=OT/rMCjba6wiEGVT69NN/h1gxzK91CL2ZCgOcWrbsPyzN0pcNH9Qrh4jOtywKLcpMJ
         +DEyzBnOqGh0ZLxwEM1GppWfJmT1kSsuHg0qna5+9sM8LwtbCHbHGdoKbxwynGB9Nanm
         P0xhngbY4yiXFHvbfjImgSrK3TWWFgqmIbKmdXECfBVgaoPf8pn/d8y/tIN7uzeCDFHO
         BXCnGxksBvKmSWi/RuLNrR31UR20e00GWAwH7RaXV5C00rc3FjvBUzJVkdWbaF2Rsl6I
         0nzWNRUEuI4rcGBxXGUDPWmoA9/TDtY/Q5E6p83gy4pLjstU56KNwZdEGKRxpz9sdvgA
         4Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781659185; x=1782263985;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUoFwkrunjip/o5mE9aOfiRs/1adrK0vkFTMn8eCPxk=;
        b=XpJypQpS1+A524p6ca5BD6pxwZ7GPl815Xkbb0fa/BajCKmfVGkKHsGnjc7jWIlk0A
         qQtb6kKkcTj7s9B5aQO1lmrj8jKdub/vp/sJj+XbZZAx6vTv2ohNRe7+hFaxsgI9Y7C0
         Q91xyEmsoy7j2db3OKVeRS69VyemaH72pbS41EkKKCv3kruzEtp7ZaXSzObI7+25U+aa
         autc25BXPCQGMlSM8YxliDK7yl4eC+2ah2jQYIfT7vaKO5YFzzOhZ85rfcV/XCG9IRv+
         b92fdDGDHA4e+qtSIcmcLMTie3uObqMaOXTD/bJQXeJmCj3PquVfXzsCZsVY/yOHtcyI
         hMUw==
X-Gm-Message-State: AOJu0YwVSu7Yiyb4NLEn+U5M6ke4VA0KorFPD3l4FllCvC/30ypvHW1f
	NfrPGzkzYL7OZcfUsoQiAEmXE8/j3kxeYAnQvCOpEAVHwDJUHkhc5kLigOG+0g5ASnHFRZKx9hi
	iPoIkQE/Rjw==
X-Gm-Gg: AfdE7ck3BmwKQVLf5ZatPWNRbOd9O0a3teNvannpoMHjeiRqkU375FiaTrIf+nsCAEL
	C3abVoP09o7ZsaxrNrbHWhODf5Ll1x+Ep+p7hrmr0KpKAT7RUIFKAs46/7Cbm/Bvv8B9LuZR/PC
	x+qU2ANVP0C6nN1IEFTMrRj+HHrBOBfePwrutvMfcLbH2bNjZJbuK1PCNola2YvW5EFOBildrue
	fhSlvnn+WEu8IE/bDl1itFwCcIKMcypryDWXlbSImaQYFDIXdZ4jLrERtIx6ZL92S0/ZFbs2XC+
	lZK+p6hUsigkIMHxDjdOJoVYcf4dU9VWbq2+ipt0YL54Qh5VzvzSoNHnJfJDyJb9W6VXRSbiYg4
	aOkaQmqVnCk9PniRxfCahS62h64+JyanzsZSe0590V9pidSh/bPzNViKpAAoFsVVIaaYoYSWUR5
	kyigCj
X-Received: by 2002:a05:693c:20d0:10b0:30b:d344:abcf with SMTP id 5a478bee46e88-30bd344ac71mr211732eec.5.1781659185280;
        Tue, 16 Jun 2026 18:19:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2568])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm21540878eec.3.2026.06.16.18.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 18:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 21:19:43 -0400
Message-Id: <DJAXGXLF4NHZ.17HAW2R1YDK7I@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf 3/6] libbpf: ringbuf: Handle position counter wrap
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Tamir Duberstein"
 <tamird@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260613-bpf-ringbuf-fixes-v1-3-e623481cb724@kernel.org>
 <20260614020552.022A11F000E9@smtp.kernel.org>
In-Reply-To: <20260614020552.022A11F000E9@smtp.kernel.org>

On Sat Jun 13, 2026 at 10:05 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] `__bpf_ringbuf_reserve` in the kernel permanently fails allocati=
ons after 32-bit position wrap-around.
> - [High] Kernel-side `__bpf_user_ringbuf_peek` incorrectly handles 32-bit=
 wrap-around, leading to permanent stalls and bypassing bounds checks.
> - [High] 32-bit userspace running on a 64-bit kernel permanently breaks B=
PF ring buffers after 4GB of data is processed due to pointer size mismatch=
es.
> --
>
> commit ce5e8d811804f9ff598195a7f394512f77c373b0
> Author: Tamir Duberstein <tamird@kernel.org>
>
> libbpf: ringbuf: Handle position counter wrap
>
> Ring buffer positions are unsigned long counters and can wrap on 32-bit
> systems. ringbuf_process_ring() stops consuming when producer_pos wraps
> below consumer_pos because it compares the counters by magnitude.
>
>> diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
>> index ae7fa79b62170..b7adce37b5196 100644
>> --- a/tools/lib/bpf/ringbuf.c
>> +++ b/tools/lib/bpf/ringbuf.c
>> @@ -268,7 +268,7 @@ static int64_t ringbuf_process_ring(struct ring *r, =
size_t n)
>>  	do {
>>  		got_new_data =3D false;
>>  		prod_pos =3D smp_load_acquire(r->producer_pos);
>> -		while (cons_pos < prod_pos) {
>> +		while (cons_pos !=3D prod_pos) {
>>  			len_ptr =3D r->data + (cons_pos & r->mask);
>>  			len =3D smp_load_acquire(len_ptr);
>>=20
>
<SNIP>
>
> [Severity: High]
> This is a pre-existing issue, but does the kernel side have a similar
> wrap-around issue in __bpf_ringbuf_reserve()?
>
> kernel/bpf/ringbuf.c:__bpf_ringbuf_reserve() {
>     ...
>     while (pend_pos < prod_pos) {
>         ...
>     }
>     ...
> }
>
> Since pend_pos and prod_pos are unsigned longs, on 32-bit kernels, does
> this magnitude comparison fail when producer_pos wraps around to a small
> value? It appears pend_pos would freeze at its pre-wrap value, causing
> bpf_ringbuf_has_space() to permanently return false and deny future
> allocations.

This seems like a fair point, if we're going to modify one let's also
modify the other. Wrt the "32-bit binaries on 64-bit" Sashiko warnings
they're a bridge too far, we have to draw the line somewhere.

Can we also add a comment as to why we're using !=3D in both locations?

<SNIP>
