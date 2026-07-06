Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59235839C
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365479; cv=none; b=uWrbU53gtWmY+0GHz5Ulo0Ghq2FsaZl8FxDRJmZDAoZZ+gqHVNBK6gkqlABAHiDkFJXPF61P56neBo1Me33rZ2UAZ5zMEdUAW5Zl1zQckDzf9+hANZz801e8TW8Pc6rR96J9b6Ho1MPmZfHaOcU30PZL1YgO9M8+hJ2uFWePdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365479; c=relaxed/simple;
	bh=mztsgjch6Jy3oILZHuGGNkEQrJlp0FBMRXOxe/mPF0E=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=tY8VbKJE+GvBy/K/IZPx6lR3I4JUemj4XImJBNWeIJvpjbvmmJXlSyRrORiP+7uq9OhTXfO6iWZ9H1wpa5fHxvjdPYkUhnsBE0GrlGNIJktVPii34YMTEErvauDkvotmuYPdpCMX8q3c8ttwGSAoKSUd2bHHnpUcJYdd171BIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=oHq+pNnO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="oHq+pNnO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2967402a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1783365477; x=1783970277; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/ha4CTRxcM82KOvmfcXlsVqX2jXy+ahUHiNb+SALlI=;
        b=oHq+pNnO8Ll4VxEAmrKeFxyWeeOHlI7NOsN0cusI1VIlGdSHefo30B7zQmfR5HrKPT
         UGS+/RlzSb6ZUGLjxtp5uHcDE3nSgV++iKWxpxMg9ea83f/qbNDZojwPorr+2CblSpo8
         uxdbnglC/vO2kPK1A+4tKNyh77u48NnTR69jYSc3+Rz6VUIAXYQuthk/r/4zaskxYJwW
         BnTWkRS7jfy1ICvIWsqswxHFMnmwBeG9I598bHtpMDbOgh9tiEyi5xzBMR6HfRAHTLcl
         psRPB8j9uJoKkqtp1xvyMaELGdNqBBj1gifL2ym17qs1qFIpGNwOmM5xXiKFLfQ8x4lm
         M7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365477; x=1783970277;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/ha4CTRxcM82KOvmfcXlsVqX2jXy+ahUHiNb+SALlI=;
        b=Uc/nzssrCRWszsaiNzTjjVDw2iIwgTEcq7npwOVs52mFyutqUHodEc8KdXFgrsrnrD
         DxFK7XR/K0fuEAlkVeL/XkPpiwh8ylAH0Uaq/pETPF0IFHDpNqTTKLolsGbVyYkljM/2
         M8AU/Akq6Mqn6bl14PbQrk/Nah7tlxXG9kAjLFyybz2gXxEjcfYcg+CIQ3Oo6U2lmsDI
         vHdlgd2F5fV8QeWeFeZVqXqkwIW72J+RYZQul6B9BTU04MUkHPGXhHmKyf7Jn3kTpGvz
         D3P30Z6fwCpLDEy3S6haVARp6CnMoKJU/0E44BA55RIJGJc4zev5dGGlK/jWhjcE8Av2
         eKnA==
X-Forwarded-Encrypted: i=1; AHgh+RrFqK4eRrreRsSw9RGBoghZT///9uJ4zAHvfnyTiqMPIeBiwIEr5pYb/XXJBP4YUNWyeW8qZsqe4jwYDMcvzDk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1UOsRkBqYUWvEmiCyAoG7XblP9rJI4IWAFsDPPxxOE4GANVbe
	jPBMuqU1jscFWaBkJfyMouf4AdolOtSXQIXcuiFL20WxrPl24NGofFf7Jpo/JkDnJVE=
X-Gm-Gg: AfdE7cmMPmSEAtORchAKTbCX/f2CgY2Mirrz4FFl+beTfAhUEGzXQ3J2ZGwXygetm91
	IYCeSNFI6dmi4PfFp08IgDVLUFPFGvUF4KbZN7FXIjXIwFjMcSmSv4okyEed58IqA18Tyn70NJ8
	BVvWmYSBT7srmZQjzmwzhDtn/zTCqT5onaMaLhvEqvDZJNpBKWksP4a0WWtoa6KV+RYYTqpZj6u
	hn2RQ3QmjGrhSbhC0yj7nQhX9U5qP3ZMnFUc85v/1RCbMQgl1rlkxzu5cNVOH9fwBQa+lOzijbz
	HQ//XBNecYO5VzOM0YMzYg9uegjn+mQZqk4gpqQuYz7OqmmsMPX6yNLXXwlHXep9eYxiyn3+LVT
	8fpGu1j+o6XaL6znzW41jnyqmdSGWVeXFHEqiyT333nftw4/wmYZJKNS9HPTvMH/iiXDna4T+zS
	KAEfsyk4ou/Z2MOPohmY6Mwg8WsQ2/S0KHQQwP2mWOSLRI8ior3/Pl
X-Received: by 2002:a05:6a21:3294:b0:3bf:6c08:2849 with SMTP id adf61e73a8af0-3c08ef2d446mr2356553637.56.1783365476010;
        Mon, 06 Jul 2026 12:17:56 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921d28d9sm6425530a12.24.2026.07.06.12.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:17:54 -0400
Message-Id: <DJRQAT3QPA3R.WLDNGX3Z8T45@etsalapatis.com>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis" <emil@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH RESEND bpf-next v3 4/6] selftests/bpf: Add arena-based
 bitmap data structure
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706181730.21731-1-emil@etsalapatis.com>
 <20260706181730.21731-5-emil@etsalapatis.com>
 <20260706182758.21B901F000E9@smtp.kernel.org>
 <DJRQ0BBKZLBA.8Q8ACS615TZK@gmail.com>
In-Reply-To: <DJRQ0BBKZLBA.8Q8ACS615TZK@gmail.com>

On Mon Jul 6, 2026 at 3:04 PM EDT, Kumar Kartikeya Dwivedi wrote:
> On Mon Jul 6, 2026 at 8:27 PM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential iss=
ue(s) to consider:
>> - [High] Silent failures and falsely reported lock acquisition in bounde=
d atomic bit operations on loop abort.
>> - [High] `bmp_empty` and `bmp_subset` return `true` on an aborted loop, =
defaulting to an unsafe affirmative state.
>> - [Medium] Bulk operations unconditionally apply a bitmask to the last w=
ord even if the processing loop aborts early.
>> - [Medium] Missing `READ_ONCE()` or `volatile` cast in `bmp_test_bit` ex=
poses lockless polling loops to compiler hoisting.
>> --
>>
>> commit 634ac04142cf736158c99f577c0f903470937bfc
>> Author: Emil Tsalapatis <emil@etsalapatis.com>
>> selftests/bpf: Add arena-based bitmap data structure
>>
>> This patch adds an arena-based word-aligned bitmap data structure. The
>> structure is useful as a building block for components like sched-ext
>> to represent cpumask structures.
>>
>>> diff --git a/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c b/to=
ols/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>>> index 0000000000000..80e814401fb9e
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>> [ ... ]
>>> +__weak
>>> +bool bmp_test_bit(u32 bit, struct bitmap __arena *bmp)
>>> +{
>>> +	return bmp->bits[BIT_WORD(bit)] & BIT_MASK(bit);
>>> +}
>>
>> [Severity: Medium]
>> Does this memory access need a READ_ONCE() or a volatile pointer cast?
>>
>> If this function is used in a lockless concurrent polling loop, could th=
e
>> compiler hoist the plain memory read out of the loop and cause an infini=
te
>> spin that misses updates from other CPUs?
>>
>
> This one seems worth addressing; I would ignore the rest about can_loop
> exhaustion. Please send a follow up fix.

The function is __weak so AFAICT the compiler would not optimize the
call away even if it was reasoning based on the function's body. I
likewise don't think READ_ONCE() would affect anything (correct me
if I'm wrong).

That being said, this function should probably be defined straight in the
bitmap.h header as static inline. It's dumb to require a full call for
a bit operation just because we use __weak the convention for libarena
external API functions.=20

I'll send a new patch with the call moved to the header and READ/WRITE
once for the non-atomic get/set/clear ops.

>
>> [...]

