Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4923F107F
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362276; cv=pass; b=AS/m3CkSZWDfeul2U8VUKemLZC6VCa0p7qpfvfkBlxT2lwZ/7sZVHGeUpeO8LigoP+ymRCt8ISz76rIjFxQKAxsNvSz54+PKBr9Q3zjsxgb4lLPq8usPjhUSVfJgjuuP6l/mvZMbmSekFUXErQDXBPHwdHrDvvyhsttda0zulh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362276; c=relaxed/simple;
	bh=0ZW1klAV+bg/UtUuvdW4thDQoRHPPeEDu1FKYQD3LhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dH2vnyTxvRY8lgggyKTw+eDWXIKOVJVO+apvvze6aqaIQWmjxPWGcvSqKrubXVkbV41wX1JX1Rq3I5kHmLMaUKqawZD0rMuybndYrFrojPYkQvGYWyeOBvXKbQ2zM9W1Hyh5IKGIESYKVT9gC/7GXqvdG8KCwjuA7kK1liJI8sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdjvTCfT; arc=pass smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdjvTCfT"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so2015853a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 11:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790362272; cv=none;
        d=google.com; s=arc-20260327;
        b=VDh1NhT/7J1KoE5MAa/+Y3KeAjA8VwC/RbRsSYgW5Z1o2zQ2AoxsizD0JdR2g5eB0Y
         2rhZLl6PyOmz0hdJvZm8TycjKiG6795kN/D0kgBNYWcrA9WBc1+EUGp8Kjmd/A8KLXgR
         dd5JqqmALnrukKHpJGLSL6aC6oyv4NYufFeW7A2bB59vGSDqUjZ77mnhJ03EUJDlr/xS
         PCPwMyIgLO18T2gptVGsOKXN7aZR8fefDYOjZ0SQyasglxZvvfi5aaTA3IKPxXGOaqG5
         jl9oqQV1ci6VDuHelSOqVxQNqBquO/Lwgm33QwQVrMwfjrm5ID/Thy0tPWI2/iKw8gAu
         H5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fDgAQ8vv+eWpPhr95k88YrPm3PM1EltEIBx166mNc4=;
        fh=/QP+n2O4Hyc4wPS4zFFRlhIZQ4uvqm/l12+HjjpmfsY=;
        b=cMsU54UIVUfsShCJjiIVgI6n5Jo7an+OoXlgvt1oywWlZbCDmyKFYXg/0cQc5bBaxK
         xFizRo+0WChadX3UtsUPn2qRjMV+x6SDhCg5l/1nZyy4WU8IYepglXsIqB7GuuqfMwJ0
         LLoPBnP7D4w0wpyq1QA20LhfOCAjvJSuGQqI1JYvvYEOtrKGoFx7leHp1qHR9c7ZhDQi
         q6JBdsbRPKu65swbr+rmHtFgBAWBSWRyJnTZeOnmTZ+U6Qrx79D5Hg1HXZRmAodtjiIz
         MTTNhme9JLgzKFqKOzWe+l5t0wOzCaXfEsbOGhXXJWB4t3nqEwAAFmGj9fvdA1Kcb+z0
         +J6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790362272; x=1790967072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fDgAQ8vv+eWpPhr95k88YrPm3PM1EltEIBx166mNc4=;
        b=gdjvTCfTz3V4YC9JceMzt+vaedEhS01/5+g8aMvv1ymdr4RMCBuRoALCjyxSEP88zN
         zzzuHRWM5ZEwPM7wIVHDWMo3JN8x0sGRjv0qHrll5bLt7zHzEh2qGAa6ZG18pukaF1qL
         SZpmuhe7ZPt/EpbHuwEoN/wS3WLzaufg9rkcAtcTGhXCHGnzA/iTij2ltiMJXRTD9rA6
         BawEa95x8yHjEEpLC7SV4MIB1YgcSi0Q1b0K8WEq3iWwNscfjC9sRcFPPEf4sNRPe6Rf
         3at0WPaXapHASW3lFrqPijpW4OhsrXTz7ihdWn6wsgXAWmjf5X64o9Tl6yne3SbpJzDd
         IXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362272; x=1790967072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fDgAQ8vv+eWpPhr95k88YrPm3PM1EltEIBx166mNc4=;
        b=lcmqRTGYDH8/Up38l77OKNqxS6KkJnQ3xfGa3+HSVvMgXafwKBu43Sj9n+IfvATlE4
         7sgy1EuzA0lJg7G1W/SaWbxjjewJSBW7EXHFVtA8hbt23sJlSwaoYGS6JFiGVkVpDr4o
         7IpsHYSrsZVObbGIFFC1RqS2VwmFXj/a3Dy+EnPjpESVhSWIIXZhc0+SrN9Yswwri7wm
         VgzVAyM7/BuRWw588+Dxh+4VsKQYaAkeXZdqkHUTrcUdnTLp8SYS1Jh7ZAE8YZ6SonBP
         LVqyuQQhMsW8Y8RRbT2XNj2y5TtRwKsd245+fQhaT7d1gP9bV2KjiWs9LOzBirvDgiRT
         uqvA==
X-Gm-Message-State: AFuF++kY3EvAstXX4KG0Ps1h/REhYkH6UCEQ3H+/gyvSFnC/xd8x/DG6
	wkNpi78X21jz3fxAfmxLCwfDW15vpx44Y7NYeqXH8ETX8eDv2f/H7mIWqnzcsLM9nKkG7tUZ74R
	Idb4oliYGj/SaChHds8/GXZ0+Gy53tfZZ/Q==
X-Gm-Gg: AYBFou2ChZpElQoZhY489+s+TfDX95AA/hE8ksx4kEtQsfrLIVkjB7ZIrrasvBsW5/Q
	OXycBGzRw4UfZ0k0Lan9HTjZ6l80fOoZPfjoaSALOY8ODEtv6zLdU2OWppAu4bocTEKWx4OkKhc
	wjYd/OaPaF5C1cWrtR6UYTVoVxinSALBrH9c6EFBvJ+tNUnIV7QLW42kv9bfBXomwEBCS+cGh3X
	uME09ZQsAQcylT8ZbCRHgEdPP30PnW10vjpgZ825fqQJZeLOQ44BacqnYpWWrGUWKhay0kPkkIr
	E84cIFGprB9uWgYDCY193h6sQ1TryF3Ayrt1DZrAytzqHb3KWS6xpJsVExH8rxdK06vteQCfp3/
	kGTsmTjMpHQN7ZwCLGwKt+RrJ0WHQchOnynWLySXzPe6DFu0k9mKr8IXgrTDvRwBH4IUhJNXkKM
	hrZTWIMmds95oNqhyR+3BYQzrgotNeannmx/UjweQpQEGJ0iDBQH/EplY45EeXuGNhsw==
X-Received: by 2002:a05:6402:5019:b0:6aa:734a:a081 with SMTP id
 4fb4d7f45d1cf-6aac8f72887mr6109550a12.24.1790362272215; Fri, 25 Sep 2026
 11:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925182504.54976-1-rosenp@gmail.com> <20260925183307.8F8961F00893@smtp.kernel.org>
In-Reply-To: <20260925183307.8F8961F00893@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 25 Sep 2026 11:50:59 -0700
X-Gm-Features: AclHuK9--1gx1aOuNuMKs7axbVuTUfXkQu_UxAVZzFV_LrvK3kE5iMk876yZj-4
Message-ID: <CAKxU2N9e1D8aq0_oo3D05T2NEgscE7um6zYmAoQ1X9rXOMLPFg@mail.gmail.com>
Subject: Re: [PATCH] serial: ucc_uart: Use platform IRQ helper
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] probe deferral: leak of async firmware load due to platform_get_=
irq() ordering
> --
>
> commit 887c64b890c9273da1e7e1715e89bca754adbfb0
> Author: Rosen Penev <rosenp@gmail.com>
>
> serial: ucc_uart: Use platform IRQ helper
>
> This commit updates the driver to use platform_get_irq() instead of
> irq_of_parse_and_map() to obtain the IRQ. The IRQ lookup is moved earlier
> in the probe function to simplify error handling and explicitly handle
> probe deferral.
>
> > diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uar=
t.c
> > index 6b7dcbbacd13d..c3c83a59dcce7 100644
> > --- a/drivers/tty/serial/ucc_uart.c
> > +++ b/drivers/tty/serial/ucc_uart.c
> > @@ -1238,6 +1238,7 @@ static int ucc_uart_probe(struct platform_device =
*ofdev)
> >       struct uart_qe_port *qe_port =3D NULL;
> >       struct resource res;
> >       u32 val;
> > +     int irq;
> >       int ret;
> >
> >       /*
> > @@ -1247,6 +1248,10 @@ static int ucc_uart_probe(struct platform_device=
 *ofdev)
> >       if (ret)
> >               return ret;
> >
> > +     irq =3D platform_get_irq(ofdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
>
> [Severity: High]
> If platform_get_irq() returns -EPROBE_DEFER here, does this leak the
> asynchronous firmware load initiated by the preceding call to
> soft_uart_init()?
That's pre-existing.
>
> Looking at soft_uart_init(), an async load is triggered like this:
>
>     ret =3D request_firmware_nowait(THIS_MODULE,
>                                   FW_ACTION_UEVENT, filename, &ofdev->dev=
,
>                                   GFP_KERNEL, &ofdev->dev, uart_firmware_=
cont);
>
> Since the async firmware load is not cancelled on probe deferral, the pro=
be
> will eventually be retried and will call soft_uart_init() a second time.
>
> Could this lead to duplicated asynchronous firmware loads and concurrent
> execution of qe_upload_firmware() upon probe retry, potentially causing
> data races or hardware state corruption?
>
> Would it make sense to move platform_get_irq() even earlier in the
> probe function, before soft_uart_init(), to prevent this probe deferral
> side effect?
Yes
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182504.54=
976-1-rosenp@gmail.com?part=3D1
