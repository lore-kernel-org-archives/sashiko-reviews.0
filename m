Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7752FD1DA
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603424; cv=pass; b=AvnGyfOdsRw7FjLknvczDaZEDkVvyGvcPKFe1Ji2+vqsTY6Ye5S4Cck2s06fsEQEb9cDWtXPtdb2P1FO6xgqzog7rQOK2xb8hyUODivQGW0pEma6g0Jm4BxaBrlGu7ZMXcWWwx6RKyAuA5gAguLjA0RbzolSWerN9K9gkd566BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603424; c=relaxed/simple;
	bh=Ll0oXFaUVmJjuNd/liZj62ZGpCxxtgMatuhbXv24e9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcXY+QWP0OvZ5RP+UUb8Ky9vSnCvnY4dVuwinc0p+JxBbL9CfJVqkCvAv5QY4uYQyxSXBMxSCjBmBOEckABlZsSt8UtxESqT/ck3+xY6bRdOd0q9JFZmCrBKGjzB2gpHjGc3yLkQnfLa1XqyVuYKX+uz402eIAEFBYzFx/ZqSkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ElxYxSlX; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElxYxSlX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80a123ef90aso64506247b3.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784603422; cv=none;
        d=google.com; s=arc-20260327;
        b=fQK/Zdxu23o9DEyfY4873hNYn41e06iUE5P2h4nXMynBQTY88zwkjpJ4TyYkPs+oMR
         y2PZ+E4P+wbqFCRhb3luOsK7deCpA68X2zMLd3R8kAZpQtoCi/poJ0fA7Di3X7fvQCts
         B7VpNQHJTJHITxsdZH7hHQJVNJMikZgQjrqhh7S6eEZRnlTbrjow+/ZJ1fjGXGeHF+gO
         chcfZW8LVlVaWAhkWQpOQlIZ8T9SvWPzwHX1kL9vbZYBK9OxkHYssbCINYcYH+2Wp5pz
         82gjrkxfXBuCjKBU9UZ0dXNTzXVga5QcKLaAQiMvscgIjDTkxMiWZNRWhYlBVoxN1pke
         mTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        fh=ZjoP3inPy0EcODIMaiQgZsErGHXdH6i47dh1g1UTqyg=;
        b=j+w59irPU4rWSXK6XFVRQUJ14c0djowqxRrood0OPwItrIxvbKLdr/SzrS38Cx9bvK
         P62ZFA3aQDvJK7rJboMn6JBUsPHTWAziJlrwP6J8hwBHIGnPUynPN2FlWhIuvhLh0Z4T
         gfzH3Xsm+4hatWCl9n4qRdf43P3ag4C9c1+cuQMa7zi0FdodHp+lqxopTYnH1scXSm7p
         SiAdNbOJJevZjzuDYGu1bVto2hJ95/pvgHgghUXKll33ZmAtycGBlhlR8oeryEVVSkj8
         nGgEMYm4jb+pDft1u7YF4MiOoQUpjiMc+Io6FT0bBc8G/rBQ4MSqa+SzyJ/oaQCSVqXU
         CtDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784603422; x=1785208222; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        b=ElxYxSlX+X5WxrzkRunFb1HBvh4C5sWNfjWQl9dhPiJvzlD5ykqgaspLTKwLLbki93
         ReBATGjjAs3tq8cgSD8VOAhEZ8LhjaUW2rVz9jfWQnzxPgoy0AmH8X/abChlwX1hrfQA
         gS2q2zn0ngpm+dsAjMmH4QU++ls8MSdk3Ik54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603422; x=1785208222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        b=nCPPq2JzH42gdKj7kchodIfEapJu/StWmciAKfS5qBuEISjAql/mdNW+jwdam3nxNN
         FYycmMpcdTLlflwBt5s6mfsnlMVsuKqnyT8py6wxToh55dcgSrmdOX0w0XJXKXMM0co0
         eZo/rReJ9Tmr8k6ghbxAmxN5DSY+VFle6bLouCkQ83ZR/Nacr/M7/iNf1uSqIxKaP226
         XR6Qhy0kNnCOQ8kYmOsdmR1zEG/vVTKwH4KzxJogXyL2l2SgiG+wfQvJPHDX5w/SHTVe
         X7gXaw0UF+1EqF8/3rfL31q8tSPTBHhCdzlP66ia/yYWxeF6Z76/wu3akUliPgOGHR0W
         ZPmg==
X-Gm-Message-State: AOJu0YwUhvoeK2xVDxIiARF0PiKPQe5pnOk2DODeSpQoYtKvYgo+VWBp
	gx33yJ7vZvAXANOMAefJAZSCBwrUPeA/Sw858IWZAhutrvI9FjTY3IreeaXmBxowqxmdokPQkw2
	wm9pWDElHfJ8vyNEP5vut6xBXlAJMjXPq9d5Gmo8UV3WEavC/nTM=
X-Gm-Gg: AR+sD13c38xAibJshB0im354sxKHwmeoZo9rKoQOaxDU8oVX8638Ch2V6n56AV2OCPH
	R/qhF8GHJqIGrbn8SCb5YsGqaEv12HuKCqnuLsUnwnTOJHXsueKYV0gUWCKk9j1mvB5tH1h72A2
	P9gnUn+gg72QloZf763SpYi55Ibf9WbKIohkUniDV2E86JfXA8A1ieq5xrrO/Tzfi4lKSmKy0bI
	npIa4UFA4tyqBC9+h596yNmH9KKsPaNTgB5B3DFo5ewMLRs84hrgvzj5ucYwexEvQTYlUAr6HLm
	aRsOq1d3NOx5GguL
X-Received: by 2002:a05:690c:e1c3:10b0:81e:f57f:1f8f with SMTP id
 00721157ae682-81ef57f23cemr34445977b3.6.1784603422238; Mon, 20 Jul 2026
 20:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1784600387.git.daniel@makrotopia.org> <91b40322b07b967fcf286b3e4bd11e5f821bff1c.1784600387.git.daniel@makrotopia.org>
 <20260721024147.2FEE71F000E9@smtp.kernel.org>
In-Reply-To: <20260721024147.2FEE71F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 11:10:11 +0800
X-Gm-Features: AUfX_mx4qcPgLK3orBZOGVBUCGLkc4lvsRzCU905dlQI4f0WIMZbU3ENBGxGpF0
Message-ID: <CAGXv+5HhSyr-q-T-JxOjPv013CsNh1wtf4QxPYxQbrf1XQcaXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/bridge: it6505: cancel outstanding work before
 teardown in remove()
To: Daniel Golle <daniel@makrotopia.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Jul 21, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Calling cancel_work_sync() on the potentially uninitialized ex=
tcon_wq triggers a WARN_ON(!work->func) kernel splat.
>
> Pre-existing issues:
> - [High] Canceling work items without first disabling their scheduling so=
urces (IRQ and extcon notifier) leaves a race window where works can be req=
ueued, leading to a use-after-free.
> --
>
> --- Patch [1]: [PATCH v3 1/4] drm/bridge: it6505: cancel outstanding work=
 before teardown in remove() ---
> commit 06b35e4209da852ce0af8e4b1dd2aec2e9e172b4
> Author: Daniel Golle <daniel@makrotopia.org>
>
> drm/bridge: it6505: cancel outstanding work before teardown in remove()
>
> This commit adds calls to cancel_work_sync() and cancel_delayed_work_sync=
()
> in it6505_i2c_remove() to ensure background works do not dereference free=
d
> memory after the device is unbound. It notes that extcon_wq might not be
> initialized, but claims a zero-allocated work_struct is safe to cancel.
>
> > cancel_work_sync() on extcon_wq is safe even
> > when it was never INIT_WORK()'d, since it6505 is zero-allocated and a
> > zeroed work_struct is reported as not pending.
>
> [Severity: Medium]
> Is this description accurate?
>
> Looking at __flush_work() in kernel/workqueue.c, the workqueue core asser=
ts
> WARN_ON(!work->func) when flushing a work item. If the DRM bridge was nev=
er
> attached, extcon_wq remains zero-allocated.
>
> During module removal, calling cancel_work_sync(&it6505->extcon_wq) will
> unconditionally call __flush_work(work, true), which immediately triggers
> the WARN_ON because the work function is NULL. On systems with panic_on_w=
arn,
> this leads to a kernel panic.

Sashiko seems to be correct here. This is going to cause a very loud
warning, which we likely don't want.

ChenYu

> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 8ecb43611dba8..2f349aefb7054 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3644,6 +3644,10 @@ static void it6505_i2c_remove(struct i2c_client =
*client)
> >  {
> >       struct it6505 *it6505 =3D i2c_get_clientdata(client);
> >
> > +     cancel_work_sync(&it6505->link_works);
> > +     cancel_work_sync(&it6505->hdcp_wait_ksv_list);
> > +     cancel_delayed_work_sync(&it6505->hdcp_work);
> > +     cancel_work_sync(&it6505->extcon_wq);
>
> [Severity: High]
> This is a pre-existing issue, but does this leave a race window where the=
se
> work items could be requeued?
>
> The driver uses devres for the IRQ and extcon notifier, which remain acti=
ve
> during these cancel_work_sync() calls. Furthermore, the hardware interrup=
t
> is disabled after the works are cancelled.
>
> If we look further down in it6505_i2c_remove():
>
>         ...
>         drm_bridge_remove(&it6505->bridge);
>         drm_dp_aux_unregister(&it6505->aux);
>         it6505_debugfs_remove(it6505);
>         it6505_poweroff(it6505);
>         ...
>
> The interrupt is only disabled inside it6505_poweroff(it6505). If an
> interrupt or extcon event fires immediately after the work is cancelled b=
ut
> before it6505_poweroff() and devres cleanup, won't the handler run and
> re-queue the work via schedule_work()?
>
> This could lead to a use-after-free when devres frees the it6505 structur=
e
> while the re-queued work is still pending.
>
> >       drm_bridge_remove(&it6505->bridge);
> >       drm_dp_aux_unregister(&it6505->aux);
> >       it6505_debugfs_remove(it6505);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784600387.=
git.daniel@makrotopia.org?part=3D1
