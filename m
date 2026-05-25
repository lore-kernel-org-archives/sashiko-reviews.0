Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0423C503
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 03:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680355; cv=pass; b=FC9D+pi93nZttEdx1wXU4fskrQ1rsno4AuLoNoWpSAQnl52I+kGYeuVAtXKAiX+RUWOXxd8VmSzbrBXamvJOiwpwatWt/IVBbeEavPRAjH2rszpRIKQO27qcAZMYdSP+GjMD1X+VULopeykqdmJViX1oWWRACVwsU/9Y4IEoTJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680355; c=relaxed/simple;
	bh=z6cIIRV9zGTa+jtuvPQ/j2H/8Y/1y7aaysy9OHxuTIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUvHljPgY0n8VyDfeIWqpVbJyrtbJN8XDRNQt2gC71FnNo0x9SFa7cP1r6+7Fqxcqup2VNIviAwIqg4nBN8H2/f+WHLkzV6eAMrMK4s3/24N1ZMNIxOjtZ63LWfRyyEwMRvZWTjE6TytSWqHh96Y9hHt2TBIk8RmGWz8zapjTmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WACGA9+D; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WACGA9+D"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b6dd874471so139853416d6.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 20:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779680353; cv=none;
        d=google.com; s=arc-20240605;
        b=PfQJPYIz6e0Wdoh7Ko/NDm7zrjDFw8W2aX4k2orYaJ9p9HWi3/h6SSA3Hke3URJNkz
         y0WWW78mByda5qHBeyioynsALyS+GWZ7Eypc5pD4GH6fk6zZKwyadFmvmXEYhwp4fiTB
         N7gl42MG07dggZlTqDj74GJYyYI+Fl1PzTQA9cjZyDk8rmlQTKNI9bdcAzpuwzVu3m8+
         fJbkeuNcD0FQFfNv6ixjK9aloP0nHtElEOZXIClB0jORpE8O16sgL9ZZl6OAbkUGK9Jl
         AWaNJadIvP+r7ZvPQVgTiOmkDgc2DGWFZzQGOZVRb9xNGs84N3o5Uol1MYNZJ0gf5UYT
         akAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7LAITZFVNXe1IqWBb+mpAAhUQyr1/OI7LF6K9KvFcO4=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=ZU5ubk2RF3/HhCnmZKsMiZIhkRlNJLtihAY+x+XhxUzHKKZKaZwRDwjA2DZDl81CHY
         I2mLK29yvsHPfglX8Y0mr3c0mIy7PeDNKJKoka9cxZHExboMdt6Lr8peKDEsBu3nx+Mg
         LaCFvznbSglYqqKEp0y+t8yPkBh6OsdKeTcjXVM+WrJ9d30KBpwb/nXQhFNzdf96B+qC
         cWG284ZVaD8vz/7RyhHqhLHA+l6mXC92+mJ6XBa4z3aPQiYNcVZ3rGa7e+2kIcWnb8P+
         zSrHwum/qQmVhbD9PPm/V7YZrrLv/iTpPrK4xYN7NNCHn+hNrANQDCRkEkW+PxKlPAmh
         WKhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680353; x=1780285153; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LAITZFVNXe1IqWBb+mpAAhUQyr1/OI7LF6K9KvFcO4=;
        b=WACGA9+DYtGQSFzWPY+l9KPZk0NvaswP9NewR+Qz4NAm+FhaYQAmrmWKkcmh6MFr/Y
         nG5k7myLjwIUAB40cfu7jnzJRLTwq73zS+tmI7eVYM66DYvU+ayucQMmiIRCzfpI04rJ
         KF2kuVjn7SfkvTFKMr1Veq6WDerNHIKE2LFI+G1n+/N0VpS9QqymZRKmKHMbQnFw7ZSU
         OiHv9VuXMjyaM/DBEkIRPc4tg5V84ZzSp3U4D5KcXzncYJJCGwIPErk6UY9Qezu3CEsr
         iXQW4gI4tTU12AhS1IIg47GaGfGiQZdTR2Qnd7mHSE1m+jOjguYxUPYLXYT8+VGVYz2M
         oJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680353; x=1780285153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7LAITZFVNXe1IqWBb+mpAAhUQyr1/OI7LF6K9KvFcO4=;
        b=SbZG5eVfkLGJohUyLFA8zCJvuj7tt/9MblhykHuQqQpfjoG1rT+bnPVv2ylbDVO9Uz
         NNt1BYolfrJBrX4jXXnT+BLl1UIxq6TF1hqrNFpacqDRb2Ut2DTx2FkLFCY88+XrNVg+
         JmFKjv7PVGTnlYY8qqYXSj8PfjsiHs2YWg9BlqaMBiSqXdzZaaqP6DAY1Sy/HmWSkto6
         LqARv7mmXOeLMj07ncBDKa2/DkSol4aQNKD1DZY+RHENR7X1KVFZssRIpr4uhbJ5Yd5z
         JIwikz+euw7uX9mbefzA6YyYVdutDyq3G9kiuOkH/HFshWHuVNvlYmcVv5hAKpmHLOTV
         ZcDg==
X-Gm-Message-State: AOJu0YxA6f3hjHL+pqgazvenDomHTkdYAfFswTPjR2jeOW2qioEmWE8G
	0Gy9UM63w8FO2hfz/zg6K468ojG3gXdNseNdfCNNY/L+ysbmXG3GOlPK/IqT8llgTSDxY7v9dqg
	hJyAmBonQO7LZ9SX1I9DqEuXGpCcJpmk81ikg
X-Gm-Gg: Acq92OH70ume0mRL8gMrU7zEBrdLDpvxSH9+fKQiQepNSZ0dxdmhSx5wAhBNoEFvVP8
	Z2NuYmm1riA2sFfOkNuEFRWQHKvUwK+fNB8pKRvjrDmEyEj22HyIebV+EtF0gEKTqedqg3sikKz
	xaflyNWr4UoLgs805Z+iUhsej+YlxC6ozA/MhRyXad4vY19NstYbEpx5c2AWdGMOkbZ+lPMcKtw
	aam8FkRPHVxdM5j8hkm4yPb//WHXdUM8W0bO5Pv/ov6bO3Lq2y03860dOrNOm8u/p6oCuu5uxcr
	yrjdrFUW4MV1a7AM0Q==
X-Received: by 2002:ad4:5bce:0:b0:8cc:d41:ba14 with SMTP id
 6a1803df08f44-8cc7b628b68mr239101266d6.44.1779680352862; Sun, 24 May 2026
 20:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525020543.519082-3-derekjohn.clark@gmail.com> <20260525031507.088AC1F000E9@smtp.kernel.org>
In-Reply-To: <20260525031507.088AC1F000E9@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sun, 24 May 2026 20:39:01 -0700
X-Gm-Features: AVHnY4Jkg14EBH81qkvmp6MNtputIjbMMV1eI_YJztpyOEWe6LAzE8V4hKQar8w
Message-ID: <CAFqHKTmTVnOivNMvTVBD+-n_pCMknQyUf+D=KqM_Um4Y+gW5=g@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] HID: hid-msi: Add M-key mapping attributes
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 8:15=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Typographical error checking `gamepad_registered` instead of `gp=
_registered` causes newly added sysfs attributes to unconditionally return =
`-ENODEV`.
> - [High] Dangling asynchronous ACK from `SYNC_TO_ROM` can prematurely com=
plete subsequent commands, corrupting the device state machine.
> - [Medium] Spurious or late `READ_PROFILE_ACK` packets incorrectly abort =
subsequent profile reads with `-EINVAL`.
> - [Medium] If `claw_hw_output_report()` fails in `claw_mkey_show()`, the =
function exits without clearing the `profile_pending` state.
> --
>
> commit fe7de95a59af02c44e638aba1fcc1763f3b5354f
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
>     HID: hid-msi: Add M-key mapping attributes
>
> Adds attributes that allow for remapping the M-keys with up to 5 values w=
hen in
> macro mode. Mapped events will fire from gamepad, keyboard, or mouse evde=
vs.
>
> > diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
> > index 3a176f44f2c43..5f20102eae69d 100644
> > --- a/drivers/hid/hid-msi.c
> > +++ b/drivers/hid/hid-msi.c
> [ ... ]
> > @@ -87,24 +249,47 @@ struct claw_command_report {
> >       u8 data[59];
> >  } __packed;
> >
> [ ... ]
> >  struct claw_drvdata {
> >       /* MCU General Variables */
> > +     enum claw_profile_ack_pending profile_pending;
> >       struct completion send_cmd_complete;
> [ ... ]
> >       /* Gamepad Variables */
> >       enum claw_mkeys_function_index mkeys_function;
> >       enum claw_gamepad_mode_index gamepad_mode;
> > +     u8 m1_codes[CLAW_KEYS_MAX];
> > +     u8 m2_codes[CLAW_KEYS_MAX];
> > +     bool gamepad_registered;
> >       spinlock_t mode_lock; /* Lock for mode data read/write */
> > +     const u16 *bmap_addr;
> > +     bool bmap_support;
> >       bool gp_registered;
> >  };
> [ ... ]
> > @@ -165,9 +383,20 @@ static int claw_raw_event(struct claw_drvdata *drv=
data, struct hid_report *repor
> >                       complete(&drvdata->send_cmd_complete);
> >               }
> >
> > +             break;
> > +     case CLAW_COMMAND_TYPE_READ_PROFILE_ACK:
> > +             ret =3D claw_profile_event(drvdata, cmd_rep);
> > +             if (drvdata->waiting_for_ack &&
> > +                 drvdata->waiting_cmd =3D=3D CLAW_COMMAND_TYPE_READ_PR=
OFILE) {
> > +                     drvdata->cmd_status =3D ret;
> > +                     drvdata->waiting_for_ack =3D false;
> > +                     complete(&drvdata->send_cmd_complete);
> > +             }
>
> [Severity: Medium]
> If a spurious or late READ_PROFILE_ACK packet arrives, claw_profile_event=
()
> will return -EINVAL. Does this unconditionally pass the error to cmd_stat=
us
> and prematurely complete the wait for a valid, currently pending READ_PRO=
FILE
> command?

This is a limitation of the hardware. In real life usage this issue is
unlikely to occur, and if it does it will just cause a timeout of the
next command which can be re-sent.

> > +
> > +             break;
> >       case CLAW_COMMAND_TYPE_ACK:
> [ ... ]
> > @@ -442,6 +671,177 @@ static ssize_t reset_store(struct device *dev, st=
ruct device_attribute *attr,
> [ ... ]
> > +static int claw_mkey_store(struct device *dev, const char *buf, u8 mke=
y)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct claw_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > +     struct claw_mkey_report report =3D { {0x01, cpu_to_be16(drvdata->=
bmap_addr[mkey])},
> > +                                0x07, 0x04, 0x00, {0xff, 0xff, 0xff, 0=
xff, 0xff} };
> > +     char **raw_keys __free(argv_free) =3D NULL;
> > +     int ret, key_count, i;
> > +
> > +     scoped_guard(spinlock_irqsave, &drvdata->registration_lock) {
> > +             /* Pairs with smp_store_release from cfg_setup_fn in syst=
em_wq context */
> > +             if (!smp_load_acquire(&drvdata->gamepad_registered))
> > +                     return -ENODEV;
> > +     }
>
> [Severity: High]
> Does this check the newly added gamepad_registered field instead of the
> already existing gp_registered field?

Mistake in rebase, will fix.
> Since gamepad_registered is never set to true, it looks like this will
> unconditionally return -ENODEV, rendering the sysfs attributes inaccessib=
le.
>
> > +
> > +     raw_keys =3D argv_split(GFP_KERNEL, buf, &key_count);
> [ ... ]
> > +set_buttons:
> > +     scoped_guard(mutex, &drvdata->rom_mutex) {
> > +             ret =3D claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRI=
TE_PROFILE_DATA,
> > +                                         (u8 *)&report, sizeof(report)=
, 25);
> > +             if (ret)
> > +                     return ret;
> > +             /* MCU will not send ACK until the USB transaction comple=
tes. ACK is sent
> > +              * immediately after and will hit the stale state machine=
, before the next
> > +              * command re-arms the state machine. Timeout 0 ensures n=
o deadlock waiting
> > +              * for ACK that ill never come.
> > +              */
> > +             ret =3D claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYN=
C_TO_ROM, NULL, 0, 0);
>
> [Severity: High]
> Since this command uses a timeout of 0, could the asynchronous ACK from
> SYNC_TO_ROM arrive while the driver is waiting for a subsequent command
> (like another WRITE_PROFILE_DATA)?
>
This is also a limitation of the hardware and unlikely to occur.
> If the generic ACK arrives after the driver starts waiting for the next
> command, it seems it could falsely complete the next command prematurely
> and break the lock-step protocol between host and MCU.
>
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int claw_mkey_show(struct device *dev, char *buf, enum claw_key=
_index m_key)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct claw_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > +     struct claw_mkey_report report =3D { {0x01, cpu_to_be16(drvdata->=
bmap_addr[m_key])}, 0x07 };
> > +     int i, ret, count =3D 0;
> > +     const char *name;
> > +     u8 *codes;
> > +
> > +     scoped_guard(spinlock_irqsave, &drvdata->registration_lock) {
> > +             /* Pairs with smp_store_release from cfg_setup_fn in syst=
em_wq context */
> > +             if (!smp_load_acquire(&drvdata->gamepad_registered))
> > +                     return -ENODEV;
> > +     }
> > +
> > +     codes =3D (m_key =3D=3D CLAW_KEY_M1) ? drvdata->m1_codes : drvdat=
a->m2_codes;
> > +
> > +     guard(mutex)(&drvdata->profile_mutex);
> > +     scoped_guard(spinlock_irqsave, &drvdata->profile_lock)
> > +             drvdata->profile_pending =3D (m_key =3D=3D CLAW_KEY_M1) ?=
 CLAW_M1_PENDING
> > +                                                               : CLAW_=
M2_PENDING;
> > +
> > +     ret =3D claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFIL=
E,
> > +                                 (u8 *)&report, sizeof(report), 25);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> If claw_hw_output_report() fails or times out, this returns immediately.
> Does this leave drvdata->profile_pending set to a pending state?
>
> If the state is left dangling after the mutex is released, could a subseq=
uent
> late or spurious profile packet be incorrectly accepted and parsed into t=
he
> local codes arrays?
>
Subsequent profile events will overwrite profile_pending before
sending their data. This isn't a problem.
- Derek
> > +
> > +     for (i =3D 0; i < CLAW_KEYS_MAX; i++) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525020543.51=
9082-1-derekjohn.clark@gmail.com?part=3D2
