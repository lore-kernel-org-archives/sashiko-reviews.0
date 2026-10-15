Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D883F4DC7
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 22:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102694; cv=pass; b=Nl0ICRFyPKKUbKyU8pNrovQkOeNx/xOCTMHVLVFHsJuI897H3790VWD3pTYkQxL0HS7GzaJr8PjRg9D0pKO4UDcCQHu0Xr6R3iwtux0eiiFTf0vYl1ECizsSM1Ac9ZYQ+/zWtATMnPhRPswSf2d4KkjhRU0vLdDxwK+OvD/wB7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102694; c=relaxed/simple;
	bh=tnXbwiJVAR+sXXQiFOdDekhe/PSPH9YMoHLa79Fwqro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=aphfXMGEbII4XvJGERfzrGPrb1GMNtfmv02CoDt2rQFSgLxLjutgWlDaKItFgH98eN/p9Z5qNZQDnSQDh2/ZZfLHpMwmL2/yqI2CIoW6jTfAyXcHYI5hLntbQlClGxj0FET4n+4HYVBMBYl4oc0R+5R3rQI+XNZ1uzwquo+uBio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzkkGJSk; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzkkGJSk"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a808f09021so20211121fa.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102691; cv=none;
        d=google.com; s=arc-20260327;
        b=dtncIofN4/OBgA+Ya/0ZhrUdArXWf0Das2heoUyVqnOFFHH7endxZpBXvg96ID02p5
         nTBQ77YfEtDqatkralTGqxeTE3kqxjuT3ZBJORnkU4HZ2PVkqSH90a4dg9YGNbgwL0/j
         +0uEICkdnnJsn0vhY/YGbSOppy6YVulrUWSYGqxIwtxlYyuqe4Qhzv/74ohu4oA0oQGh
         UgTiWyxZqaoj9lXbwSnQeEbG5T6FdOCOr9CpiMMrzWXkL/dzv+52dilLQwTU0fbvWbdf
         BAEblvoPT6hlUiq8Yv6SpXmg2YCyutPMB3SQIrU570kaG+l4Bs9OUpjWXuWwdxHuVdoi
         HMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JxythEUSv+YmEJAfBEuFblYrHTHwYsJ/ZoCDzZLeYsA=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=n8OJ2utTD+3qlv0f5s6lLeXq+w7P4N46iuMRt2cAMiNxjUV14VhbwTEslm98NZpcBK
         FygdZ6tdEDot8A02Cvj7ySqJJREvFMUv9NjKLUe1JRl2fODxTvXyaeqvUADbeG3yEPfB
         YBdlq9fQtdj7DEwdRjVTkxexNaRVsrzA+WJh9ssdW+bR+1ieHcpA6BkVI8rAnO0slPis
         hyM7uX8szUNkb1zQ/DEnSTDv7phpwU+QmTzMu4ZRVONGZFH0Q+N79pzEa7lj2VepVIQf
         DFZhnZz/DQOWAW1USC7tOygPEv6cKc7+5KzCiQVdx8/HOC/q06RLjEJTEESC6Sd6r78x
         K1nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792102691; x=1792707491; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxythEUSv+YmEJAfBEuFblYrHTHwYsJ/ZoCDzZLeYsA=;
        b=hzkkGJSkHE6SbIvp+52UQ2eUO19lySTVtS3PyCnYRIdex8SnIqnNoNnhpakhfM+cev
         OHobBUgYyzfZA/4fYVUNl5vvEM3dxWWM/gd6GO5hm378w/Y/2y6AzFXXxON3UZx6LUKD
         EIGawFJ6Voim+W0vxiCWlUGVpsF73gWZKhC9ZPVI7j2UGoWcHbt/YL0iZYlrPkMupznF
         ZpOmafAXOQLOCQ35ML+ALAROx3kIW0pIsRV2vn2rzu+l8mJmzTSWxXAPRzyLqEmJMha7
         S64D1rmIWa+0QVIBYQ6alpKJkOWQIgx2c8WhJjso3m5JxoqF9CLDzApUn/UzPeo5oumd
         RXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102691; x=1792707491;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxythEUSv+YmEJAfBEuFblYrHTHwYsJ/ZoCDzZLeYsA=;
        b=yX5i+pw6xySu/9ytCT0lqKtb+cp+nP4CxdTpSOyh/zY4cFINrGTtpxDsJWNQ3n6X70
         qBiYaoMr622HlLmG/dgCmUp30vEcT/Nt9Gz4pKPEfO1BKJMz6/TMZZ7GsJu2J5VUN0Nj
         o0ohX/ttTegcrlFt0VpI9Vy4RUjqO+GFb1PpRKoHZJKAUTtQwNb5WqFqpGlPd/aVx6md
         D/EEDn+KUFYTnahcUoiPw5oVtg8wgjR3pWwnC7YAf4zlBR446RhFUCxRRbW0sZ+sipHG
         y2kAi29nxa6o7wjGhen9zqYHD0vmc2UJNrAbe3S4UM19tkQXh/XEUQbzwMV63fU2RvG4
         4YHQ==
X-Gm-Message-State: AFq9FYKZi6aljw7otrng2LSjC5wjjI3+71uuplfzIlQ9JcrZmQqaZKUw
	CZCEfSpdZHqvM63UHTPJcTb9QRvwwsGlmQC6Kt70tv5pxQ3CRo0CWOcv7tH3V19gSP5C3YJgT//
	i5khx1HE5GXzYz51Wyjv4yXTS3KTjaFU8yKVvA0tZkQ==
X-Gm-Gg: AYBFou03z49pF0ihjhfCLdhwEvOdtO3p24r8E5lqi2pLmK5JGSaNs4NF1RZPi7PJN6L
	RY7Yk48vbTzCzxYB6/hZIWyMKMivuQ6wX8WOFhG+JoLMN3M0JCSpF16l4vzI1EZ+7Q77QmmyN6j
	jHpREydslLlmDauntgr3Vfz1xPPhqc+rnPJV6+LNZqnXxh5wZ8ROLTQcOv0n62s0oeJrs5ANPnA
	v8waPHyzOKWYMKccCmBZ09fCUYvWGn4dmacoptipUW+YUo76CvkPyWHZn8XsxQIOpTql8uJbmrp
	93yv5UwswkkZ8VqBp5aBPOtd5hRoySvVmK6o5umL+AvaSjCvucJbqGEbsiWdB/DrHmKEo6Ww9Pt
	skZcDz1FObfw0OBlZQw/RYE5UZSlJJJQEoKxh5xSCrf8Hmi0/caerPhou8pczPdPIH6ij
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr51644251fa.3.1792102691195; Thu, 15 Oct 2026
 15:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015220126.102766-3-sanjay.govind9@gmail.com> <sashiko-outbox-173441@kernel.org>
In-Reply-To: <sashiko-outbox-173441@kernel.org>
From: Sanjay Govind <sanjay.govind9@gmail.com>
Date: Fri, 16 Oct 2026 11:17:59 +1300
X-Gm-Features: AclHuK9BXbzxpydIsuzw15HevhHp2BKO5guA6szAc3XSXYAzmR3chPFhWn-7vbw
Message-ID: <CALQgdA28qTxuV+TD_u6FuqOXSh8qDHyA-xjjcf8tQJMxKPHerg@mail.gmail.com>
Subject: Re: [PATCH v9] xpad: Overhaul device data for wireless devices
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] input: data race on x360w pad metadata between URB completion and=
 workqueue
> --
>
> commit 623a5a67bf1fb99bf182903ceaa0fbfb964bfc7b
> Author: Sanjay Govind <sanjay.govind9@gmail.com>
>
> xpad: Overhaul device data for wireless devices
>
> This commit updates Xbox 360 wireless controllers to extract and use vend=
or
> IDs, subtypes, and product IDs from link and capability reports. It delay=
s
> creating the input device until 500ms after the pad is reported present t=
o
> ensure this information is available.
>
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpa=
d.c
> > index feb8f368f834e..bcad597b29b4a 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
>
> [ ... ]
>
> > @@ -995,18 +1035,98 @@ static void xpad_presence_work(struct work_struc=
t *work)
> > -static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, un=
signed char *data)
> > +static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, un=
signed char *data, u32 len)
> >  {
> >       struct input_dev *dev;
> >       bool present;
> > +     u16 parsed_vid;
> >
> >       /* Presence change */
> >       if (data[0] & 0x08) {
> >               present =3D (data[1] & 0x80) !=3D 0;
> >
> > -             if (xpad->pad_present !=3D present) {
> > +             if (xpad->pad_present && !present) {
> > +                     /* Forget everything we learned about the old pad=
 */
> > +                     WRITE_ONCE(xpad->pad_gen, xpad->pad_gen + 1);
> > +                     xpad->sub_type =3D 0;
> > +                     xpad->flags =3D 0;
> > +                     xpad->wireless_vid =3D 0;
> > +                     xpad->wireless_pid =3D 0;
> > +                     xpad->wireless_version =3D 0;
>
> [Severity: Low]
> Can these pad metadata fields race with xpad_init_input() during device
> initialization?
>
> The URB completion handler xpad360w_process_packet() runs asynchronously =
in
> softirq context and modifies these fields without holding any synchroniza=
tion
> primitive.
>
> [ ... ]
>
> > @@ -1943,8 +2088,60 @@ static int xpad_init_input(struct usb_xpad *xpad=
)
> >       usb_to_input_id(xpad->udev, &input_dev->id);
> >
> >       if (xpad->xtype =3D=3D XTYPE_XBOX360W) {
> > -             /* x360w controllers and the receiver have different ids =
*/
> > -             input_dev->id.product =3D 0x02a1;
> > +             if (xpad->wireless_vid)
> > +                     input_dev->id.vendor =3D xpad->wireless_vid;
> > +             if (xpad->wireless_pid)
> > +                     input_dev->id.product =3D xpad->wireless_pid;
>
> [Severity: Low]
> Since the delayed xpad_presence_work can execute xpad_init_input() on ano=
ther
> CPU concurrently with a disconnect packet or late capabilities report, co=
uld
> this read torn, zeroed, or partially updated device identification data?
>
> The 500ms delay defers the work, but does not serialize it against subseq=
uent
> URB completions. This might cause the input device to be momentarily
> registered with an incorrect ID (e.g., 0000:0000) or name before the
> subsequent work iteration unregisters it.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015220126.10=
2766-3-sanjay.govind9@gmail.com?part=3D1

Agreed, this will be addressed in v10 by protecting the x360w state
with a spinlock and building the input device from a snapshot taken
under it.
