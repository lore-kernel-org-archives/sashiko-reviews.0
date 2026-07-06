Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781493D952E
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365792; cv=none; b=sqPvAfClVQBAoSDIaPal6650f7GPHNBw/Nu0Mfj7ssoJEgOB7OmKnoEHPNpiThU6vo+Gm3BfyoZpX6gLDS+rcb6b2A0aIsH+/2TLaQmfdbBeHEnT/2VmWFavTL6M9+95hA4n2sX4JBpCoL8zfmTQ66FqvWS8kTAppu/K3VFgwJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365792; c=relaxed/simple;
	bh=g03BCGWBl/ivC1jy+dyZOnLazLt6NWWXfC4FMepz9lw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hz4K2PCzunKj3YzEtJILb87CBT9jcRiYVJ8P1iYq+iC4KRm3DaoHqQa/r2ojwwiajn3/RbDGmSC1yvM4Duhm1z3Ey/7Ixh3NKY9/mf71sE8n9cRQBGIPBIjpsUq3QnVlSSey4429QCovjm/aiWio86oaD6RorWlouSBWDRGFUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF/b0GE7; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF/b0GE7"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-473ba029526so13675f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783365789; x=1783970589; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHcNshfjJMq1olyhjjgbzPvNiWMtPMtkDsARE3cnbPY=;
        b=gF/b0GE7+DNZ0bBJsxAcritWtj3REj3o5OizLvGlsD6biusI+gQHhW91+ClidhkbaL
         UVho6n8KrUp+gsHZWhvcG5o1BemfxKjH9RG+sPuZ2kBVpMm7E5Z4gvQUGHbUXlmjbmMU
         4iNBHgZ7+zJwhvD1sUX+Iwc4w/IbXlzgkL8VUw22C3V4CBvYLzLKhfiUr0M/qOxkoSFu
         FwaW/OJoVowmwD234A4t2+YVucWaqEmFFkure6W+/OgAxEdVArX3kxD5/83NtFvmMEUt
         Pru3AmCbA4yCth2GCJc8C1dQ+FVURC7NMPrRJsJylCVY3kZIf9+/FCxR6lUvjkKwqudI
         cIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365789; x=1783970589;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHcNshfjJMq1olyhjjgbzPvNiWMtPMtkDsARE3cnbPY=;
        b=svDhLynggPLqbhBMfrcZrHMYpUG2RaZC9lt6p+WxP4+2eyJEpUIMs+WvUd6H0sX4x+
         sRCSPXgu5e83Usq0O4Iih7ptGLign+MGu2+QG59ikDQ43Qp97mortcWOnqnOkt1wtImn
         VEedqSTj+QWIDOXheWBjSmIwyR/66Xv8oK75zXY7koYMtpH37y4hbNnTsIBsYDeI8nrO
         AmIApHIreeacTlQyZi6WTAhry6c2S04BTTOvgTBaODMhkYdOA45X7QV3yG1FNXWTS1SN
         jzddG3vAOkhAqGwmdCJxEzDazHphnkx/yHzexPpt9qFFvzq2HrC4Xkjy4zigPNUtvldD
         UxvQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5dY3utjIB+4ZppL20PVGee2O8inq/YOTPTngSyCFhENJn2fOAeUw8jqKuQa8HeN31GEi7dxWRTTy61K6alKw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0ivSV/yazasu0WkN2cDb3LkOlll0DORNo6Z9GykQamHAd9hR+
	J9Pzf9m89mapWfwmkkEUuifVAed3PXVdyhWYgiRV9iALzu4t7tB/LHQx
X-Gm-Gg: AfdE7cmvnkli6MKe7L62hyxiokQHvYEw2pF71f3mppx4kJWFdXpApsEmsurfhMEItdh
	iyxdQ2vWEvYTIEy4rCJwNAdkIY5MxPQIDHgholL2RIEDDJiTXHit0OqesNxrif1LeaF/rGLXvOT
	vm3zYYFFYznLTb69mJztOuH1YXjs0HGvTmJY1y3dGIRIotV5xCf+oVucGFZ+PtHCLe/BLX1FX1R
	RTc6wW8c7RlHNYlp0EbVi1ow3GuKYaqib7KE6NI6CZHIr8i+He75oLf9yqFsHSADtYF5R5aKPQK
	BmeLwcz8Xn1Rr0xlzRqNSoCRfLyrAOrVM2Nc+9NWG70FzIQAP+PIiMja75Eg1yOvNsw/+6SZ4Jf
	mSsN/yYUgbiAlCW39YKKeQkH5dBIyo0msyvdv94vCiEifIAjhPDTQwJmGcW5lDnsIlOfQuvuTyR
	hNNCCgxJIQRBPYvl4GxvcwFC5QImsiStK8tcfLlN5d9TOD40ljVH81qQayeDeiWP6lMwkQL8aMy
	a6/Kylcm5OU/ErxyWUHDQKckIzQ0pqpOUk+WN/xrXAVW8tKzP2Z6mA=
X-Received: by 2002:a05:6000:4407:b0:475:f0c2:75b3 with SMTP id ffacd0b85a97d-47de61c3fc4mr1837045f8f.30.1783365788731;
        Mon, 06 Jul 2026 12:23:08 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm29623899f8f.7.2026.07.06.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:23:07 +0200
Message-Id: <DJRQESQZ2NYU.2OF6WV1H5CL62@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH RESEND bpf-next v3 4/6] selftests/bpf: Add arena-based
 bitmap data structure
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260706181730.21731-1-emil@etsalapatis.com>
 <20260706181730.21731-5-emil@etsalapatis.com>
 <20260706182758.21B901F000E9@smtp.kernel.org>
 <DJRQ0BBKZLBA.8Q8ACS615TZK@gmail.com>
 <DJRQAT3QPA3R.WLDNGX3Z8T45@etsalapatis.com>
In-Reply-To: <DJRQAT3QPA3R.WLDNGX3Z8T45@etsalapatis.com>

On Mon Jul 6, 2026 at 9:17 PM CEST, Emil Tsalapatis wrote:
> On Mon Jul 6, 2026 at 3:04 PM EDT, Kumar Kartikeya Dwivedi wrote:
>> On Mon Jul 6, 2026 at 8:27 PM CEST, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 4 potential is=
sue(s) to consider:
>>> - [High] Silent failures and falsely reported lock acquisition in bound=
ed atomic bit operations on loop abort.
>>> - [High] `bmp_empty` and `bmp_subset` return `true` on an aborted loop,=
 defaulting to an unsafe affirmative state.
>>> - [Medium] Bulk operations unconditionally apply a bitmask to the last =
word even if the processing loop aborts early.
>>> - [Medium] Missing `READ_ONCE()` or `volatile` cast in `bmp_test_bit` e=
xposes lockless polling loops to compiler hoisting.
>>> --
>>>
>>> commit 634ac04142cf736158c99f577c0f903470937bfc
>>> Author: Emil Tsalapatis <emil@etsalapatis.com>
>>> selftests/bpf: Add arena-based bitmap data structure
>>>
>>> This patch adds an arena-based word-aligned bitmap data structure. The
>>> structure is useful as a building block for components like sched-ext
>>> to represent cpumask structures.
>>>
>>>> diff --git a/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c b/t=
ools/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>>>> index 0000000000000..80e814401fb9e
>>>> --- /dev/null
>>>> +++ b/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>>> [ ... ]
>>>> +__weak
>>>> +bool bmp_test_bit(u32 bit, struct bitmap __arena *bmp)
>>>> +{
>>>> +	return bmp->bits[BIT_WORD(bit)] & BIT_MASK(bit);
>>>> +}
>>>
>>> [Severity: Medium]
>>> Does this memory access need a READ_ONCE() or a volatile pointer cast?
>>>
>>> If this function is used in a lockless concurrent polling loop, could t=
he
>>> compiler hoist the plain memory read out of the loop and cause an infin=
ite
>>> spin that misses updates from other CPUs?
>>>
>>
>> This one seems worth addressing; I would ignore the rest about can_loop
>> exhaustion. Please send a follow up fix.
>
> The function is __weak so AFAICT the compiler would not optimize the
> call away even if it was reasoning based on the function's body. I
> likewise don't think READ_ONCE() would affect anything (correct me
> if I'm wrong).
>

Hm, right about __weak. But as you note below, changing it to static inline
invalidates the assumption compiler won't use the body to optimize code, so
let's just add it while at it.

> That being said, this function should probably be defined straight in the
> bitmap.h header as static inline. It's dumb to require a full call for
> a bit operation just because we use __weak the convention for libarena
> external API functions.
>
> I'll send a new patch with the call moved to the header and READ/WRITE
> once for the non-atomic get/set/clear ops.
>

SGTM.

>>
>>> [...]

