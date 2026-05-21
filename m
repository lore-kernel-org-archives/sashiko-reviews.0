Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F913E171C
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779385401; cv=pass; b=Ckkny8Ayy4zVCSQ+2e1r0LbSjPBA2V00JZYrKPuxg0BozSPZ1SoPEUjyEoxu9epdto8mjCB41RLpXDAardZvnd0tQqRai8pYJ4ggfEB0TFFSXjfcU+xXziWDASw7Rf9a/IkebR4hYLTFYP6IdZR48I2yW9sHWWKka9XJB4lzUow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779385401; c=relaxed/simple;
	bh=9JasEh+59Sn6HERSNyTX4ibLaL8+DZ71S/xAwz6qm40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSJYh1PruSka2RTN6Svd44sylvfZ0cCi3lb9UAqyt3FVGIa1cffcAinlLwCBij0v8r1M4xBu8rRXTcL0ukgTkv1t/1yBw6+6Sq9Ra9atSKaRP3kV8QE4oFUOus7SGHabOhWFmcHHzj1slLnv5GzBPqahXNleeFC4IdqxVvWMRGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9Jp9yPK; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9Jp9yPK"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso939093a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 10:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779385396; cv=none;
        d=google.com; s=arc-20240605;
        b=lKShCh/W8X3S0HmzpIeHALaaktGdejps/vhvtKO8wPuyBTfNeLbUwMWq5/whmtPnvs
         ZIMRtb6dIZGWVzZAo/1z3w52oBxh7yexSZvI/mRQhOUdLFve70B81/PNWlg+g2Y7hLih
         6GypTEOmUpwTo+jwD0Ka23nRwSCA8qFgi3XJGcsuQYbPOUJeNczHWNG23cCdqelp6Bd7
         0Kyd25/x0SyrXBa2AwwR4BQA8yGi9IA9gjl3Q01kG/pBRYtvU7Eh+BzPfL5FxeFn9sVl
         vLR0MGXWJ28MdpF8loz8SnEuM4Zp842u7G7idZIQhds26Dc0tGZxvRVODoiBs4B1YUns
         r9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        fh=WJ81iVv7VVNN3XcmqLwfLU/KtKhWcyunKbGcwKiNOFI=;
        b=eoipfKuFekzyCVT277XrFM2R0OgOI57JP66Iw0h+/EIq5StBbNQ2brNiJLX8TiMvhM
         spg9515WRr05SvyY+Zk4Ln2ZsRWOEEya/aO7fN/HgtHwfouIwc1ATMEnNHOLvecxqVtz
         yzpdTmS5VTD0XKNt422KRmB4NHdVnANDqOT9QWdXvNmLTRyzTUYRgli8OqjHIym9nVjx
         Mka6trw4CDT1LIMxeOhG9Slcl1lOq9qbUrtzBx7HyrXAoDS5Yk2wXSqGNbr0bX0fWjBa
         Zvsglff5bfj2aPO7lFjyWwsSnB0sDdK4syP8U7MfGlV7zsxHXm6d6pc9SZcm1az9EB5R
         a45Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779385396; x=1779990196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        b=h9Jp9yPKUwNWg4XRCWnuv799QyNSoQ3ZDqooIiXc8ciZMWtUmRhHgUDayjR6uYBUXa
         cpQSDvV+l5Yy9fKKQxB/eSI2V9D4yWJ4TFMaVeyhmZrkAdWD9/kwnxJsoQHPjUSKYyPQ
         tz7RFnUhb9mosF5vO/tLBGG6hyEEyYzva5fEUcOT6qtMq8ImylEwpcFC4sahmNG/a5v5
         8D+75gRFWPgVD8hc3ePot3rW8O+mTtM1sEbA5Y588wbs/S0R4rdEWM8Z/6g67sK3ab0s
         zeszuGYtrKnt1So48c3T3udAcJPFNgct+YO7PpawM1XRG1i6BjD1ieP59PpEnSFkdZwG
         taJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385396; x=1779990196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3rDSUe7KLZOmgAp60b5SR5E4yTJDtktblrOBb74mtU=;
        b=Geso7hobJEfLWqgAOgfvupFg8sxLR2oDQeXGvFM6dXYrC4hiy8h6efcq2/O+A7zJ1+
         6TURIyHATKIYV62HCTp9SzvgdP2rgBqrkaAkhTotyR96IzsxBDdOaasGkN/DylMjbxH0
         GcoVlDCa4wMtk8KKbNci0lr2hRhorQteef5ru5L2slghVpBc3kGTzP3RCo/pVHp/C7r3
         v9lbApmOLKc0uXNqx0WCdltm26EnxFnJdpbnKVreOtc9twij+RWRVL0KGaB5qquZYE+a
         H6SAVcXnYa7ScQhseaGDWmKUr6Fepoum1TS3mNqx2gOgT9FLByscsKZWHsOjf1470aoY
         ikUA==
X-Gm-Message-State: AOJu0YwcIIDhMZMqXfmidQl89TPty6HdpVsseZrk6Na74GGjwHm1da+C
	a32HOufXDDFogQRya0By9pFl8dLNUgIpW8k7KKCpppZ7dPHHMg4C1tqWb8yi7VKpK5za2JJiFU/
	AbPxGqK6f0a/1OxBUWi5lbuNw3UYF68QvS1sx
X-Gm-Gg: Acq92OGSo0hMdUhTHJ1PaICsVX9/I/ZFZuTyp6O4VwChp62beawbRfdCzr9xrc7S46t
	YsWDGFClmTlBdp4LNxs9KXRDjHGUSq4vxX2LcRB+VRLbECkC5r2E85+keT7F2CpTJ6aSkVdAsXz
	AZkWagU6ndZww5GDajHvMfx166ULdoUW/rF5FI0uLVeo6HjjtVGOWHYbgie/nxM29lO7TBRTYm1
	5R+4PfhkFokENsrGJQVtTG+A8HHqaGencY91yzo23AQZNUB16f6b1WPMGQluihqsaGNEgZKm8H/
	m3PrLw==
X-Received: by 2002:a05:6402:2792:b0:677:1ce0:c08d with SMTP id
 4fb4d7f45d1cf-68836bca5afmr2159034a12.18.1779385396210; Thu, 21 May 2026
 10:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521073449.10057-2-linux.amoon@gmail.com> <20260521080928.26A3E1F000E9@smtp.kernel.org>
In-Reply-To: <20260521080928.26A3E1F000E9@smtp.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 21 May 2026 23:12:59 +0530
X-Gm-Features: AVHnY4LceKynZbX-6PIn7iaMcEhtfr9doxs8GOVQDJzeHmTmfj9sZJSWkEDiNEs
Message-ID: <CANAwSgQxxpDfwKQo0DNjYbTQhY-hHGL-BAndU3dTOTUxsg2PGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path
 of vdec_open
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

Thanks for your  review comment,
On Thu, 21 May 2026 at 13:39, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Incorrect teardown order in `vdec_close()` causes use-after-dest=
roy of the V4L2 control handler's mutex.
> --
>
> commit 82e916771a779b02500f97d58e344bb93ca8e9ca
> Author: Anand Moon <linux.amoon@gmail.com>
>
> media: meson: vdec: Fix memory leak in error path of vdec_open
>
> This commit introduces a proper err_m2m_ctx_release label in the error pa=
th
> of vdec_open() to ensure the m2m context is released before releasing the=
 m2m
> device. It also attempts to free the V4L2 control handler memory in
> vdec_close() to fix a resource leak.
>
> Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kern=
el.org/#t
>
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
>
> [ ... ]
>
> > @@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
> >
> >       v4l2_m2m_ctx_release(sess->m2m_ctx);
> >       v4l2_m2m_release(sess->m2m_dev);
> > +     v4l2_ctrl_handler_free(&sess->ctrl_handler);
>
> [Severity: High]
> Could this specific ordering cause a use-after-destroy of the V4L2 contro=
l
> handler's mutex?
>
> If an application has subscribed to a V4L2 control event, v4l2_fh_exit()
> unconditionally calls v4l2_event_unsubscribe_all(). This unsubscribe logi=
c
> eventually invokes v4l2_ctrl_del_event(), which attempts to lock the
> control handler's mutex.
>
> Since v4l2_ctrl_handler_free() destroys the mutex:
>
> v4l2_ctrl_handler_free()
>     mutex_destroy(&hdl->_lock);
>
> Calling it before v4l2_fh_exit() could lead to operating on a destroyed m=
utex
> and potentially cause a kernel panic if mutex debugging is enabled.
>
> Should v4l2_ctrl_handler_free() be called after v4l2_fh_del() and
> v4l2_fh_exit() instead?
>
> >       v4l2_fh_del(&sess->fh, file);
> >       v4l2_fh_exit(&sess->fh);
> >
I will try to study and update in the next version.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521073449.10=
057-1-linux.amoon@gmail.com?part=3D1

Thanks
-Anand
