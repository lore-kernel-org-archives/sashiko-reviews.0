Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F33BBFD1
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622141; cv=pass; b=luYYbfyGBHPD1QFv1NHRSS6nTo8S111eUvHQwjAd4xfQlcYPScCxcBpJcNA7bUfKDMXsf8PWdF13dW2GzMFbADWDXBVX5f0vthTy2PTx5APj+VArCO2w+GNGQaBBgey6M+1K0ePgRH9/mzK0jbHT8TnusZr47IzBYbtBmo4lUIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622141; c=relaxed/simple;
	bh=PbIJX6UD1ZoB02wL/E9q33eYJBL+Acq3spZ3mV7eLNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpueqiASAKcikHboCzEkmHCRLL9WhcMQC251EAsz/YMR0fRKKzD8z49h5lb8LTCr8vvZO4cdNfZYK3EndSTrvPuHOUOJmtP3ofW3IuLDTgNorl5z06/X18O/X4e5i3rAzZrhZqMz19NfdHl47QA+9nvwnTA17lebx9KL/aN5ZTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cgf+c2qJ; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cgf+c2qJ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e8fa1b8d6so112132947b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 01:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784622139; cv=none;
        d=google.com; s=arc-20260327;
        b=q/VLKAUpXPNwJJqIVkSjBbYkYbnSRPHLynQWb5rBHbXnIhufbEjfqHkEx9TyE/7/H+
         pM21Bd1WHsnuVW/XYylXDNZalFmiKgAw6/B9EXgX89j+QG6V6DEdD3wNoKoG8sLOf4FZ
         BxlVvZogZH430m4y60O+LzDjD1z0c7q8WnB48a9y3pWiNSqg+Fz7XYws0i1gAk9cv+Kq
         iEVmOcrp9VFfbAkyqMFQh0PobJw0eSpIX2bGKqwlMcYtXXEH82Xq8UZqVnO/b8pPAUt6
         +ayTNkoBy5MRtIU0SsvMjhwK4QnSTkKKZY6i3PnsDzzem25trReB+rk0aQxigA2i1MYK
         wl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        fh=77Tj2Vuv3McHeVgYtoyiagZqeoR/9wT8tBbsPFicdqU=;
        b=QwvFVBnlHjJcSchyxAXYPRBt15qZkdbIRep8XUCB4dSuGRKOir+Vje3uV5V3tEBPGw
         llWM1BbZg3w7jQv789PwJyTm0QSouwB6nwEdKrY9boJXz+umfGaCscCpnMotDvKa6Hpc
         qOY475RpiOt2Ek0mWQ9fyFwSN2VDL1gYsdu+3524kvwJeFwgvMF++ynKE4hM/QMQqjRH
         BNsCeB3760a/3WH+zWybrP+/bYOF2TRYIWgCNBGAGALpvkgfbzc2cYo2m616L6yElmY7
         51FqjYIUwlo/hfCYlI8poXg7YBLIzrX6cnJre62+HDqKRVP/dTa24KTZ1IKgYQOGAZOG
         ETnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784622139; x=1785226939; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=cgf+c2qJ/v6Bm9SY+2eTX0afFj1Xx45fNRu8OgGBCVZbSr9NYpKis3MKXNOsEmHUqk
         oI81URfyfJ1byj3qr26Lc7P6jbB+9tZC4PyrQgytNPPlgl1O60Cu9n5yFXNm3sJDCTpt
         K/Ra/cyOVj1iWaMcyUb2UoxUri0dSxQiZBwmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622139; x=1785226939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=qZqbelqUrENDYkqhABLxAl3oVxw8XIJnJCMbVYJgr+rCbDr5JWOoea5F7Wt4QFDV+R
         x3VM8+42RCoMDNvfyxUaOD+syu3DarLyeNT18qrVsoGDbzUzbT6sn9KCZifdK0Oy165s
         zzjA4UpCAn47Oe6RMSt/LOsY+CgHo5aTdA3g6d45g4uF9u6C7DZm+fhwJX0GtC5PNnH4
         v5YkOQejOdRayKTqsI44/jW3AQHqIUgWCv4zRTeq5JXEwrWUJne4L51BTSiYlGBfGHO8
         PEKAdg+Px9MyptzRrnEAkL2xqwFIum5JCPuJ9ztE2V3wxJcxp48a2SP+jeNOfI60W0cr
         yO6A==
X-Gm-Message-State: AOJu0YyHwky8bcts7iMyIfgrp4PfMscQqPLrcdnqKAlw2tP7zIQEWhyM
	qH+VZ2yxxEvpHT8i2/k9ZocfhBQPF4aTZbvSIjtNPTX77qmORKAIL8IAh6b4rsH+Mv4c0r8+Q/T
	hLV9+tJvg3B73tvRGKAa9xLDSmGAKUhsKaOtWMLn5chgfw4XTso/rkQ==
X-Gm-Gg: AR+sD12krz2L/3QE3C0gjWrkbz/aMyOHs/2vVxgyXNH9/ZBSBSwgh3n7ET78lNnZxy9
	pwc9URm///u7WXo8Bzw7uJGD9Leu1Gt8WxoOsE07Y9pbIj/BfyBBvic7VT771f9Nv16TUCTjKqt
	+11RFD1KWaMGINYDVmOnt1xMyiATpH3c6C6kqrO7qIXglL2QJcmSMFh4UgXAi17rI+7CQea3JDq
	PcMmm0S21dL+L52vngzqj5vGaeCb6RX5UCF9zCdmTqiSJ1K8p9mUi7v8iEjMIFoIWdJwJzWVzA4
	qcOPjvDjt2etBDOXVO4EXd0oug==
X-Received: by 2002:a05:690c:7342:b0:81d:cc00:cb8e with SMTP id
 00721157ae682-81ef27f1cbfmr54139227b3.37.1784622138845; Tue, 21 Jul 2026
 01:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <20260721080829.4153C1F000E9@smtp.kernel.org>
In-Reply-To: <20260721080829.4153C1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 16:22:08 +0800
X-Gm-Features: AUfX_mxfs-owsFVntpy2TfnfT2PivUx0k_MVeEmOEDZDOObrM7yQy9fA6FUILhA
Message-ID: <CAGXv+5ECnGRwdqRLQG6EQ_bqaezYCrMkczn=MP=wXfLhG3Sh=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: conor+dt@kernel.org, dmitry.torokhov@gmail.com, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The prototype for `regulator_enable_and_wait` in `consumer.h` in=
correctly names the delay parameter `ms` instead of `wait_us`, inviting dev=
elopers to pass millisecond values that will be incorrectly interpreted as =
microseconds.
> - [High] Sleeping for the consumer delay while holding the recursive `ww_=
mutex` for the regulator and its entire parent supply chain severely degrad=
es concurrency, blocking shared regulators and serializing async bulk enabl=
ement.
> --
>
> --- Patch [1]: [PATCH v3 1/9] regulator: core: Add "enable and wait" func=
tions ---
> commit 73793dc0bdc3050ff22074a860d438d5d9cc0b49
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> regulator: core: Add "enable and wait" functions
>
> This commit introduces new "enable and wait" functions to the regulator c=
ore,
> allowing consumers to ensure a minimum amount of time has passed since a
> regulator was actually turned on. It adds a last_on timestamp to the
> regulator device and updates single and bulk enable APIs to accept a wait=
 time.
>
> > diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> > index 1797929dfe566..d14ce86d8f7bb 100644
> > --- a/drivers/regulator/core.c
> > +++ b/drivers/regulator/core.c
>
> [ ... ]
>
> > @@ -3159,13 +3162,24 @@ static int _regulator_enable(struct regulator *=
regulator)
> >               } else if (ret < 0) {
> >                       rdev_err(rdev, "is_enabled() failed: %pe\n", ERR_=
PTR(ret));
> >                       goto err_consumer_disable;
> > +             } else {
> > +                     /* regulator already enabled somehow, but timesta=
mp might be invalid */
> > +                     if (!rdev->last_on)
> > +                             rdev->last_on =3D ktime_get_boottime();
> >               }
> > -             /* Fallthrough on positive return values - already enable=
d */
> >       }
> >
> >       if (regulator->enable_count =3D=3D 1)
> >               rdev->use_count++;
> >
> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
> > +     }
> > +
>
> [Severity: High]
> Does sleeping here while holding the recursive ww_mutex for the regulator=
 and
> its parent supply chain cause concurrency issues?
>
> Since regulator_enable_and_wait() acquires these locks via
> regulator_lock_dependent() before calling _regulator_enable_and_wait(), t=
his
> sleep happens while the locks are held.
>
> In cases like regulator_bulk_enable_and_wait() where async workers are cr=
eated
> to enable regulators in parallel, won't this serialize the wait times for=
 any
> consumers sharing a parent supply, defeating the purpose of the async des=
ign?

I suppose the fsleep() needs to be moved outside the lock region.

So instead of changing _regulator_enable(), make it return the last_on
timestamp, and then act on it in regulator_enable_and_wait() after the
lock is released.

> >       return 0;
> >
> >  err_consumer_disable:
>
> [ ... ]
>
> > diff --git a/include/linux/regulator/consumer.h b/include/linux/regulat=
or/consumer.h
> > index 56fe2693d9b22..a69157c9b5b51 100644
> > --- a/include/linux/regulator/consumer.h
> > +++ b/include/linux/regulator/consumer.h
>
> [ ... ]
>
> > @@ -192,7 +193,7 @@ int devm_regulator_bulk_register_supply_alias(struc=
t device *dev,
> >                                             int num_id);
> >
> >  /* regulator output control and status */
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> [Severity: High]
> Could the naming of this parameter cause consumers to inadvertently pass
> millisecond values that get interpreted as microseconds?

Yes I missed this part when I changed the API to use microseconds
instead of milliseconds. Will fix in the next version.


ChenYu

> The prototype here defines the parameter as ms, but the implementation an=
d
> the parameter passed to ktime_add_us() inside _regulator_enable_and_wait(=
)
> treat it strictly as microseconds.
>
> If a driver developer passes 10 expecting a 10-millisecond delay based on=
 this
> header, the core will interpret it as 10 microseconds. Could this lead to
> hardware initialization failures due to premature access to unstable powe=
r
> supplies?
>
> >  int regulator_disable(struct regulator *regulator);
> >  int regulator_force_disable(struct regulator *regulator);
> >  int regulator_is_enabled(struct regulator *regulator);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721075226.23=
47933-1-wenst@chromium.org?part=3D1
