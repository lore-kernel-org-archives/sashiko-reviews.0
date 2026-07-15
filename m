Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A413777E
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097443; cv=pass; b=qF/FcC3KM5N46304WsTSHN2aEJHUH/IPp/o5H4Lj4N6EXs5qQPUaZwJ+H7SU7P6+Gu2zzBmk55jcsiGwUMHFhGEOVVVOKFO9mWaOAFYPZJ1JQ/zSYuJca+70CJin1hWdfCB25phyz338oyv8yWPWJBJYMYB1ZylGj1QqoGLcNrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097443; c=relaxed/simple;
	bh=A8eE6gYBEyawqXzPiLbSmLaGyQiPySXEY+8GIYReE+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRPKBRpPK8OzNi1gzTzxIzh/2Kb9kWXp5S88sxj1LIyZ0EBlFj3823LIiyZgq1RY9YjkWcG04AAkgv9JepDXkifSipLS09TBITSMSNOL+9Y0clUHYoz4OiVbouV27teCH8H/qWciu8ZTN6EXC1oh4hH9h0ZNddhDVHvrV2B5kOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK2+6NCY; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK2+6NCY"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59cd803792aso3095043e0c.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 23:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784097441; cv=none;
        d=google.com; s=arc-20260327;
        b=IXT51tOaK4M6odd4FKueFOJJdLRTFzdI8S6v8qRb16hDt/E5oGaJdoKMS5MoZ0myVN
         DGu/hxmeLbPAvReBrsLGuTXs6qA4FntBWcrgRmGUirRgnE2OGCWQNHJCkGZHBPUpgXNO
         WFIhoFhN0n8RVHJXP0R8I3hJp/NDWUrTPg+IZIgyFct0JRY2dOIgluZMZoPs3wbTDcRo
         Jx7MRcbWzkMjCRUk26C7svjUasvqCb9BkHhZQU2/IAAWP+uHYryAGMdQuzhr86oM7E7E
         +dBabMH7oaEvQvj1PA1fZmM5m1l8uKAU6xLHEDAKySfG97Ts3MaFaYJYLrm0w/ZOL6Ko
         B2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8eE6gYBEyawqXzPiLbSmLaGyQiPySXEY+8GIYReE+E=;
        fh=AaxZKNV5skmkPVnBU2FJt2glePcVIJDkZfM4MVXEeHc=;
        b=ipA6qb5E2OjQvsLtkOCZMEs9K1qIPIw14Ng0byX1RF6rXfQhM74SW0AE2mokxwzOWa
         rbFKk1AxID4ocjmFWAd7DRqrHqYNO/3oaKEtVgX91Kymp8R2t9J3hoq7lJGk9TSoNr8e
         /eHryCtPh4WBelvSDp6SmrAM2mXI7V48kCN4BEAvBPfDL0x4HrDwznXSUZyyfvMe3q5i
         cJ5lL4+YPuXoV6aGd9w9lru32FH06qck6+1A9OJGSH7kD6g4u8LfF0R4dnQ4eyZDaWzb
         ykBPJ9xl0anwWk33C4XxnFrmSbli82/OKTJLOSZ3P0bA+l3Dk08va5r+/2UdHG5voVNI
         3WBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784097441; x=1784702241; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8eE6gYBEyawqXzPiLbSmLaGyQiPySXEY+8GIYReE+E=;
        b=jK2+6NCYzr7qYK9Nzu5vWdnVWO0WRL//hSHlWEq7n+xKW6tVyjwHj+26aFm27g0ZJ7
         Zpeb9BYWPap/vJtgWilc+4DFiBxOKofTk1Z+xBJZ4YpG8eM/bXl9jOA2g3LaFClNE6Fo
         WYr5XRlel02XJKMAug3v6Tl6jGAO/YhIW+ulGzbBJ/ozfp5kBO1vYs6F2R3cTUzUcQTM
         nIK5Pr2FHKWW5zCULLN8Bg7vBENos3UeR8gA8p4VbXkh4k39OSaOzm04YBk3qF5//A8k
         vkTDI9835R7duslO8+rfk20rEFA52T7bII+Jbruue6HP/J+FvIiU7NirVvedXeEjE+dv
         5Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784097441; x=1784702241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8eE6gYBEyawqXzPiLbSmLaGyQiPySXEY+8GIYReE+E=;
        b=S6boHF6N3m0CqsPX8gEYCqoFd9j842A7nNe9X/7wEj8yXOJoy627DV4LYLALuTyTUX
         7PtR3dSUiaS1P0SUKZ/694JuOGFbPG21Hc8EZfFVzN3mz5PCuA2lTV+agfuphlb3A01Q
         8N3bGi/7z9omy9V2v/Dgg2cMj3uiUDpXtxIwzIEJdMBNWuXRX5QVBd2G4bQcmAv0mGH4
         xTWCh9/UFiilrO7L5+AuxNIuJeBmf5Ri1TVXbhel47cMBd+fnIoSC53M6evyramKdknm
         KuJNnxWsRaTPDzkohvMc0QcEJ6H9uqf8oT4jk+IvIiJk7u4Yg1p7Fw3gviUz09aXtURy
         gO9w==
X-Gm-Message-State: AOJu0YySSMEK4mj0jITGVNCNkfr3a6ccY4Duil/rxmCxBM67SP7a20V7
	VNWArsomFLW/91Omoc/vAi6r1GYqIco6Z1uFH9RLx1E79sUmDOVW4a87Z6wQ5YizKiBXMbx1pIG
	dW78g1bv0H2EYpo5U/Zilv6jV+7WtE8g=
X-Gm-Gg: AfdE7cmv7rB29HcAiYHfPvVK6hizw0HZwPF753hdS2e3ZY1DJOdyDejxTY7dPVVlAHC
	QCwOrEkCUanTJNCYnYiR4Td0qlNNpnQgGI0mgiabzZ6JOFK22vNPyFJmm8SeyNf1k+RrC2IC4UQ
	Kxf+Vj4HRNgwDgIrRZqPqcfKfRjZI5lk9ExRW/LUR9whAXp7PyRQo01LDxeDXHRQ0T4dfijtU2Q
	6WvEGWYgRDQTX/GpvfVhcmNHtLnE+XJyG+yPTmrppezECwFH7cwH9ZGFMMHR4ODwefni6af
X-Received: by 2002:a05:6102:3e0a:b0:631:2624:e5e7 with SMTP id
 ada2fe7eead31-745874d565emr3118969137.14.1784097441003; Tue, 14 Jul 2026
 23:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714120052.255085-1-chlgustn3171@gmail.com>
 <20260714121819.5FCC91F00A3A@smtp.kernel.org> <CAO2ma08Pap6PZKUV7iEpvu11zaKrzMK-cgBLBYKJEEfGH+0=1g@mail.gmail.com>
 <CAO2ma095Hu1kOTMds9yHqTvwde8Gu+GWOLUst5U2eCnSffkm=g@mail.gmail.com> <alcCgHzV730RKPmR@google.com>
In-Reply-To: <alcCgHzV730RKPmR@google.com>
From: chlgustn3171 <chlgustn3171@gmail.com>
Date: Wed, 15 Jul 2026 15:37:09 +0900
X-Gm-Features: AUfX_mwjZd2YMIMMrbzMJbJRc0izxkbpQ8dAx4mNcU239rK5k2q8oyfHjEkK-zQ
Message-ID: <CAO2ma09gV+kR5xY_MqVo5NhEEyD2vkZO7VnuE_bAQRYN1DiP7A@mail.gmail.com>
Subject: Re: [PATCH] HID: input: allocate input_dev name/phys/uniq using hid
 device devres
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the detailed explanation on devres lifecycle and device refcount=
ing.

I agree the patch is unnecessary, and that the syzbot trace is likely
a false positive or external memory corruption. I will drop this
patch.

Thanks again for the review.

Regards, Hyeonsu


On Wed, Jul 15, 2026 at 2:57=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi,
>
> On Tue, Jul 14, 2026 at 10:39:09PM +0900, chlgustn3171 wrote:
> > Adding maintainers and mailing list to CC. Sorry for the omission.
> >
> > On Tue, Jul 14, 2026 at 10:33=E2=80=AFPM chlgustn3171 <chlgustn3171@gma=
il.com> wrote:
> > >
> > > On Tue, Jul 14, 2026 at 9:18=E2=80=AFPM sashiko-bot wrote:
> > > > [Severity: High]
> > > > If a userspace process holds an open file descriptor for the evdev =
node
> > > > (/dev/input/eventX), the input_dev will outlive the parent hid->dev=
.
> > > > When the HID device is unbound, devres will free these strings.
> > > >
> > > > Can this cause a use-after-free when userspace later queries the
> > > > name, phys, or uniq strings via ioctl (e.g., EVIOCGNAME)?
> > >
> > > Thanks for the review.
> > >
> > > Using &hid->dev here is intentional.
> > > Using the input device for devm-managed input_dev strings is
> > > problematic; see CVE-2023-53454, where the allocation was moved to th=
e
> > > HID device because the input device unregister path may still use the
> > > name for uevents.
>
> Thank you for the patch. However, I do not believe it fixes anything, as
> moving to devres will not extend (and may even shorten) life time of
> name, phys and uniq. Normally they are character array members of HID
> device, and HID device continues existing past drivers disconnecting
> from it. OTOH devres-controlled resources will get freed when driver
> unbinds from a device.
>
> Additionally, HID devices are parents of input devices, and should stick
> around because input devices hold references to their parents until
> device_del() is called in input_unregister_device(). However before that
> it will disconnect this input device from all the handlers, including
> evdev, evdev will mark the device as !exist and evdev ioctl will not
> attempt to process ioctls for such device.
>
> I however am not sure why we see this syzkaller report. Maybe there is
> memory corruption somewhere or maybe syzkaller itself gets confused when
> tracing numerous allocations.
>
> Thanks.
>
> --
> Dmitry
