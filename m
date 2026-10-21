Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792621009;
	b=j51Wbxo9aZv5ySE7U408PAyyIoSsUYPbrwVKduHmd4pK2CYYdu7a7DKiXu8P4RKNLBPs
	 sMaySMAtkk6i+UltqUDjY7Ktr6Szv2gN9yjESNpZX/xeszPN9joTvp+uoxhIytL6eD3A/
	 wlPua67q9SxhH6VDwMRNhxYNgFZG6xTamYbrvtUqzkg+R4LWxPsWRu5Xh5CzkbK+VR4fk
	 u30XWsWTVDcq+skzzHE6Fj/UKFsIB2sEjDHw1LFswcKruvdJJ6Sk6PL6DOGmkK8H3L6Zk
	 +P+eM2JMDeM8DzzRWFORvpJGcym9BYW36wHbN0mOzSKmwj+5pvnRiDckqkRntAeV4Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792621009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
	b=X3I0mFP9CBkyg1rJIwNuJ5mTDpH8QBlnq+fWJaUJ1DKGSJYZI9wWyXdkh9EyWiJwrBNm
	 ZXbutg7EesLDnHKzG3eleSoQhR7X7I0VcsAdDkd35ZVOke1VoAQItYZuEDRO2o2Uex63v
	 PVSDkuJBUxghqkgJRs+lnkijvyy1ONAvQUe7J5Mog9XRvGonmC+4J2iU1sXYOt32kWHp4
	 1mUikv5M1yJ4lznF7aJ3ABk2SbcAkiJ2kpwdv4bM1Bh6OtvKqMEXwakr1Tco0gy2mKvYi
	 dtjTtKSWeLXcyGf2zccoaHT+xl5R5+PGjsyVG/6niqiuwtIEFtXwBAPJcNfJoI/Oy1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NpWmdhT9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C855606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 22:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C855606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NpWmdhT9
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso12151497b3.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 15:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792621007; cv=none;
        d=google.com; s=arc-20260327;
        b=Lm9TBH1jMtpVqBSx0n/gNpQYa29T6G4zddeSVQwTn3ynv4XtaeZOHJFncIka4Temwj
         +xK6++1unpZqM+Ro6SWVtk+/TCs1tvBPqR6ViCd97xWqBsPC7Kg4ZtTk21Xxpwbbcz9U
         oyzXjJGefvUiQ4GbAPW9MuTJg4HseSE8I52XHguj7QIdoJoroekGjSHvozrkWiMC/Rld
         jSpxGXxpMk1JFDiBF5lsYAmhnZE2dM6GyKqq0He0PT+8Lstiz39SMzGZla418TmGI1oJ
         kW8Jt/+IgJ1hKdxnRuoKVKPORi5ey0hiqROuN/LDiOeHyv+iDLhGB8gjvjYuvG3tGrBE
         7wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        fh=osfj9leewLfc4MqIYaUjfG4KfpRUNqFnByXZRUnRoVs=;
        b=WRc2esDR263III/rAizixcXYXTV6wEhj4BSdtH7/jMp/bEgQ+WxoIkZySLM2/aqUdB
         Dgyy69pAEQBcW6Bf+p8rqAH3U4KJh16MSWsHSljzqmxxREPSI0jOXrg9WP89oHNPiqAZ
         wDo3mpvIjB+ymYyqDdBHejsj8oF96G+UGqobgWnzlHhGHvndZXkZ2OYDNndhOEKWFaNf
         xY/O/Pb0Mvs86CAoqww7s+8mrWTPXVxJTmBhpsG0RqwoYSJjDxuUaezfTMqgPtuIv57u
         i02dpZsv5TaZYLi03/YbPOlCKLvlPZQCsLDWij9q0lc1V0nnvYUM7LdIr0zhv66H85XE
         CO5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792621007; x=1793225807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        b=NpWmdhT9Rkvn/rJZ82MI5sql9POxdiX1sIQUet7PlqZhaRAqlKZ8WskxNOABbEaOHd
         VzCcw6x0kAJAvHOo+B8KfmvJ2GUgAlCFQkq7vJ6U59Yvhz6qe8G57onLnXyTTn7+wvtp
         vfexTS6QbK8CGEuZaVkoSmImOzGxy5BMzTW2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792621007; x=1793225807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        b=c13x8X3MgjtJJGGVUOHdy/AYwIXg5xy8R+8HJtCLPqrEXu3PaFAzzotjBgJxN3QEuo
         AHxx7xekypq+vxPc1GwmGJoJqRhh8teejyMNB62ts86Y+HXQG6Alm/miISE5ZS+3FhwL
         zoxa15jYkLNZiL7dBWPlniGOxq9vYatLBQE+cNMgMNCnJe9Tk3KQJMA4onnYVGfAUsyu
         zAJz8k+EL+bl5aH5kbZLcLZs4yD1HeuCtopbwJTeBW7x5iyF0E3NW7g4BFyletbx3w/L
         /wCAmo4qt6g/BTEA5+dl4vQDz5tdvn0IKeLfkJcHSGyT50UOVF2osdzJRK1Gj8Hd2NSw
         Gidg==
X-Gm-Message-State: AFq9FYIdv2yqKmFGYZqeAt6f7uM+YA3iZmH0LH8sFX2uB3xhD2uBPGwE
	zq7IOdgWsdnY6G+xdjjgKgt9eiCzmybD88A0G0enFXOqIN2Xjbuw9cYKNghjfZOjYMTzPER56Pd
	KE3JXCtKH/E1XXXz0m3haOlhkjY1QlvUxPVE3zSTdvh4xNhTPJlTorw==
X-Gm-Gg: AYBFou21O/0SLEH/h2bpXUDXFgwiSjPc4X3qVxmsDVr5xVHhS9pAJn6FFFEitBQJuoC
	Zg5gsK0lZ053e5KNCpYQuEsUpGtITvLjNIxX9UOugz0e/QSZuc3DkQbsbLq/Ewb9ik0tcdGgfd4
	Z+ZY0QZ6pyDiVCREADC1cTMoKzq4y+bZRDDoiqH0LJZ47UtKRnbfraeo5Irfx1gx9aTJy/R82+6
	/h9C+VgoouCkdJv5jR1IDcFdnDLnj0TJiN5w7SbDN2ahVJ4RBav3GqixXW+MZ4jCP4vpBDETcsp
	oc+lrATG2IsELWpofX2lVBUZXBrnTksZRWe6AsgwCQubzT64p2gqeky/PHi27PGPXn4iGo9TzA6
	EPCttfbAcddnGLW0IK9NgECiYbF8QImDC3GnCazuQ4iQyYsSYiprAjZlYs5Knht2W/g==
X-Received: by 2002:a05:690e:14ca:b0:679:938d:a5e1 with SMTP id
 956f58d0204a3-67a0e5d5717mr1652923d50.106.1792621007076; Wed, 21 Oct 2026
 15:16:47 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
 <20261019-send-upstream-v6-3-cb9ba4b3d6fa@chromium.org> <sashiko-outbox-178136@kernel.org>
In-Reply-To: <sashiko-outbox-178136@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 21 Oct 2026 15:16:36 -0700
X-Gm-Features: AclHuK97y_1C_fXZ7yRJHnp3ya3ECqu5ReTQG8sTLOF0eRq_fLLRwG53TU5NjZo
Message-ID: <CAEe3GZGsfB+zi3Qf6buPWP_3hkw9bsd4mB=PtBrp4irtM5Z0zA@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] HID: spi-hid: multi-value sysfs attributes and missing ABI docume=
ntation
> --
>
> commit 4c66f3d16c395b79d0997b29357fb80b5a6f2708
> Author: Angela Czubak <acz@semihalf.com>
>
> HID: spi-hid: add transport driver skeleton for HID over SPI bus
>
> This commit creates the spi-hid directory with its Kconfig and Makefile, =
and
> adds the initial core driver skeleton including basic device structures,
> sysfs attributes, and probe/remove functions.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > new file mode 100644
> > index 0000000000000..02a7608c4b882
> > --- /dev/null
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> > @@ -0,0 +1,213 @@
>
> [ ... ]
>
> > +static ssize_t bus_error_count_show(struct device *dev,
> > +                                 struct device_attribute *attr, char *=
buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u (%d)\n",
> > +                       shid->bus_error_count, shid->bus_last_error);
> > +}
> > +static DEVICE_ATTR_RO(bus_error_count);
> > +
> > +static ssize_t regulator_error_count_show(struct device *dev,
> > +                                       struct device_attribute *attr,
> > +                                       char *buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u (%d)\n",
> > +                       shid->regulator_error_count,
> > +                       shid->regulator_last_error);
> > +}
> > +static DEVICE_ATTR_RO(regulator_error_count);
> > +
> > +static ssize_t device_initiated_reset_count_show(struct device *dev,
> > +                                              struct device_attribute =
*attr,
> > +                                              char *buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u\n", shid->dir_count);
> > +}
> > +static DEVICE_ATTR_RO(device_initiated_reset_count);
> > +
> > +static struct attribute *spi_hid_attrs[] =3D {
> > +     &dev_attr_bus_error_count.attr,
> > +     &dev_attr_regulator_error_count.attr,
> > +     &dev_attr_device_initiated_reset_count.attr,
> > +     NULL    /* Terminator */
> > +};
> > +
> > +static const struct attribute_group spi_hid_group =3D {
> > +     .attrs =3D spi_hid_attrs,
> > +};
> > +
> > +const struct attribute_group *spi_hid_groups[] =3D {
> > +     &spi_hid_group,
> > +     NULL
> > +};
> > +EXPORT_SYMBOL_GPL(spi_hid_groups);
>
> [Severity: Low]
> In drivers/hid/spi-hid/spi-hid-core.c, bus_error_count_show() and
> regulator_error_count_show() format both an unsigned error count and a si=
gned
> last error code in parentheses ("%u (%d)\n") into a single sysfs file whe=
n
> userspace reads bus_error_count or regulator_error_count via spi_hid_grou=
ps
> (which is attached to .dev_groups in the later ACPI and Device Tree suppo=
rt
> commits in this series).
>
> Per Documentation/filesystems/sysfs.rst, sysfs attributes should export o=
ne
> value per file without custom formatting or mixing types, and new sysfs
> attributes should be documented in Documentation/ABI/.
>
> Should bus_last_error and regulator_last_error be split into separate sys=
fs
> attributes (or moved to debugfs), and should Documentation/ABI/ entries b=
e
> added for the attributes in spi_hid_attrs?

Will drop these attributes in v7. Already reported via dev_err() and
tracepoints.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-send-ups=
tream-v6-0-cb9ba4b3d6fa@chromium.org?part=3D3
