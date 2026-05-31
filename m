Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C135C180
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780250245; cv=none; b=cnVFUopuPZ5NIJToNKGFzycucCo0zL1imYwPlC4fyUfCVKdTM2uQ4f9NKmK8Ft3+ttWoEzItMIHzfVeXu+C46i4rvhvJ4hoiVwLL00WGHkz1wabQHafOEpQIp/iiwfoppIw59HThWg+adUfmin0KjP/qgH8BjloGMcoq8Ul2kaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780250245; c=relaxed/simple;
	bh=GzcRgZZ54Xp6fY2ubxRYOsQShY91E99cNCV07d1Fo5w=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=Es1GXghCM6BSKY4s+4G02Nr73pyz6T1Ll3lSAIQTZ+8E3SeWty5H1qixfLb286WIA3PPG0IFjGyp4xnkd8H6J7xQZR2vv11R7QZ+Sd6W9+CuCl6GT5REa/8pkqmMhKj4/Z51BBa2g5goon1BcvK0N+3u5g4nf9iygMMwPMoyZYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdWZGrWL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdWZGrWL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4905e190c71so84414795e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780250243; x=1780855043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sZ4dMi2F8lMGxTUoiGUm4UUFWL3xQumUZSgizh7X264=;
        b=hdWZGrWL37MmQelQwYv+Ndw71/Jl1zkuWAA2xJwihUMI0f/3VALsR44acEBzgRaEL5
         v8uR7TVf0wygbjz2atiBuOrPDsALNXybLQjRmG9lW8K/cqeqJ5NgHPqo3mUQd/JNarjF
         9cZM36iGsTZYt62c2Ye9vH0Rse/PtWElgmGz/rn4ivGwHa4HEITBsNXtzkS6LPCCVaA8
         q2PG/CRPQgXu0A9QJLRm1pVqEikxhMWkkQKCmUtmk4WAmwnkdibhTgX1QFrPcEHKJnKR
         501eYjU4OzMLvKXu9/I06EEwVeaeSqJfTpcWFVxfBHfkEynERmaWsHlRQNkl0ptj8aLf
         oxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780250243; x=1780855043;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ4dMi2F8lMGxTUoiGUm4UUFWL3xQumUZSgizh7X264=;
        b=MmqsphYEeUKj/+wjIUu+egG6Z/HFmDeSlow0ecdsbjppgb8llmTvrNinbFQBrNEWhX
         8PMVbcShzU0egveF/ADffnEQcSYxK1qv55jm3WZ6mFVfubTmtIp/psvvmb9nrudfDCTL
         BzDO+MMtfmQHu+3b5hVy5A+YHcLDQcuOJt8gEULOcE9qVHcqC3jb3Do+cDoz3HoaHKcj
         qyei/eRh0cQ4jkIkOwVMUjwyclt7tXzrEen3WmllCgledxDDP+w0mIP2Ju4A+0KqZuvI
         hFeCi4NpszBbkuna12cV4jGVkpw+tBnM2skjY4eLGCrnY/5+TlK8dLIxWkdtPunbG5tb
         tarQ==
X-Gm-Message-State: AOJu0YxXsAYuCMU0FkdVkSeZHeGCjwEHJQfubBpZca11UyQNkGwwayLb
	d59u+UJCJbyrebKWkdFop2M8WbgBieIXkc3KUY5oVP18tgEdgr+w+K6OKuQQeA==
X-Gm-Gg: Acq92OHmEc7IGYgQ0Y6MRAfMHhKCkySjapKUrgVF8j51Md4uw392VfkXD7L4SzrRiyA
	HtE3UpLpUe/LSbfn+TI4RFFvhjg4OtjdCTQK7+KPpCZedcJG4FYYba+Z+OeEwSDx0T/jEsja274
	6/xjiLhyd/twXtFR4Ay0Mf3UX58OCZsuGtA1QOM6vpjGy/LoW5ZOtz6vJh3q3syLPpV22P/7lYh
	gU86qGlQJHprhx2tdCIVUYYd8X3QCjmBfh3fXSf2EME8JEBRxkP8XUczLATyy32+9jJboLbGnwl
	3wUIchOZspiwNXkZ5SgaxgdF92X4gEZvFTMjMRSJvvA4KqzPwI0JSZvHT/OjThBW6rOW3AS16dT
	x+97k8RhD38aqe+jnsBz99a6KWvcLTwJLLnVx11yQ6Ddne2l2wd6/5FVIGpU626lgIQka4m2f67
	/q/xbt067/xGw+r8jBukoiw82igw==
X-Received: by 2002:a05:600c:1d86:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-490a28aa789mr153499525e9.0.1780250242840;
        Sun, 31 May 2026 10:57:22 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm312412855e9.6.2026.05.31.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:57:22 -0700 (PDT)
Date: Sun, 31 May 2026 19:57:22 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com
Subject: Re: [PATCH v5 3/3] HID: nintendo: Add unified report format support
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <20260512200051.2534081-4-vi@endrift.com>
 <20260514010628.28F7CC19425@smtp.kernel.org>
In-Reply-To: <20260514010628.28F7CC19425@smtp.kernel.org>
Message-Id: <2WI1R6X45JVLO.2QWM1RBSXW7DU@homearch.localdomain>
User-Agent: mblaze/1.4-1-g5a69507 (2026-01-24)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Insufficient bounds checking for NS2_REPORT_UNIFIED payload lead=
s to out-of-bounds reads.
> - [High] Divide-by-zero kernel panic in switch2_report_trigger() caused b=
y attacker-controlled calibration data.
> --
>=20
> commit 6e45b564fde8014fc6ade8452a1b793097b3bee4
> Author: Vicki Pfau <vi@endrift.com>
> Subject: HID: nintendo: Add unified report format support
>=20
> This commit adds support for the "unified" report format to the nintendo =
hid
> driver. It introduces new mappings for overlapping button and axis fields=

> across different controller types.
>=20
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 9801799a90758..9e7eda7b70bfb 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> [ ... ]
> > @@ -3690,11 +3791,48 @@ static int switch2_event(struct hid_device *hde=
v, struct hid_report *report, uin
> > =20
> >  	switch (report->id) {
> >  	case NS2_REPORT_UNIFIED:
> > -		/*
> > -		 * TODO
> > -		 * This won't be sent unless the report type gets changed via comman=
d
> > -		 * 03-0A, but we should support it at some point regardless.
> > -		 */
> > +		switch (ns2->ctlr_type) {
> > +		case NS2_CTLR_TYPE_JCL:
> > +			switch2_report_stick(input, &ns2->stick_calib[0],
> > +				ABS_X, false, ABS_Y, true, &raw_data[11]);
> > +			switch2_report_buttons(input, &raw_data[5],
> > +				ns2_left_joycon_button_unified_mappings);
> > +			break;
> > +		case NS2_CTLR_TYPE_JCR:
> > +			switch2_report_stick(input, &ns2->stick_calib[0],
> > +				ABS_X, false, ABS_Y, true, &raw_data[14]);
>=20
> Is this safe if the report size is exactly 15 bytes?
>=20
> Earlier in switch2_event(), there is a global size check:
>=20
>     if (size < 15)
>         return -EINVAL;
>=20
> However, switch2_report_stick() reads up to 3 bytes from the provided dat=
a
> pointer (indices 0, 1, and 2). Passing &raw_data[14] means it will read
> raw_data[14], raw_data[15], and raw_data[16].
>=20
> Could this cause an out-of-bounds read if an undersized report is sent?

Yes, I assume we would have to check for a bigger size here.

>=20
> > +			switch2_report_buttons(input, &raw_data[5],
> > +				ns2_right_joycon_button_unified_mappings);
> > +			break;
> > +		case NS2_CTLR_TYPE_GC:
> > +			input_report_abs(input, ABS_HAT0X,
> > +				!!(raw_data[7] & NS2_BTN_U3_RIGHT) -
> > +				!!(raw_data[7] & NS2_BTN_U3_LEFT));
> > +			input_report_abs(input, ABS_HAT0Y,
> > +				!!(raw_data[7] & NS2_BTN_U3_DOWN) -
> > +				!!(raw_data[7] & NS2_BTN_U3_UP));
> > +			switch2_report_buttons(input, &raw_data[5], ns2_gccon_unified_mappi=
ngs);
> > +			switch2_report_stick(input, &ns2->stick_calib[0],
> > +				ABS_X, false, ABS_Y, true, &raw_data[11]);
> > +			switch2_report_stick(input, &ns2->stick_calib[1],
> > +				ABS_RX, false, ABS_RY, true, &raw_data[14]);
> > +			switch2_report_trigger(input, ns2->lt_zero, ABS_Z, raw_data[0x3d]);=

> > +			switch2_report_trigger(input, ns2->rt_zero, ABS_RZ, raw_data[0x3e])=
;
>=20
> Similarly, does this code read past the end of the buffer?
>=20
> Accessing raw_data[0x3d] (index 61) and raw_data[0x3e] (index 62) require=
s
> the report size to be at least 63 bytes, but the global check only guaran=
tees
> 15 bytes.

Same here.


>
> Additionally, could this new path trigger a divide-by-zero panic?
>=20
> While this issue pre-dates this commit, switch2_report_trigger() contains=
 the
> following calculation:
>=20
>     int value =3D (NS2_TRIGGER_RANGE + 1) * (data - zero) / (232 - zero);=

>=20
> The zero parameter here comes from the device's factory calibration data
> (ns2->lt_zero and ns2->rt_zero). If a device advertises 232 as its zero
> calibration point, this division evaluates to 0.
>=20
> Since this patch exposes a new way to call switch2_report_trigger(), migh=
t it
> be worth adding validation to prevent a zero divisor?

This one has been reported already in one of the earlier emails.

Cheers,
Silvan

>=20
> > +			break;
> > +		case NS2_CTLR_TYPE_PRO:
> [ ... ]


