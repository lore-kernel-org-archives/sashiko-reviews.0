Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC53F3263
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164641; cv=pass; b=RnIXi3m3fOjMUwraJewUlbmRZE1FHrQeYLJkl09P3M0bmYuwObdhLJT/blRb9RNLduWXjaFkcGJXb1811F/cIvIbV/3YRdIVONYxRTGqWUrAZeS4PUleWq4WsKvXf03F0lqX1NK6/E33HYDnAzjEhLqTHieKlJy85jLQLxL2VpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164641; c=relaxed/simple;
	bh=d3pIqDKjwzqjI/GWL4Iy6hIvXv3G/GiTWsez1fVu8C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNXl2It9bYmw191VMSqYMs8QFcFrcBaJYRBAdPGUzcE9glYsGKCvdAA0Mft/7+xh0fs54pdhZhlkasnhECEGdAxvtjQabOddyFAHxFnNa/JVgtiOoi0N0YUZzvkiRDk4QNG/r8EY9WLMCNsqY57SbEZJrpT204UbgrBX4jFFj+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq4gajRA; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq4gajRA"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so662725e87.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164633; cv=none;
        d=google.com; s=arc-20260327;
        b=kwK0AVsJEvjkLd98c5VN0AIQbtAygZZngc9w1FQYTZaODY1/sRvx2V6Dn0AcHFZHqN
         p14BOPfKEGa4Y0kizJ7ZpEuOxYEHdLJ/apAR8g6qvCNJ7woQPmENsYwvfQbG+Q038XrA
         Zz35BH0IY9YkNO2iNQNTChDiclBcz2TGsm9G5DtrQhD7K32iGnt904XSGKvN1kLeQFje
         NKriHOU1830a4LraEenmFzc5ZXyr1L9ZxpGgT3tP9KeuRqfUtCq9HGWBuJvB+hXZTILe
         k2o+aeR1zmx3Amf9Hb8AJ6lzWqhOtyZcbcp5Gb8k2/orJpyJ5F/jnbgdbfQQXkZZEjPY
         3+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        fh=LurvqkyHfbugGG7TvbGP+3ajYP8m5w7mjQCQwC86IXk=;
        b=gFbez5itDq7a+BIO4Fhy3uHfJTrDZTVqBD+0YpluwqWIRONt/VnCh8AXraO17neiBP
         rpeB//CoJZYWdvBldqvhGEHHmbq66oPPsM8k816ac0WIDVM2OeR6WT4ZnA3Kj6bd/RHW
         Vq+fjws9HxhZK2uB7Xigsn2W2ThDYdOAI/lpVh0grTCxDsw8X1XYKAd6dcb2QUCQDHYR
         3yLk29itdA510+EO6KOX/rUsjOaj23L0x4l6r2BxoCYF3byG6KvQWwHROIw0LVFi4+fT
         UA+rgPgtnvRYErOUOh7hKEBLf249ixSG3rxOHgX6CvfvipWSpyoSVAjkxwQzG68bzqvC
         hI/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164633; x=1790769433; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=Hq4gajRAJJI3/RageZ6J/QHzefCwm2RsNpsG73RPNHm6gtlH0qJDAWAZ1BnymYS5L1
         kynKDG4/IInMkLBPWz6CAr5w65egJFlLKAM8Th1L4J33fOvF2fmlYwBQalvh8teUUi95
         l74EXTVuHJUVWkus097/uqKfIols5MiwL7+GbX/c0/UE8YiEJEb3ezackYlSkDzBlVMZ
         6oyD1mwW3Hw1/TIfDNVmsUbRKSudv2GNYvMe2O+xQQxLnj1z9oczl0epYiDCS3T39qs8
         GC0eq9CA1m2kJEQ8LgrtXu0868ZrMK7n/+z7cgIl1HZ0NbV6UhaRF7oWMJ6vHbMXcnhB
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164633; x=1790769433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=QLXGSRH7l9WNOA1uzY4yb7Dc8aV1ib6xa/5OGuIHA5kf4oggDosiAXMk2KZeK+d9Rv
         FK4vT1Aoyn3aFKZVHvozYmN3FYv9baH6AA7kRHndOczAXX2VuhAcwQVQaYLobLAXM2Gx
         3hmaXPGSK65qX0rqz0YVXoZ3NaWtk0DK5VX17mGaJtwbi9h3+lIZx3/E0k9R6NOHqvpf
         QdU5l/U16tMl099vaoZ0PbSwL5r4yPbhZCSgeKF7PYL/SBYiExYnrev0gdGWSglnNEn6
         qEVlYwZaQ0jCK5yZiXsnXK3TZWPL5oWXG6rM3iro6ted1fYibxTMe14+99tueLLs3/lY
         l8Zw==
X-Gm-Message-State: AFuF++nFr6jr0XpE2fCkDXy4nwTK3KSWYlQhSvPfLMxk2TPZVF4zbnks
	VO64+pFOlFa6IrHlVJGRZVbclRByXwStQISpQAt5yTvcXJURyCQil0YW/idZpQahIDK2PQ8Hgk1
	f3/az4ix+fQuiBA1g5kc8WHVe/f7lXDNoTOxy//IQSQ==
X-Gm-Gg: AYBFou36CV6tuHCw4i+AvpMiEiJKVv42CQPEyuYIfi/16nPWct5Q6h6B80B6446C0Hz
	9cQcTW6YmmIAD1qUsdOGf+/Kc2vd+jBacVvT2+lk5Jmq2ABYxd4jnfrM5tHB8XCe+XJEcETT7Lj
	a8uXxmu9Co+iNkSqZh8yGix7dPXZCIq/eGUgF0JdYP+sBuv4nJDR15BRXWSGy4HJx2kSykDTOjY
	Sk+Y3B3EzOlUVnEjWD82vonpS3UPVC8WRKYWwBIVXhBhdKM1CQunV7WoqEhvtOWQBNZNQGWJ817
	MGxIY4+6aiAQLQHaOSnfToHz0t9HQ469/vlYAUOKTpRvtIgETB8Jz+3Mu9bRMoIhoCRzZf9Ba6i
	Cc9DKSZK6Lc3m
X-Received: by 2002:a05:6512:3b1e:b0:5b8:999f:718b with SMTP id
 2adb3069b0e04-5b8d89529a8mr775837e87.12.1790164632483; Wed, 23 Sep 2026
 04:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com> <20260923094144.E723B1F00893@smtp.kernel.org>
In-Reply-To: <20260923094144.E723B1F00893@smtp.kernel.org>
From: Steve Reaver <stevereaver@gmail.com>
Date: Wed, 23 Sep 2026 21:57:00 +1000
X-Gm-Features: AcwNN1Vz4ppQFb3PfMiYiHwl33Vcr8dKREmMuo6U_3H7qEGvy_Pm4z2nh8h_0rk
Message-ID: <CA+sfT55QcfAGP=ttb-YNvR85ggCyfmgBp9YJ4853KGg0da1aDQ@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The remaining removal paths don't apply to this device. The platform
device is only unregistered via ACPI_RECONFIG_DEVICE_REMOVE, which
requires the INT0800 ACPI node to leave the namespace. INT0800 is a
static DSDT device: it has no _EJ0 (the eject sysfs attribute is never
created for it), cannot live in an unloadable SSDT overlay, and has no
hotplug notify source. Unbinding a parent device/driver does not
invoke a child's remove(). With .suppress_bind_attrs the sysfs unbind
is gone, and module unload is blocked by open fds via mtd->owner. The
residual "rmmod -f with CONFIG_MODULE_FORCE_UNLOAD" bypasses
refcounting for every driver. FWIW, the underlying limitation =E2=80=94 map
providers freeing mtd_info while the core cannot wait for open fds =E2=80=
=94
is shared by all existing drivers/mtd/maps users; addressing it would
be an MTD core lifetime change beyond this driver.

On Wed, 23 Sept 2026 at 19:41, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mtd: maps: UAF of mtd_info and I/O memory on device unregistrati=
on
> --
>
> commit ad3016fe3893b23f61acf9f96913ff51726ac3a0
> Author: Stephen Bancroft <stevereaver@gmail.com>
>
> mtd: maps: add INT0800 firmware-flash map driver
>
> Add a read-only mapping driver that binds the ACPI INT0800 "Intel
> 82802 firmware hub" device and exposes the system firmware flash as an
> MTD ROM device.
>
> > diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
> > new file mode 100644
> > index 0000000000000..c5f108aa34797
> > --- /dev/null
> > +++ b/drivers/mtd/maps/int0800.c
>
> [ ... ]
>
> > +static void int0800_remove(struct platform_device *pdev)
> > +{
> > +     struct int0800 *fw =3D platform_get_drvdata(pdev);
> > +
> > +     mtd_device_unregister(fw->mtd);
> > +     map_destroy(fw->mtd);
>
> [Severity: High]
> Does this teardown path force a use-after-free if the device is removed
> while a file descriptor is open?
>
> While the driver sets .suppress_bind_attrs =3D true to prevent manual sys=
fs
> unbinds, the driver core can still invoke remove() when the underlying
> device is unregistered. This can happen if root unbinds the parent bridge
> in sysfs, or via ACPI SSDT unloading.
>
> If int0800_remove() is invoked while userspace holds an open file
> descriptor, mtd_device_unregister() puts the kref but does not release
> the struct device because the character device retains an active referenc=
e.
>
> Unconditionally calling map_destroy(fw->mtd) then frees the mtd_info
> structure. Could subsequent /dev/mtd0 reads or sysfs accesses dereference
> this freed memory and access unmapped devm I/O memory?
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923092626.87=
3202-1-stevereaver@gmail.com?part=3D1



--=20
Steve Reaver
http://www.stevereaver.com/
Electronic Music Production
