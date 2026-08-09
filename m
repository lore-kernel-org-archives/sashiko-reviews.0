Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84B282F0E
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307166; cv=pass; b=hrjOdGUtv5mzg88LbS5ZFtcDaeqmMpN2CFpTxnasc7/g2CTIT7oGt1AEskWKAhPYb4ydajLmcRLChwekrSTwlz4s8Nzuw13l2lG1TC9Ma6JKhx2Xno/Lr26R1vOOIKOt5EXbduLB0TCBY1cG32oVZzEkTdaNt0KCtmz2CBLp2j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307166; c=relaxed/simple;
	bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onEW/84ZlMnEG+KtG8DgjAEE2hNISES+U17y+/wcp9LD6hjCuVOyQi0ug6DInhniIZ8O4Tf3z+OQ2j+FjCeVyrepcpSqmeJOSggnxhTT3H56C77qqWvqXJPCg5I50T3grdNkCtgEPvnBuSrOS9oax7hET2JVKnHOWjZ6W9Ej+Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=fh5woe85; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="fh5woe85"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso2049567a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 13:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786307163; cv=none;
        d=google.com; s=arc-20260327;
        b=JrOjGBO7Wk2Ccfu0+mjszAZS26SVpW5YI/91KCktj6n8Pv9Xo7apza/QOkXoAXm1II
         jdcCG3RzyOEm3PZjAi/Py/+NCKRQQLBYF3OebfwX9yOTs3VcdJZqPuG0UQXLNMOVPX9z
         NJ0t09pXWhoYNkYqkZaXS0ebN8g4WlHZXqvNWx6nKivDLbg50AoEd+FJOC9Yh0h2rxxe
         zMgBUiP3noX3ZN63uNClcLsAWQ9jsU7EbBDhWHMvYsx5A/4wwgchGJDtq/eV8PpTeVFP
         lU1PO9tqoIBjrScDMYByvKI1evA/UTzwudjQQ/GmOU4wvSlpYFLJoYJyURiRTJF03mDt
         7kMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        fh=r5URhQl6whOcnDbP2Lcwh2ZUr6KpnezK+hz/MEOF1jk=;
        b=DJ8YRnUiaPGo7pMyX5Wgn1F0crvVDJtKD8TIu3JWzFpdfg5NkRme4Vk6CW9M5w1BBh
         4ydkRkSXoEN44FuUcR4bBbbP/2FKuQnvhsyUUVpFzFaF4lje0BYmGmJBCk99HPd/olS6
         OBMPwDpcZD/eDAGyQML43h88ASOefmWLl+Gj5cH+kIeOeYRNA/IAVGcEh838WclSto6+
         deQmF7ZdRvh4Waq9xHeHGfm0DPqbxPeeVHXkLNhLtHIonlRLL8Nmg3q8iMFqc3N2dF2z
         PJfd2gCHL82N+FKqYQWGApB6kMtsTJepkUCGM4nBnA87KC7mxOeJBejrh6pkRoC86/IL
         L8ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786307163; x=1786911963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        b=fh5woe85fgVJyhWJAqKdegm66WIk96JC1jn7R23eAPh+39nw4fDU1I62x8OiOSJjl6
         cuqDL0LZG8PV5aGeImWzGRsuj7qsKmH/IBcZ+NBSxR4SX1IWuVJBoDDWkcZnfR3sHeAO
         LZt7lVfV0LoP7M7gRplVU/VhPvYnNwHs+BsllzFp30nFC0hnj7ZzpKZtEdQf9WNt4+55
         4owWtK0baAW8g/uh9ZYk15tvEHofNJMHhS77ATNyPDOSZKEypCDNRBPdSNS+qSbdyRDh
         nG0jaijQDL49P8CCLgXVktRT0e+iHMosJoh/QDai9dXKVzclPAQlGVkK0yHfOnlzuXKU
         WhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307163; x=1786911963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        b=QFEYFDzrVkuyMf8DQTcDMe+nSdNHyRBWjORGIoQaZTuCRpHk1DsUsNUQzPjr7dXZzW
         VQDquSwh81bm5I6Tgo5M+pC7Z9uRxBmwSjqeg7bmqLXZcrAkyy9pP4l69K0xQEilW4Sr
         OU2pcg8KoKlra2iVraXA6rAnUjATkUdqMU50FaYsEf7dNjGhqqEEyhx1vyPJNP3dbbly
         j8S8Qvb5qoQ+rq7s4g2uDrGR7JlXWQBB/YL1FLLjWrRPHH8EAYwRlr8viz744QZFlzDA
         jyHEeNDhylhzVAHAyJAgmJjQIpDzHWQAYzXY8rrO39CMKbnOmUw3lgwls+mInoevDozX
         f6Qg==
X-Gm-Message-State: AOJu0Yxk3DEeETlU1n1FEOQVOgj3q2RCB59+xb91XCfzdouKATvqecKk
	0c500doKrKcYFwuQn4c0VlZk+OkfkyfCef9ngUHH4uJ/aryP2KUfEySO6qo95As6KBkrEcSI6B4
	qr1BchiYjVwWfwp+24L9pBlRdf3YsKwizKMIuvFWyjmEBpI2SolouoPkuJA==
X-Gm-Gg: AR+sD13CEtzbIL7sLw0GBTiGQpCif1yIz39/HxBci6LLFmsrPFC5rrAqkaoPwfY2UX2
	hj/gRXAqOldv9E/vlkIMORQaLIzC/w4Ch/tn38Jk95g+a1Z8I3jh1L/7k/3y7wTg8rxaJpP/sLo
	WCvY7XfNdGPrExbIg+2+sz0mPY5MGSYaAB2ZZ2gfHdHzNhVhetBCBau8ZDuU4WHNSbt/m1Jc75d
	yNePpjAmnb0q/w2eqolI++zQlhfTLnJpml+hUKVg4IJHjoPv93j74/e13qTgpzAE0P4W8/D8b/D
	VClB+cE3LH30SsLGBoNHerb/KPatzBru+Yr0ypcx6m6cKQ==
X-Received: by 2002:a17:907:3ea6:b0:c1c:208c:c04c with SMTP id
 a640c23a62f3a-c2039e2c327mr1725890666b.27.1786307163324; Sun, 09 Aug 2026
 13:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
In-Reply-To: <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 16:25:52 -0400
X-Gm-Features: AUfX_mz8gmq0KbPhziNuLRWigX7b7YR9JyLRCiqQe7spoeta_my--KKNVur9_vo
Message-ID: <CADBHdQ2e_ib9Ci9O2QQYqZ8iJfD=RwCCHF4cSaBzigvheN0GPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good, I'm very inexperienced with the kernel workflow (I didn't
even know you could e-mail patches directly from git). All of the ids
passed into this should have that data, but a sanity check for an
invalid id definitely can't hurt. I'll make a new series and open a PR
to the drivers github repo with this change sometime this week.


On Sun, Aug 9, 2026 at 4:23=E2=80=AFPM Arimil <renari@arimil.com> wrote:
>
> Sounds good, I'm very inexperienced with the kernel workflow (I didn't ev=
en know you could e-mail patches directly from git). All of the ids passed =
into this should have that data, but a sanity check for an invalid id defin=
itely can't hurt. I'll make a new series and open a PR to the drivers githu=
b repo with this change sometime this week.
>
> On Sun, Aug 9, 2026 at 12:37=E2=80=AFPM Guenter Roeck <linux@roeck-us.net=
> wrote:
>>
>> On 8/6/26 17:14, sashiko-bot@kernel.org wrote:
>> > Thank you for your contribution! Sashiko AI review found 5 potential i=
ssue(s) to consider:
>> >
>> > New issues:
>> > - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL pointer =
dereference because `id->driver_data` is unchecked.
>> >
>>
>> Looking at other drivers, this seems to be real. See wacom_probe().
>> Please add that check.
>>
>> > Pre-existing issues:
>> > - [High] Missing bounds check on HID report size before accessing payl=
oad offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds read and=
 information leak.
>> > - [High] The `status_report_request_lock` fails to protect `reinit_com=
pletion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_event`=
.
>> > - [High] The device is exposed to HID raw events before its completion=
s and locks are initialized, risking a NULL pointer dereference and kernel =
crash.
>> > - [High] The driver allocates a DMA buffer using `devm_kzalloc()`, whi=
ch breaks cacheline alignment and causes memory corruption on non-coherent =
DMA architectures.
>> > --
>> >
>>
>> No need to fix as part of this series, though of course patches would be=
 appreciated.
>>
>> Thanks,
>> Guenter
>>
