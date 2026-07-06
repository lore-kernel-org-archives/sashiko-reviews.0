Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551F3911B8
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364657; cv=none; b=ZMp58d9+hchIJ0TZUj3uzTTzB0xtvwXTWRXjsA9pgHnlqE8ZQjH0/a0EPv3G5uaupeDMm74ii2DTOZAP4Gp/9qqY9EDcKiknHbAQkpemvrEWGHw+rG1mkY+fQFrAwLH9gDo+MmKCqPGlZMzmD3se/tZqzwg+GwjE2+3RclKBM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364657; c=relaxed/simple;
	bh=REGMATiMN1YgapZMWS6YFsRTpoKXFt8/jAMiDLVAKVo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=TLiM/1kiMTiFXI1hSnpItkWPFMPsC0BWfrJ/7Quxokzt11SHHu32DVkA4zsaW4SWpD1ePJGQ+43e8rzRjWOlL0bXVjaENiHhkfXk/qSCXLfPhhcup7Wg/AzK6mf3/Ejqb9qNWDWnfXrqTzKRo9EK09vrIH+w1rw6EOMM9kAsll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6gS9WCi; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6gS9WCi"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-493d43b6c28so1380665e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 12:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783364654; x=1783969454; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V2CVMlxLpE8OxL57kzpm7Srk1evLXl+Dk2fXe596u80=;
        b=X6gS9WCipZhoNu7Id7X08KfNRIpHrO8F2RsV13OXoVU0OaD6BC4hwsXao2X6WCpyNe
         FCoeqpB2KimBbuogs8zoOJl2/7ryo+iqqAQw9OvXrmInadY6F9uJq6I02XMozBqBhdwx
         W8LlS03pFVPxKtIpzym6uVVeJwZtDcHSMfHtj9eIRkFafI1pUOd+LRcyBX6LV+wa7HIW
         iRIE4P4t7d5vjN/Q2bbNkdGMQpU/3uohbUncnQVWNuao2G4QhXXp8DrhAZE/c0GWkfrj
         jZerIW4M2rjEvUUTWmSNLNiihLwMsF6CDCgGQ3/wX0IN2fGofWxA2BD7vWrc/lrRa8As
         BJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364654; x=1783969454;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2CVMlxLpE8OxL57kzpm7Srk1evLXl+Dk2fXe596u80=;
        b=NmBAdkTTzU5xR/yeGi6ENbAA8935+o1taE9v3grP6W1CFoQ1i9/39cnR4m87RMVl2e
         kZLM9wyJ1HoXFX+KzBWzDO5r3dPMhY8O0rUsN3ov9DAQ2di0eI2G3g8aIZQUm8Nt/9ib
         sFgMw3W1CKnIisi/SB9SO1z81Ll7Jl1qaTUWo/YimSGoHUHuVfjMN8dxa+cHmNuEJ0zf
         zp0smG304DnBQ+18391ba7nsIEYI4G7Ckf4Qd8F0B7IOlHnLSabe+qfU5v4iCsVfXyhN
         qZVN5bC5MaiSlcJDMYs0vlpfnkYXDlq51cRGuzAAOCQWl9dko+wqjEZWFbOYBNobeNvh
         qGhQ==
X-Gm-Message-State: AOJu0YwDvVSNHxrrzQpxLGq0L5F/i0lMnMCX+ICrzcKQt7Q76KWFX4NZ
	1bSEgr3XgOzS87Js6WQN/wb9Th/qMnrRD+vmhTkeaq44ofMXTvqDUYffyorxJcLp
X-Gm-Gg: AfdE7cnXt460vgBKwcvV8473oe/cR2z+q3lrp80//xAQmAKph6aSgzDHNO8uNzrC1UG
	+BaKR6jFv5vg+7Jj+Rms5hHODgcF911oq9WsQlmwTJdtg7tUTkPthcBw8r9xNS7Z4ynJd1LaYRd
	HAgQAeWUWQivOA8x15lykqXYILzY9ndCzTYw+6EMfORG16Qf+lexoujFZzV2lMHeqBL/fgklAev
	wTo+d/rvamVEChQRoOds0qu6yZdic7AJZp3xIZAHWzXfHNHmco+au7KIlmXEYt2GYNxCx39Rm0a
	0aMP3sk+68u5RkputjhCR2Fukej/urE7HGrc6YzufDtxfQH+N0dSsKjkz7MTFv7I7EcnAX/TXNU
	rQ/ovMFXRmnJBwzhZ4oiSLAd/p77W5XcSIgZ9lHz552kZs1do4NihrEyyo9SCyHUPe7lZ1yp/Q/
	HM0Au55tb7prz+T3AnsLJx5jAHxu94ZsFiJ7a6XId78rB8qaGRRKuYeaMj8luLyma93sOD6VymC
	Hb/MDPHMsrcE7afUYFmoPg3t+vvV7XXQT1uBPIwjo7J3bEwgZmHhpQ=
X-Received: by 2002:a05:600c:4689:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493df088e59mr21289615e9.30.1783364653603;
        Mon, 06 Jul 2026 12:04:13 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01f5716sm3882685e9.11.2026.07.06.12.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:04:12 +0200
Message-Id: <DJRQ0BBKZLBA.8Q8ACS615TZK@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH RESEND bpf-next v3 4/6] selftests/bpf: Add arena-based
 bitmap data structure
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260706181730.21731-1-emil@etsalapatis.com>
 <20260706181730.21731-5-emil@etsalapatis.com>
 <20260706182758.21B901F000E9@smtp.kernel.org>
In-Reply-To: <20260706182758.21B901F000E9@smtp.kernel.org>

On Mon Jul 6, 2026 at 8:27 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Silent failures and falsely reported lock acquisition in bounded=
 atomic bit operations on loop abort.
> - [High] `bmp_empty` and `bmp_subset` return `true` on an aborted loop, d=
efaulting to an unsafe affirmative state.
> - [Medium] Bulk operations unconditionally apply a bitmask to the last wo=
rd even if the processing loop aborts early.
> - [Medium] Missing `READ_ONCE()` or `volatile` cast in `bmp_test_bit` exp=
oses lockless polling loops to compiler hoisting.
> --
>
> commit 634ac04142cf736158c99f577c0f903470937bfc
> Author: Emil Tsalapatis <emil@etsalapatis.com>
> selftests/bpf: Add arena-based bitmap data structure
>
> This patch adds an arena-based word-aligned bitmap data structure. The
> structure is useful as a building block for components like sched-ext
> to represent cpumask structures.
>
>> diff --git a/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c b/too=
ls/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>> index 0000000000000..80e814401fb9e
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c
> [ ... ]
>> +__weak
>> +bool bmp_test_bit(u32 bit, struct bitmap __arena *bmp)
>> +{
>> +	return bmp->bits[BIT_WORD(bit)] & BIT_MASK(bit);
>> +}
>
> [Severity: Medium]
> Does this memory access need a READ_ONCE() or a volatile pointer cast?
>
> If this function is used in a lockless concurrent polling loop, could the
> compiler hoist the plain memory read out of the loop and cause an infinit=
e
> spin that misses updates from other CPUs?
>

This one seems worth addressing; I would ignore the rest about can_loop
exhaustion. Please send a follow up fix.

> [...]
