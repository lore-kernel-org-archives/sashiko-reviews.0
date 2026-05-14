Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6F3E0232
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766229; cv=pass; b=YS/VC1UtCMKtZ66pdcfLDk6JbOajzs3oy5BX4loFYLeMtxcDh4227QJAdQ3vDNFtH1lYeJVoCX/HqCSbY9mGBbGAymKTIu2+WBGlnvCweTTpqVXztVG+9CFtW/UWFDOBuoVHDsDH6a/0jlTf4s48HgYoNXqHoWlzIM/snkiR1Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766229; c=relaxed/simple;
	bh=7Te0NodCkFdHORqZUiD6i1pe12tICwk/GjW2CLYy0sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpjWgE/5ad/iSmpWDAEnKu5Wal5REqtrGpOCdcXslH9vfgyi7IZol5QpKWLQQ7cZLE4ajI9AIar0PE5jyrPdaqYjuPCbArjFRjfZopAfCtokL/0ERv2Vf7O/PmfZCS54b24ARl43PhkpVF0JoWwpOHcIPNhpfsUnPa2YF5JJbBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KApM5aFK; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KApM5aFK"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8b8e98fd885so66504536d6.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 06:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778766225; cv=none;
        d=google.com; s=arc-20240605;
        b=eo1B+M6FEqEvI3qBAJk80QrB9jYyp3zlVv701sUAWmhT90F3jil9DUXiT2SULygEuo
         9OaZH/Nc7cyI/8QnHysWTTi4ZSwNXdPXnSuhi3fkPv2rx3FLaGCMOrUd/bOnCoaDU9La
         GYDO1YV2sWvsCsBcrKKSxtXMGpkHQc8OjxLCgC0DtWh0cbp/JGXi8MPB2CdERzvd3A+V
         L4Gv5SKbo4PiKilkuSu2Y/NLMNVH8O739oAOT4nJmT4ETl+gpIZ/IuR4EhPUC6d4F4Fp
         qqNoo5w0ouICaMJjEHYBuZEppvggEClQim57vZhqs456S36ovePlig2YTBDHTDxYdCwN
         l69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVd32T8J0fLOjF74ku1BQ845h9heIFsBXaPWaxr8uII=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=FqTZ/OgvhG1xg1EPtQnouxP4dezGVuEoA2jvDTVzpafJR7sDrLf9VhZpj7mfcNeOWx
         hkR56hm+dkAGSpTkI8AKJ64ecpaGl0fjbqcG2+lxfv4ee++NixzqkgvPYs8oMll3qa3j
         eeM1O7bOpgdnKJV3Cdu8Bg5t8uIB037LN47elXyZjQjTijkCG5b2TK67+5LX2/BZptL/
         ULu2QKv/hTodWmAx7j8hVkKGcvOLO7XdqxJKWKMljar74N5a8u1YP3E6lXQwn5CTdmZs
         JxwW+u0hRKkBkROxp0vUNEkBZOWn+hseCtSOJgNHRve516Y9LGpRHszH/4K71bv9fSZv
         6SrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778766225; x=1779371025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVd32T8J0fLOjF74ku1BQ845h9heIFsBXaPWaxr8uII=;
        b=KApM5aFKiMHxc+u4P0J5bJ7l2H/ocbcOU/0wWiE4pghpL/EbOeAdzXuYuhfNtEs3Zn
         igqzQEi0RYOtlr3hbnEaKc23RLedOIDr6/DO77BF+Of9ps6B/icyiNcg4l7VqrB7do8t
         wvfyakGtVNkUOjyDw6dkAUFvu57XaC8gdLSV3L5tBI+GAHFDzBDVpLLmm4frftxKyQTv
         VWKAbUMwzKUIDECeVVjdtK/gsZ8P47vddCzDCgQU0Xm4EuCJINehCPeBwyJBYUE5s4l/
         g8b4Nju5xjx4Q+M/QrrBaQQTlFAKpLOIs7eIU47bi08FGIVIcIel/Lx0M26XIC1p4/4y
         weXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766225; x=1779371025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVd32T8J0fLOjF74ku1BQ845h9heIFsBXaPWaxr8uII=;
        b=pTqgIqD+3wEe49kcSjC2vt32vfo8k/DJqtilSPd8Qf2xZh5rVrEMJatTI1G75z36Y4
         rXlUKQ7gzupFNUkwCdiAccDoBVl0VBM+umo649welSWSM4qwJ8SNGZ2LUSOsOCEVnmPk
         hjpfUWApAN1Tvcj1LTMmwnjamA9kqg6DJMMzvhDExxwyyNvmxeFKrQ2111rhp0aOvNK9
         sk/M+aM0ZW0ItZHNiGEKKmToo++DAM1ka21wrhYvgScl6XqsSNV+uyZ9kgR+2MKdhVvM
         4bSMiSQ/z0NAbP1YxNap6YDzGddpuJWInwYONFPOcnleo16W2euSfP71VnRD/JMOGO+l
         A2PQ==
X-Gm-Message-State: AOJu0YySOeiNLQvaZKDN8YqCl7usQ5zK7rEmQNznDVHZU6U0OuKV37B6
	do0ylfML2QSzeSeGoMy9sWEPxsPC/lHjpC/ddBjD7hrgT0oVUDbVE84ncy8WCjelwHLYEaibIJB
	zB6gjdcYydQmDN94P0g3PYe5qZ5BFlUTgnQ==
X-Gm-Gg: Acq92OFN3bY8/+8IgY4HK1HXhf2eeWOcWmddMvDIGQ5diS2VwRc4B82IfIKpqf+3FOH
	Weo45eraFLImDS3K8Th+1GKUF3lrjLaPhjnaEbKLD4Q2pft/bVqYjxLiCWRdEs71VI9GoDDBb2e
	YLV5y2IGXVGQKvW4i3KsZ86Df+d//mnm0C6yymVf/NCW7qWhmJr22j7GJj5IccPp2cPGrr5y91R
	M7SlH6ll/pMgYVYqSaLzSox6SGsSNQO+e68uPGeY5A6HXjogtQoyL3OPSPhm+ffBh/QUSJEAlOz
	DxR3Y97G
X-Received: by 2002:a05:6214:8008:b0:8a7:16f8:442a with SMTP id
 6a1803df08f44-8c7dfdbb90cmr106284576d6.39.1778766225071; Thu, 14 May 2026
 06:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513231445.3213501-2-derekjohn.clark@gmail.com> <20260514115126.BCAD8C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514115126.BCAD8C2BCB3@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 14 May 2026 06:43:34 -0700
X-Gm-Features: AVHnY4Kn2jVO-U-moUNE1cgIf9WXF8fDYZ_p-TL1E_yjNHzpzQMvglHbSFs0OOU
Message-ID: <CAFqHKTmuupBLhQ5LGmDd+2qVn-0Gt3TnnHGmPp3-HiHq7tiJzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] HID: hid-msi: Add MSI Claw configuration driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 4:51=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] The `guard(mutex)` macro in `claw_hw_output_report` is scoped to=
 an `if` block, prematurely releasing the lock before the critical section.
> - [High] The driver publishes `drvdata` via `hid_set_drvdata()` before fu=
lly initializing its mutex and completion objects, creating a race conditio=
n.
> - [Medium] An invalid, uninitialized gamepad mode (0) may be sent to the =
hardware during system resume.
> - [Medium] The 8ms timeout used in `claw_hw_output_report()` is vulnerabl=
e to jiffies rounding, leading to spurious read failures.
> - [Medium] The commit message claims probe checks MCU RAM address varianc=
es, but the implementation is missing.
> --
>
> commit 13b388de96d7484eee908adeed127e8086fc289e
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
> HID: hid-msi: Add MSI Claw configuration driver
>
> This commit adds a configuration HID driver for the MSI Claw series of
> handheld PCs. It provides support for switching the gamepad mode and chan=
ging
> the behavior of the M-keys.
>
> >     Additionally, the MCU RAM address for writing configuration data ha=
s
> >     changed twice. Checks are done during probe to enumerate these vari=
ances.
>
> The commit message states that checks are done during probe to enumerate =
MCU
> RAM address variances.
>
> Looking at claw_probe() and msi_probe(), there does not appear to be any =
code
> that checks firmware versions or handles these variances.
>
> Was this functionality dropped during refactoring, or should the commit m=
essage
> be updated?
>
> > diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
> > new file mode 100644
> > index 0000000000000..8915942af15e6
> > --- /dev/null
> > +++ b/drivers/hid/hid-msi.c
>
> [ ... ]
>
> > +static int claw_hw_output_report(struct hid_device *hdev, u8 index, u8=
 *data,
> > +                              size_t len, unsigned int timeout)
> > +{
> > +     unsigned char *dmabuf __free(kfree) =3D NULL;
> > +     u8 header[] =3D { CLAW_OUTPUT_REPORT_ID, 0, 0, 0x3c, index };
> > +     struct claw_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > +     size_t header_size =3D ARRAY_SIZE(header);
> > +     int ret;
> > +
> > +     if (header_size + len > CLAW_PACKET_SIZE)
> > +             return -EINVAL;
> > +
> > +     /* We can't use a devm_alloc reusable buffer without side effects=
 during suspend */
> > +     dmabuf =3D kzalloc(CLAW_PACKET_SIZE, GFP_KERNEL);
> > +     if (!dmabuf)
> > +             return -ENOMEM;
> > +
> > +     memcpy(dmabuf, header, header_size);
> > +     if (data && len)
> > +             memcpy(dmabuf + header_size, data, len);
> > +
> > +     /* Don't hold a mutex when timeout=3D0, those commands cause USB =
disconnect */
> > +     if (timeout) {
> > +             guard(mutex)(&drvdata->cfg_mutex);
> > +             reinit_completion(&drvdata->send_cmd_complete);
> > +     }
>
> Does this drop the lock too early?
>
Hi robot,

Will fix.

> The guard() macro releases the lock at the end of its enclosing scope.
> Because it is declared inside the if (timeout) block, the mutex will be
> released immediately at the closing brace, leaving hid_hw_output_report()=
 and
> the subsequent wait unprotected against concurrent access.
>
> > +
> > +     dev_dbg(&hdev->dev, "Send data as raw output report: [%*ph]\n",
> > +             CLAW_PACKET_SIZE, dmabuf);
> > +
> > +     ret =3D hid_hw_output_report(hdev, dmabuf, CLAW_PACKET_SIZE);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D ret =3D=3D CLAW_PACKET_SIZE ? 0 : -EIO;
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (timeout) {
> > +             ret =3D wait_for_completion_interruptible_timeout(&drvdat=
a->send_cmd_complete,
> > +                                                             msecs_to_=
jiffies(timeout));
>
> Could this timeout evaluate to 1 jiffy on systems configured with HZ=3D10=
0?
This seems like an unlikely config for a performance gaming system.
> Several callers, such as gamepad_mode_show(), pass an 8ms timeout to this
> function. A 1-jiffy timeout can expire almost instantaneously if the oper=
ation
> begins near the end of the current tick boundary, potentially leading to
> spurious -EBUSY timeouts.
>
> [ ... ]
>
> > +static void cfg_resume_fn(struct work_struct *work)
> > +{
> > +     struct delayed_work *dwork =3D container_of(work, struct delayed_=
work, work);
> > +     struct claw_drvdata *drvdata =3D container_of(dwork, struct claw_=
drvdata, cfg_resume);
> > +     u8 data[2] =3D { drvdata->gamepad_mode, drvdata->mkeys_function }=
;
>
> If the system suspends before cfg_setup_fn() executes, or if the device r=
ead in
> cfg_setup_fn() fails, could drvdata->gamepad_mode still be 0 here?
>
> Since 0 is not a valid mode (valid modes like CLAW_GAMEPAD_MODE_XINPUT st=
art
> at 1), will this send an uninitialized configuration state to the hardwar=
e?

I'll add a valid default value.

> > +     int ret;
> > +
> > +     ret =3D claw_hw_output_report(drvdata->hdev, CLAW_COMMAND_TYPE_SW=
ITCH_MODE, data,
> > +                                 ARRAY_SIZE(data), 0);
> > +     if (ret)
> > +             dev_err(&drvdata->hdev->dev, "Failed to set gamepad mode =
settings: %d\n", ret);
> > +}
> > +
> > +static int claw_probe(struct hid_device *hdev, u8 ep)
> > +{
> > +     struct claw_drvdata *drvdata;
> > +     int ret;
> > +
> > +     drvdata =3D devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL=
);
> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +
> > +     hid_set_drvdata(hdev, drvdata);
> > +     drvdata->hdev =3D hdev;
> > +     drvdata->ep =3D ep;
> > +
> > +     mutex_init(&drvdata->cfg_mutex);
> > +     init_completion(&drvdata->send_cmd_complete);
>
> Is it safe to publish drvdata via hid_set_drvdata() before initializing t=
he
> mutex and completion object?
>
> Since hid_hw_start() was already called earlier in msi_probe(), the hardw=
are
> is active. If an input report arrives right after hid_set_drvdata(), the
> interrupt handler msi_raw_event() will process it and call complete() on =
an
> uninitialized waitqueue.
>
I'll reorder this.
> > +
> > +     /* For control interface: open the HID transport for sending comm=
ands. */
> > +     ret =3D hid_hw_open(hdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     INIT_DELAYED_WORK(&drvdata->cfg_resume, &cfg_resume_fn);
> > +     INIT_DELAYED_WORK(&drvdata->cfg_setup, &cfg_setup_fn);
> > +     schedule_delayed_work(&drvdata->cfg_setup, msecs_to_jiffies(500))=
;
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513231445.32=
13501-1-derekjohn.clark@gmail.com?part=3D1
