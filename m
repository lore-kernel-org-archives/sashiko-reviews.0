Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59D5678DB
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191786; cv=none; b=QBQ+mRHeQm5lK/Vp6om87gHUi2jF66Xc2CLHUo32fFOmVWprI2bn2Ri8bEB40Xk7XLK30X0suJPPLXctsfN437FR5aBSsX3TI1BVOXR6xPs61D2My5YWGTUs0b3ayNnijMN2hcvfmAGAueBqpMb/t9reC8BmTdg5O50/8nmfIzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191786; c=relaxed/simple;
	bh=1KwF/7YBtIPZkRPYZUO0p+gOfbBOZvlijizewDOJ8No=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=apFzM4f7Z5DTedLvUFriY3ZmosvftQd+h9dpR7e18VDDnylyhhX/uw5eJ4fkmS18V+Xlp8HnMMIdmDhf+NXAUd6OUZEChsCYUhXMsKpyTC6UxbEkC6RNSoSSNs02lgjZvxhv8A2UrUEn4W02vkRyaLOrrh04K1veImNbVcQajD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg9AAMHA; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg9AAMHA"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49814d35686so293655e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191783; x=1790796583; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlP694hjPzjhxFPT82RcykXfpGBUKpwzMUdCD5lt6oY=;
        b=jg9AAMHAdmVPpVrMsfnRd6ta0sWMKaZP7kp615bU59h8dzckPeByESBIEDFP6Yd/p4
         eHtxIuJXIYDrTbAOLx2zs6XHro4pl85g3FVHj3Vjss24FVBca8SqTDTFkVo3h89yOulX
         WUWT+J0mp81+sfa3UjZidFZ6OOhVoeindHKX0i7sZVnyNuD43m07pUi9DnkAd0SunLdZ
         AvCzpe+mg6Zns9J7MdBufexR9SC2vewt/2Z+TVh3quxDGV0ZDvgPPcFtBFJMpAEGAXR2
         0WjEYbN33fkAsHy2DUgNFeds4w+SML6O5HDC3sOpbka82VglD4vumOVopuZYaMGovcIj
         kM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191783; x=1790796583;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlP694hjPzjhxFPT82RcykXfpGBUKpwzMUdCD5lt6oY=;
        b=HX0ipQ29krpaA4plfxXl1m3rYVRF1fmuthVVBdFi2ylwbgJU0dQ0FN2Pr8xd1Qm+qM
         kKCiLxAgschLmArQuWgnz1F3Inwazv1aYOJGnUvnBAdFOXMKLDxhi2af4rafwPR/+Zcx
         CUUuK/f/zmN9yas6Znal83/V7wUUlBtSQksOzCcMCVchhAzoSkiaCy1w5rD9Qz6oHLdZ
         uVRgc5Eku0OlSk24iIMOp+Gj6G1iyzJraB11Y0ItYDIUhd7DfKAio/Dp0j4ZK3BHlJJr
         7j1UN4RvJkG2zDhh63lPs1ZgAvxit4KeT3RTRAsRsfG1HuSwgfisP6EuGiRNa2gCWQLL
         k+GQ==
X-Gm-Message-State: AFuF++l4OF9XCW0c7mo+h3mzuYQdQZ1VAq7wLiPNyRMoHwv8kStOZD5X
	/WSkhpN/PaSO9nwyYsttlh8T+wrswa2TcyK2VLVtOBJMGqfHyrAt2khfLRmx7/J/
X-Gm-Gg: AYBFou2DYQo0puCRUd8k1XzE7uyoj6AEDmhITsxR83Udah0qHY1azb0J1kSnwNpWCRU
	egsuW7alvIr9KD8UhnetJY86d4OGQOzGN6qjwHB1oc5QKQIRsizZpr3zUS4cdGWijiAKUejzdG8
	4kG7dEzJZ0UDmw+K1Xihk5CtI3/zQkO7uUdWowlfYyCL+TPuljSvvijxyJHN3zJgRNTQu+FENDg
	zw7xFfiOKyPCide9XXcfotbgs29JDt8XscIQVQlB6zhHi5j5q1Z9Q4o7S0E3KqH0wczvIZdbXou
	mtDURAjnr2FNxnbMEalu6UAun3M0vq4OLzPyNkK6XI77PPh2D0igBEAEdS7QYw0xTTveaYJPPNh
	DpySFt4JxH3TlvXUH0aCTwRth2hB83G2J7hjtGlBcV+plDNy9AKyZBDwfYhwb1aQ1AsRqWrtcEu
	6klJZyhVy7e4AEnS3k67hJqABcnWaAbsrNNPbNXtcVeTLDnw/q7JGHLGMxIdmg1FrKO9rBXPbTB
	LHDanZvjWqbwjwpiuuUt9sM/lJz/Jwci7Gx4zCafsrYCPad0huo4/ifXFhlfhw5dviWX3k/ItWH
	l5WwbBI4aQwJWjTCykCrE7GqvjCwHj56R1GCJnu/SJiNChIn
X-Received: by 2002:a05:600c:4f89:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fe66c80c8mr3977805e9.2.1790191783164;
        Wed, 23 Sep 2026 12:29:43 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cca160sm7822465e9.12.2026.09.23.12.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 21:29:42 +0200
Message-Id: <DLMY0VFF2ZG2.2LGZAQCRLJNI@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 11/18] selftests/bpf: Check liveness merge
 of masks with different widths
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260923191139.2816206-1-memxor@gmail.com>
 <20260923191139.2816206-12-memxor@gmail.com>
 <20260923192607.8FC661F000FF@smtp.kernel.org>
In-Reply-To: <20260923192607.8FC661F000FF@smtp.kernel.org>

On Wed Sep 23, 2026 at 9:26 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] bpf: merge_keeps_whole_frame_read test is vacuous on some 64-bit =
archs
> --
>
> commit 1299c778ee1ba2ffa8d447fa3ce55a6d2aec24cd
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> selftests/bpf: Check liveness merge of masks with different widths
>
> This commit adds a selftest to verify that merge_instances() correctly
> widens liveness masks of different widths when a function instance is
> analyzed through different call sites.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_live_stack.c b/t=
ools/testing/selftests/bpf/progs/verifier_live_stack.c
>> index f8758eb62dac5..a94365decd5f1 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_live_stack.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_live_stack.c
>> @@ -2861,3 +2861,52 @@ __naked void narrow_store_defines_nothing(void)
>
> [ ... ]
>
>> +SEC("socket")
>> +__log_level(2)
>> +__msg("stack use/def subprog#{{[0-9]+}} merge_read_all_callee (d2,cs{{[=
0-9]+}}):")
>> +__msg("(79) r0 =3D *(u64 *)(r1 +0){{.*}}; use: fp0-8..-512")
>> +__naked void merge_keeps_whole_frame_read(void)
>> +{
>> +	asm volatile (
>> +	"r1 =3D 0;"
>> +	"*(u64 *)(r10 - 8) =3D r1;"
>> +	"*(u64 *)(r10 - 16) =3D r1;"
>> +	"*(u64 *)(r10 - 264) =3D r1;"
>
> [Severity: Low]
> Is this test effectively vacuous on 64-bit architectures with a 512-byte =
stack
> limit?
>
> The precise 8-byte read at offset -264 touches half-slot 66. This means t=
he
> mask requires 66 bits, which on a 64-bit architecture occupies 2 words.
>
> The second pass performs an unknown-offset read, forcing a whole-frame ma=
sk.
> For a 512-byte stack limit, this covers 128 half-slots (128 bits), which
> also occupies 2 words.
>
> Because both masks occupy 2 words, the actual widening logic in
> widen_frame_masks() is silently skipped, missing the intended test covera=
ge.
>
> While later patches in this series might raise the stack limit for some
> architectures, the test remains mathematically vacuous on 64-bit architec=
tures
> that retain the 512-byte limit (e.g., RISC-V, s390x, or when JIT is off).
>
> Would changing the precise read to an offset <=3D 256 (e.g., -248) correc=
tly
> produce a 1-word mask and test the intended logic universally?
>

Plausible, will investigate.

>> +	"call %[bpf_get_prandom_u32];"
>> +	"r0 &=3D 8;"
>> +	"r1 =3D r10;"
>> +	"r1 +=3D -16;"
>> +	"r1 +=3D r0;"
>> +	"call merge_read_all_mid;"
>> +	"r1 =3D r10;"
>> +	"r1 +=3D -264;"
>> +	"call merge_read_all_mid;"
>> +	"r0 =3D 0;"
>> +	"exit;"
>> +	:: __imm(bpf_get_prandom_u32)
>> +	: __clobber_all);
>> +}

