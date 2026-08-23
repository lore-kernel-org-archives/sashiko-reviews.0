Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B627EC7C
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508991; cv=none; b=qJpeGrj1tNePf0Mj9uRnkZbnJfiWRbb8WcJeuOo3l67raDGryJ9asF/QTv6EcJ9htnaUXdrerBjVapI7Wp+Oeehuh05nMYBVkv5i5x5aY0QrfbrqGq1RjYCHEtvqounUZhywuGulWPRnnL6EWuahq1Ez84uvBm8b+9TvUsQJJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508991; c=relaxed/simple;
	bh=LpxMiqBeM9DqdWGKvg6p3ohK3X1JMmpAnTcT9fKnb1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Qp1b7eIUPP51CM5fxwOVh3exmsKHBZy6DqIaWLOshnOVTE2oOnxH1PYgVJ+3x2mkBDCMm/R7/9BKmOpFntYdQG0Mzi2RqA5KfYEDrIuQZoCcw62k7B1EnMVmb/m5AbC/oKXQWpN7sasoMkqc7BbvdxNTPv3IuDw1mmDMjK/jyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGFV9ba1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGFV9ba1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c214321dc32so533677066b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787508988; x=1788113788; darn=lists.linux.dev;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isdF4JSpsa/RqqbLXwBpHx2medr6i9gKnOCHIoCrxLE=;
        b=PGFV9ba1coRHv8seGv0/iuxtTGBuIWhYJdNcDgtiTM3Ca9qIMj9gkaAq8wAehR68dM
         SirbUWuKuy5TDZURTahnhE11PRcqqMqsl+/w0Okfh0GlXj9Sw7nMT1NuFFXMZbmtrI8I
         p6QvV1HTMghGtIvOYcBc1uUTsUKFSZwuWYiW8o0YHdCrV4agI4e2+MyJ7B1jO8QmcU4q
         bNjQyqoq8QF1ItTbdI4Z0g1SZKn7mYE+a4lmhh60eTlMDb3cI60hQnUGzlUlNIjYf+fN
         /srMSDDd+wOJAA3oLNgrlC0L0RjmgPfqrTMu1e3lp4w3Kf+XJcFNrMLApCMEaGOjOgRf
         XKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787508988; x=1788113788;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isdF4JSpsa/RqqbLXwBpHx2medr6i9gKnOCHIoCrxLE=;
        b=bXjVIiFyJdkaChsyOltb0G7Sq6Lph2jZ7pPI1i+/9gQjsPqNeSNgqKiIYpK0IwSRKk
         dHUDrcdv9W6OKh+Usi1kS6F5r3gnwtUyw455yxPmzz/prjc1igCge7DQpyFTxjTXne9c
         Kh8PKGtjWnQGR+LzOW/tx6Tr+RqayYHOppmVM6M0kW6OvJK1lP/n/zcHiY6XV3Xo+qj0
         LmcvH3+Upg2nzmW0nkmW/KvB1Kwdo6KWiFC3cUomjAhrppgFO62vbyWNcYQv9M13saSE
         ng3SNVkAUdgrbnEZO0m0KsDT7IRdCooIS+Bvgq9glWZMx8gCS2XILpY7+d/5rAgM6b0h
         yt1w==
X-Gm-Message-State: AFuF++lind4tHsfSjN1Xhuxxx7Ea76syxDWN8B0F1hexICCLldsGOvoI
	Hb5rJvZgWiceZnYVppT7R4ISJBWkXh8ErPJ1xYBS+e9/o1jYJrVWo8JdiLMgDA==
X-Gm-Gg: AR+sD12sL52Je70KZfp2hzzNZoJs5z8GEOMbIxUNLU4igrGb2wSu4UjIhWHh0Ozy7nV
	ds+eqmRHatMifWJeCNwApjlDthZ2aKpB5/s+cRbGTYVLryJQnO1dweG2MtJXcC/qR0TL7UJfpYK
	hESE0xynwxJjpvSN2P6foq3KritKgw2hGmY1a9VU9lRUUzkwhgd/eVWUbw71FZZSOJPc9WfvISI
	qAPf43LxUEwosFdG182CDdRojGQmc57d6os1+sH9JqCJM3+g+JI6IGTsERBenrBfbdvpXkVvnQU
	NP2kLiikCVVkX+leeyWtrnP2Nel1ob/b2VjqZSlDDrObgxwHRGHxtrHXp6zXbtFg8DxQY74NhYl
	8BLdkRmdepOHyPdbw3K1F+/49Y/P8W9vEHUO016Ld0f6g/0h2lfsjwCQ/ZHL51zz/lxNjZmmWdD
	LESPyJsjDvaBgktMY5uDDRvghi4KSFe5h2XENDBgKSDUEbC/weOGSM6KYG1ZhJLrXRhA3Kz5MTs
	g==
X-Received: by 2002:a17:906:100a:20b0:c16:8799:fcb4 with SMTP id a640c23a62f3a-c246a6a93fbmr1663128166b.19.1787508987743;
        Sun, 23 Aug 2026 11:16:27 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm877491966b.43.2026.08.23.11.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 11:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 20:16:25 +0200
Message-Id: <DKWJ1VMYAVW6.21J53768947YI@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 4/4] hwmon: chipcap2: serialize access to
 low/high_alarm indicators
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-4-6a26c8e9e2fc@gmail.com>
 <20260823180616.1D53D1F000E9@smtp.kernel.org>
In-Reply-To: <20260823180616.1D53D1F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:06 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `scoped_guard` macro is improperly terminated with a trailin=
g semicolon, resulting in an empty critical section that leaves the alarm s=
tate updates unprotected.
> --
>
> --- Patch [4]: [PATCH v2 4/4] hwmon: chipcap2: serialize access to low/hi=
gh_alarm indicators ---
> commit a0d28bd8208a1d69e597290c8ebb0fdf0731e68b
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: serialize access to low/high_alarm indicators
>
> This commit attempts to serialize concurrent access to the hardware monit=
oring
> alarm indicators. It introduces scoped_guard usage within the threaded
> interrupt handlers to protect the low and high alarm state updates.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> index 57d22d65612c2..0a56c55e93942 100644
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
> [ ... ]
>> @@ -495,9 +495,11 @@ static irqreturn_t cc2_low_interrupt(int irq, void =
*data)
>>  	struct cc2_data *cc2 =3D data;
>>
>>  	if (cc2->process_irqs) {
>> +		scoped_guard(hwmon_lock, cc2->hwmon);
>
> [Severity: High]
> Does this trailing semicolon create an empty critical section?
>
> Because scoped_guard expands to a for loop, placing a semicolon immediate=
ly
> after it makes the loop body empty. This means the lock is acquired and
> immediately released.
>
> The subsequent assignment to cc2->rh_alarm.low_alarm executes entirely ou=
tside
> the lock, leaving the data race unmitigated. Should the assignment be wra=
pped
> in a compound block without the trailing semicolon?
>

This feedback is correct. The trailing semicolon is for guard() and not
scoped_guard(). I will fix that for V3.

>> +			cc2->rh_alarm.low_alarm =3D true;
>> +
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>>  				   hwmon_humidity_min_alarm, 0);
>> -		cc2->rh_alarm.low_alarm =3D true;
>>  	}
>>
>>  	return IRQ_HANDLED;
>> @@ -508,9 +510,11 @@ static irqreturn_t cc2_high_interrupt(int irq, void=
 *data)
>>  	struct cc2_data *cc2 =3D data;
>>
>>  	if (cc2->process_irqs) {
>> +		scoped_guard(hwmon_lock, cc2->hwmon);
>
> [Severity: High]
> Does the same empty critical section issue apply here for the high_alarm
> update?
>

Same here.

>> +			cc2->rh_alarm.high_alarm =3D true;
>> +
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>>  				   hwmon_humidity_max_alarm, 0);
>> -		cc2->rh_alarm.high_alarm =3D true;
>>  	}
>>
>>  	return IRQ_HANDLED;

Best regards,
Javier
