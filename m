Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815622;
	b=FXRsWJ1EeWZmk5M6DMjlft861lzDwVWfv9WiyR4g0ayQBzgsJsa4/c1aVzzazjJ4zWVC
	 HRO8HFQED3I3N5yQUGFlvbVEjlEsfwfABFGmTFvbXsEi8wp04ztGz2tgzWzVO2rRvQkcZ
	 hELR3mUPaIed66bxR5jdAspb1Uby1qr2OJwGSPZerknbrrQzECAQHUpTeI91SKNZzOpKk
	 r0j6U88DUOPAa3CxpLqt+1u0TzMSDqT/zdu8z8xIo+JlqSw8ayRDGHqX+WPi0T8C/AFJn
	 wiUEEB35a5awO9+pbOQfrB01Zot3kvY9uDuqm0iyVnnDA+gN8XBmM0nQw3DXzvk8FFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
	b=YlAtWK/hQQjSY7bR/bwUcJJnStHTGGr9pe9Js8f66k4YcHZA/SVybAjAOawGeHM6BK3Y
	 NCes38FYKCGo0lGQATBjTDhboX39gswI3N83jnuxNYaHXxsp+OZE06MNy0jZqsVGoMLnN
	 WMtkSDTILVIz00lPBXQIMdN+pkP7cjxHcnoZ7laRtMHEpkV7PM49atVL58gDVHGOTzrvA
	 8Wj7eEWnd786IdjkVLEARENC7ZjvW9axoQV9eeb+ENK68DzljPNl5e9MLrJslNiWbvXSE
	 muZGwtTyDFl27RF2Guq72dVJ5ws7XkxD3OXwW7ixuq6kdCJUnK2qsQjorZ/N4+UKniw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgPcBU7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF5606EEB6
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEAF5606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgPcBU7t
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1486053eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 10:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815621; cv=none;
        d=google.com; s=arc-20260327;
        b=WOeD6eoB5rpbIVZ0e9W0YJs9TKO4YKllyJ8X/hSKrUQCsBXIncHy5lxRSMN+hJMCHu
         voKDIA591bzl8cllPdSt7C887nYWDoAbM5tCURb0MlIaYJVsjko9HdEZLwj2oObNn30e
         UWeDzPyxyEEMzyJdpAVXfUacbQ2HUABt1jTGq7Gv8Y++taZOUZkrhBg6FG+KKxGszHkM
         G2r2vXPH7OpVsGjwGn7LvHcJWTTteNPIXWq3JWhKGnhGsXKqjN42lsxWd+qK54jbNgxn
         juegrwKwDetf9dyiu+qRq1PX/Gf6yGHVTfLotAqzUpc3LCpV+KeKAE//CYXEKmjEaA/J
         TPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        fh=EtSRKTdzBJlCJWD/dsrLRrD1Ar7bBWD8vS87NoUxsRc=;
        b=S7DAVnCGau3qwoJZzn/jVBKQiVuwRnnKDp5LMQMX4LmC035Ep6M3SedCTPeuY804/M
         /BenNS5DAXg6ApUAJIo/Vof/A8S8qR0DmPdDpJ4pfhzULm5o7Xlhb7g/3nCmqTwtJOtA
         IPMHgVtcWTcljksrvbtPNMjBHqajfQOoILS7e3/rJu4+IVNLMxEhoQg0P+ukMQZ4Wq4a
         cXI21I/Lf5XqOzUfaYAARyKYmL5FtEHCiKuwlIRFtup4MYEYRb42sjTtfe6UiTkiCdVE
         EVlz4EuUY5ORsXhv4CKervVxE6hzZt2ZyazCeDZNwzvSDZeu6gk+Kzdz5mdyPlQtLEmN
         nWIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815621; x=1794420421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=mgPcBU7tWAz3uQrFOVp/FZ0ySbSKapb6kRRzhfSuTscXH+vd3NUIpj5EQOFiZGMZcB
         0x/NP/9LoZy4x98dZBHJ16pvBj1hM++Pve4k3xgmLoKsBL9S7qW+Cp/Q3tsOjVc4tH/X
         y3Ru7i82ISv/4v1SBvei0aUwzQHj4d4wtdfmscvo6Q+62ewl6wD34XT+co8gbSJYOGuz
         bgEFAKa5u3hEjqSgGUs/hgLAT7Nb8VZxfG3VxTKnp04QCahpXBlZ/jtPB9KhziGUTKwq
         hW18E6mB4Mehb13ZqpQvqCLihNa2DhZNJ74tn5Cwe6djeaT9ccbLy5hXpKWK3ysC5GbG
         iVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815621; x=1794420421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=awZ/HWr8RT3PriA21Hhk3fxc17V5KrqGHnCcp18vi/lG0pg2zLBJI4pQHaKbL/qD0C
         8ElX9kDPIOUy0fdDcMhv8aXaNhSC9ZI9V3d/XDVLU6zuap8gASKcNwULkgsqYeFTu4PV
         g+AHqc51aQsNU8kI8FEntXXeNiuAhsGjrh4MU6F+BdQbRNv4YAU7DMHhf7EiRC3/OWdU
         Acnl7VXP093dUbe/CA01zx9AYoM1tG7xu2swz1RUrph0uK5LmFSk5JvM9epsfxO+SCG7
         0gXCDUfShPYDvEEtDIf/MdjxWutNOoD0N8gXP4hqg0B7owX2G25IZPzTTFqOFqfrNbYN
         DyFg==
X-Gm-Message-State: APuU4Z8Yr8QzgOoMZU7w1xWZEkHxmbLx1hE3wJOeYdmsy8xUKRyOy60U
	RCrTjeeonUoegwvVEv/0Fsvky4O96HZiEeU8H/IEuBXEGa/1Z5fVwW3yKFDClSfsIcZO1vuT6FH
	3GxGh4OOL3gFDUyhJ0aVUTnml/6sk9DY=
X-Gm-Gg: AYBFou1MWmNPDxQ7MI/mp8ikqK0iGArLAqJMaIjSLIeu7JnEz7io14SJ8ccxQNw1W5G
	ijgt1dJ2OZHSUffvEe1Z4Id+72xHSMPssKqorpfc/wW+NIvM6GGpqPzCBQSrEsvjMvywygUKLPh
	Y2OVXxdTikfTs5NP/7HEenNia/hoG4ABofv05WQk3ADSL0C27yLasGCn8JthqaYwRkgOLLmY92l
	jKXFbZPrzeSWQQSpKEo09kF0u7cYwGla/GVmePAyId6XUtCs5rtmZEtbSsiso93BohKbSmQb5Ly
	ZqQxz+91fRyooVidqZ9u29ETOZOo7n5BYaN3GbVmtF9TRi8Uu7QWpZ2oWrbamK08hs/BfzTW1xs
	B3bKP2f4IxsnIYzaZb61XWaiYjyEaTrJ9R4UCySlxkrqSh2Af1BIrBQ3QoZ8r2UJJQFNkaw==
X-Received: by 2002:a05:693c:4153:20b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36a4236903fmr25768336eec.9.1793815620547; Wed, 04 Nov 2026
 10:07:00 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027114634.79706-1-clamor95@gmail.com> <20261027114634.79706-5-clamor95@gmail.com>
 <sashiko-outbox-186485@kernel.org> <20261104175537.GD1650678@google.com>
In-Reply-To: <20261104175537.GD1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 20:06:48 +0200
X-Gm-Features: AclHuK-dTrm5_ju5-WTFNvPOfO0V7jPIoIavoQPE4CCcI-4nnKW3q4poZzZ3CXo
Message-ID: <CAPVz0n19Ax1LBcD1XrnCHZmB=dRT419ggybrKCJjeXRUC_VnZQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mfd: max8907: Convert to use device managed
 poweroff handler
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:55=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 27 Oct 2026, sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mfd: max8907: max8907_i2c_probe() drops maxim,system-power-con=
troller check
>
> Did this get an answer?
>

There are no in kernel users of this property and pmic in general, and
iirc never were. Pmic was designed for Nvidia Tegra devices. I have a
few devices with this pmic and I am planning to upstarem them so
driver is not abandoned. Obviously system-power-controller will be
used in those new trees. The maxim,system-power-controller check can
be dropped I suppose.

> > commit 5deb6448298f2829c11e1c8af86067bd08a79d7f
> > Author: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > mfd: max8907: Convert to use device managed poweroff handler
> >
> > This commit replaces the global pm_power_off assignment in the max8907
> > MFD driver with devm_register_power_off_handler().
> >
> > > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > > index 2a38e00a10c3b..e282dd82ece69 100644
> > > --- a/drivers/mfd/max8907.c
> > > +++ b/drivers/mfd/max8907.c
> >
> > [ ... ]
> >
> > > @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i=
2c)
> > >     struct device *dev =3D &i2c->dev;
> > >     struct max8907 *max8907;
> > >     int ret;
> > > -   bool pm_off =3D of_property_read_bool(dev->of_node,
> > > -                                   "maxim,system-power-controller");
> > >
> > >     max8907 =3D devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
> > >     if (!max8907)
> > > @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *=
i2c)
> > >     if (ret)
> > >             return dev_err_probe(dev, ret, "Failed to add MFD devices=
\n");
> > >
> > > -   if (pm_off && !pm_power_off) {
> > > -           max8907_pm_off =3D max8907;
> > > -           pm_power_off =3D max8907_power_off;
> > > +   if (of_device_is_system_power_controller(dev->of_node)) {
> > > +           ret =3D devm_register_power_off_handler(dev, max8907_powe=
r_off, max8907);
> > > +           if (ret)
> > > +                   return dev_err_probe(dev, ret, "failed to registe=
r power-off handler\n");
> > >     }
> >
> > [Severity: High]
> > Does replacing the maxim,system-power-controller property check with on=
ly
> > of_device_is_system_power_controller() break system power-off on existi=
ng
> > DTBs?
> >
> > In include/linux/of.h, of_device_is_system_power_controller() only chec=
ks
> > for the unprefixed property:
> >
> > static inline bool of_device_is_system_power_controller(const struct de=
vice_node *np)
> > {
> >       return of_property_read_bool(np, "system-power-controller");
> > }
> >
> > In Documentation/devicetree/bindings/regulator/maxim,max8907.yaml (adde=
d in
> > commit c254fcc966ae), maxim,system-power-controller is still documented=
 as a
> > deprecated property for backward compatibility alongside
> > system-power-controller:
> >
> >   maxim,system-power-controller:
> >     type: boolean
> >     deprecated: true
> >     description:
> >       Telling whether or not this PMIC is controlling the system power.
> >
> >   system-power-controller: true
> >
> > Should max8907_i2c_probe() check both
> > of_device_is_system_power_controller(dev->of_node) and
> > of_property_read_bool(dev->of_node, "maxim,system-power-controller") so
> > existing DTBs using the vendor-prefixed property continue to register t=
he
> > power-off handler?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.=
79706-1-clamor95@gmail.com?part=3D4
>
> --
> Lee Jones
