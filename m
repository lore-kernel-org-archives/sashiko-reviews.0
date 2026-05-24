Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B224086A
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 02:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779589206; cv=pass; b=KdgLqGn8HqquyyAmk3dRhBs7mBAayMHPmnKcLyYM08cmOzDgiMsQcyCwyYRBvC4a6/au1v+QMftDLfXMqq/Huw0bUs3UwDB1t3rO9pXEjvoAFXRdWkkPiogCpYYJKv9nTOg3x0pYL9vxWLbjuaSmxG6yOIfxHKrZqnY8qY42vLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779589206; c=relaxed/simple;
	bh=r2LLTQ7fhBUTq1v8XPvfzGWyEwPDCTkP8vI2sshuvKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5dnN66HQ/KmGsPkWWhGQmWQNP9PFRvsw9ENH45NQJz4h+I1EVyEZ1TcnIO2I7wqjW64piIze+UeHixN0LsMexsj87MRcst/pXcBsUYIZsj5QEbBAUO66rD2PCoFAGHOrjORIYYNd7gvnkQDY6KHG5C7S47lRXwb5m6phhyobvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5ilDOUl; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5ilDOUl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so13319359a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 19:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779589200; cv=none;
        d=google.com; s=arc-20240605;
        b=fS1GkX8CC5BfKR2BhEuGqe5ETQhrumZt42oxd+OdOTQQ7NgRMQH+1L7Lh3xrV0+GEd
         5U9BJxPvA6j+gevHh3QTq0usm0Embx6+uYh1t8rRaMZXkBatMap5t8HoyV4FPtFj4p9P
         9MymcGVo/rk5mJpdXg1qUThrQQuWCLzTYolW/oJ+spx2JHmicjNYaImVwuqKaGbTuv8N
         okTkQ9SeTQptNvCpnJanGQa3MYCd/TIPmuFqt6JYCjtDZsnN4rOpcijZsWrxaqjJc3fi
         BVPOflFGUrmwF+FGoAWKAWw8zVt88IBNTmj/l98bCL2k16yWehoYYENaj/vHcM9AQp4e
         6oxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aHQ3iAVdgRbGDQ5MY/Sudz6ovqWFvWub/1D9p3tFQO4=;
        fh=zt2hjtFWVrBSbexOnXx/digRN2O0tNSOK4/ceCsrIlE=;
        b=H/+hzmbV4zkMnLnlORq8R7/17yRL0+jqShs66SRweo3is2Y/HG/TK5oNzZTgzNotcU
         7L/3sHJJz5S6lGFTeWbSrTkKnpMuLZlap+MY4FUNdRGkk3TM22aSfgUJuKoJGrQHA1Ov
         VcmUYabdKRqG5dl/80oECpEGDhCdWPsllog5xOII4L89Z4bhbqN2gADAdwCrq62BU0qn
         zoBcHOS2MbgyPQamYrWDFa73s7LJmVUqPfkjLdHGWrUnrVWvYL+80qKiytmW6yg815dN
         oFjfMoyBFrK9ZXZIkBiEW12It4QQJhBQszASJ2ZWMZcqpfSc74yhgvtWBNi+V+FVp7yZ
         TKTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779589200; x=1780194000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHQ3iAVdgRbGDQ5MY/Sudz6ovqWFvWub/1D9p3tFQO4=;
        b=T5ilDOUlAyXSY29qSWXzD0MFhHL6oRh0sSNP7BGEq1MEWVKmggXRghgQa4FACfL9wF
         p9DGANtF0PRB065RpnW7b3evgBE1wmoOJJ9dtpjYHTCfVk+IRhxIwb3EtgELS7WdJl1i
         jgUr3bsk3BY6EtV89laElt3OBQBHIgzdN2WELgG3gFclNguLPjW8Fpqnoa+YHjBho+eL
         6D3mPaNtz0FpzSAA0aLBpBl88zKDpKJUf5elBaw+HGLDGyTFRb3OG8aAgog8+H3SRxqG
         I7LjHzsKW5wpJkbJSxonFCOvLhJk5fes2EMgWtCVDMj6jWBfxUFqKjd03E1TNejG+jSD
         QORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779589200; x=1780194000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aHQ3iAVdgRbGDQ5MY/Sudz6ovqWFvWub/1D9p3tFQO4=;
        b=Aazsg8m/JFtSaM53yeyEW6B+KmvShLGINWdYJVOMJPetEI689dAD8b3nEh0fU9vsYL
         f3UrNCa/LlHsbTlD1d2fm0XCnTc8vZwnQTKjwEEAuT4fFRZ0AdCZ5uB3+Myc48oO8KFz
         y02YJdALGmLGNvjxDmKvG6hNze+zJn7E0go9Or8nKFCxPD5VbDHmIcwIQQZ+Ej+LLlCh
         DqTviuur4nD7wN+SOXoxhdPx9zWMFYbBGUYkxyNITDym/EEH/I0mv4nRrBnz6CRUPBD9
         QrwzZXJiH1Qsw2c3Q7jG4p3cCovteaZ333QNksc4R/nO5pNfBhUyqGJt7q8eMBSGemk5
         /mTg==
X-Gm-Message-State: AOJu0YznIQ7AsjagJ+MieXBLlhO47Qg6IFCnlW++Ws1L1EYk1J2z/N0v
	NTMEm8SbdgnQRt0oknvgIC7BL4z6W9JGiN2vASdy8z25xkqjWEmisvTsgpkOB8RRTbDp1s9vyV0
	LDodvvBajcShAb3glwImOjRyVeMtCtLwZsw==
X-Gm-Gg: Acq92OFZJo7fnKIwJIDFIrW2TqQMw4E7ncLFF2jZ06a4MrwDmghQhVi733SRN1st1x+
	Zi6aTJ8Js3k03EDZ2Kgw6XeXsRLOnQiCIwAPbsVl/++n0qX17loPxJLMj6hcLtJdHWTT/uPo9Kr
	tLAADuuafxP7iS2VlQedegBmDH9JYak0tJWi6etO/Nw9u9LER5liljvZtYwKQzd/ot/tiFgSMwW
	nm9klxeOLiOwWEQ5/ax8Boz3KKFv9Xif90jRejNZCQZ8me2svO72Z5SJ4t3rDaoMP2HvN4oYxkC
	3HIpy4Hw6XK8bQ/jM/u6882CFLsj9W0ZqiNXqm2JxngUHlELOAp3xNAITDYnhD0gvgFcX+PpICj
	NjXnFE3NhjyGJMjH/NV1O3FsfH6M29P5oR/Chez2KFGScw7JZupnZ1sB0yQ==
X-Received: by 2002:a05:6402:458f:b0:687:261a:3388 with SMTP id
 4fb4d7f45d1cf-6889cc44682mr4923972a12.22.1779589199598; Sat, 23 May 2026
 19:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524015042.175271-2-rosenp@gmail.com> <20260524021121.7236F1F000E9@smtp.kernel.org>
In-Reply-To: <20260524021121.7236F1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 23 May 2026 19:19:47 -0700
X-Gm-Features: AVHnY4Jxyl9vhzPHY1eM34oXn0Rk0ghXT-N_a1E7K7GW2FgWuQiMpkfBXewQW1k
Message-ID: <CAKxU2N_jsxv0Zre0FJUGFc=YRyB3Ww8bWxvgwYp0RFaM+Hn3mg@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] watchdog: ath79_wdt: select OF and COMPILE_TEST
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 7:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The global pointer `wdt_base` is assigned during probe but is ne=
ver cleared on error paths or during driver removal, breaking deferred prob=
ing and driver rebinding.
> - [High] The driver fails to prevent concurrent access from open miscdevi=
ce file descriptors after the device is unbound, leading to a use-after-fre=
e or page fault.
> - [High] The watchdog hardware is not disabled during driver removal befo=
re its clock is disabled, potentially leading to uncontrolled system resets=
 or hardware locks.
I am getting fed up with this garbage.
> --
>
> commit 71b88482365f22ded9cd7ae662eb7b028ce262ea
> Author: Rosen Penev <rosenp@gmail.com>
>
> watchdog: ath79_wdt: select OF and COMPILE_TEST
>
> This commit makes the driver depend on OF in Kconfig, as it is inherently
> an OF driver. It also adds COMPILE_TEST support for all platforms instead
> of just ARM.
>
> > diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.=
c
> > index 7df703e9852a6..409a40b149015 100644
> > --- a/drivers/watchdog/ath79_wdt.c
> > +++ b/drivers/watchdog/ath79_wdt.c
>
> [ ... ]
>
> > @@ -295,13 +295,11 @@ static void ath79_wdt_shutdown(struct platform_de=
vice *pdev)
> >       ath79_wdt_disable();
> >  }
> >
> > -#ifdef CONFIG_OF
> >  static const struct of_device_id ath79_wdt_match[] =3D {
> >       { .compatible =3D "qca,ar7130-wdt" },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, ath79_wdt_match);
> > -#endif
>
> [Severity: High]
> This is a pre-existing issue, but does the driver properly clear the glob=
al
> wdt_base pointer on error paths and during removal?
>
> The wdt_base pointer is assigned during probe, but if a subsequent
> step like devm_clk_get_enabled() or misc_register() fails, wdt_base is
> never cleared.
>
> When the driver core later retries the probe, the initial check evaluates
> to true, causing the probe to indefinitely return -EBUSY:
>
> drivers/watchdog/ath79_wdt.c:ath79_wdt_probe() {
>     ...
>         if (wdt_base)
>                 return -EBUSY;
>
>         wdt_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(wdt_base))
>                 return PTR_ERR(wdt_base);
>     ...
> }
>
> Similarly, ath79_wdt_remove() does not clear wdt_base when the device is
> unbound. Because devres automatically unmaps the memory, wdt_base is left
> as a dangling pointer, preventing future unbind/rebind operations.
>
> Should wdt_base be cleared on error paths and in the remove function?
>
> [Severity: High]
> This is a pre-existing issue, but does ath79_wdt_remove() prevent concurr=
ent
> access from open miscdevice file descriptors after the device is unbound?
>
> The driver uses devm_platform_ioremap_resource(), which automatically unm=
aps
> wdt_base when the device is removed. However, misc_deregister() does not
> revoke existing open file descriptors.
>
> If a user space application keeps /dev/watchdog open and calls write,
> ioctl, or close after the driver is unbound, functions like
> ath79_wdt_release() or ath79_wdt_write() will dereference the unmapped
> wdt_base pointer.
>
> [Severity: High]
> This is a pre-existing issue, but is the watchdog hardware safely disable=
d
> during removal?
>
> The watchdog hardware is not explicitly disabled before its clock is
> disabled. Because wdt_clk is acquired using devm_clk_get_enabled(), the
> device manager will automatically disable the clock immediately after the
> remove function completes.
>
> Disabling the clock while the watchdog timer is still running leaves the
> hardware in an active but unclocked state.
>
> drivers/watchdog/ath79_wdt.c:ath79_wdt_remove() {
>         misc_deregister(&ath79_wdt_miscdev);
> }
>
> Should the timer be stopped explicitly before the clock is disabled?
>
> > @@ -309,7 +307,7 @@ static struct platform_driver ath79_wdt_driver =3D =
{
> >       .shutdown       =3D ath79_wdt_shutdown,
> >       .driver         =3D {
> >               .name   =3D DRIVER_NAME,
> > -             .of_match_table =3D of_match_ptr(ath79_wdt_match),
> > +             .of_match_table =3D ath79_wdt_match,
> >       },
> >  };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524015042.17=
5271-2-rosenp@gmail.com?part=3D1
