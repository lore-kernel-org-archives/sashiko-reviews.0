Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565342;
	b=bpIhazEHJkIzkDMI9PV6OB6UuD7Zs70Ze/5a5hXGsHE2Yum6jtamAvFrO78f3cL+RBBb
	 tj3/ihN4Fl68hgDa/2Xi6Ehp2xzE0jAbq3wsOd8rph7KwImkaKn5rx0Sn4nyWILAsvugA
	 JQMyGqRBZI/dYaysORvgVQ7wmyOPiydYd7L8lW5Sj8oQnrV6cnxvg8wNJesql2A1aYVGm
	 CGRHmBuOlA9I9UbsG9tV/4BNjb8T6jScMBD2M528t61spvATypKMNZoKehWUgROmEsPH8
	 SGkn1TP1gLo/vVaSUzGh4S0k0dyZQa3SiSO43QBC6GXxCJauQlLCYkVH+hCWMqdA8Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
	b=YR47FgpXB6xmJ/IvrbDifPhXQ3xinlv0P8I7PcFuw5hIeGRUpwi6n1uoPxOsGsbt/ORe
	 gINypNtVrcrcFSmXTX+MgOE9OBrRMZh55h+vP0VM90PBpQfGyMZO2KSAblqrj2TV/yNuj
	 ZcypwNpgnbof2xWNvJ07dPq08PsfWDpl8IxDnvAdmMTRrZ5PskjY5BvUYZYh/yEAlsojF
	 DPlMy+Cveo5iyyh4w/vo54kvKOC8bSOyC52XA20Rra0X1/o1cc6Fv8He4SDyFY8geEjb5
	 g15XQt9dRdje0MBK46S5KsLRkPoQdyc8rQaYVs0wrS83p6k4aafL1WL/HM60JQW7T0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ETEWtetK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EEE606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EEE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ETEWtetK
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917c04630c2so4785866d6.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565341; cv=none;
        d=google.com; s=arc-20260327;
        b=mhSmEn9RdRCHbLiabbS/bJ7PMDpG7V9USnPsiAjk6K1MxtztAbVQqyMguK58NOptfq
         0ODko6ePNiJMc9d3Fi5Fwl8eUM30NlUYYIkDJ+hGnI3fdqXm8qhAZNKDPt0f5SyZOxWx
         IVXFsMjQ4kpqQYyOGWu4D8q1oQVhXZ5opHC7sXHspKSThTIjLdjoXVrY9lfncRe8IVxG
         JuT8JwKdCSDYqxRqISXNCprwB4XlCM/3lJ5wFfn/3CqNEwHTnTDVSYmZS6UDVppGbSVP
         YPZ6XTDF0TfxBsmZOzPc5/kw4JogmGljPqVaAZLr96SARVzyOUuAjXiDaLVfGsXVFREy
         xrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=HoIMSDDTHJiouIuGSdKtmDnQ08YbwiaXlXIV3vlFr17grRNXSkQtfa21gBHlT9EWMl
         onPACNmfgVYElP3N0gqfbAoVCgHaLoCn8QyoACY65PNmYDEWjBtzLQfg15o/cuHdpkZe
         76OeDBTvXdVLk/sWrbPNLI36RwwVyoqF3G7NaQQqcG+33yA/BqY6vNXqdMrS8uyX63XO
         qY357N7Ytj4XsPcqqs2hhz5HNw1bX968JyfaNA11ongUzhmvprdWfBOjVR9XNPjhPtRL
         Lul0KMNTM9/5hXg7JgJ/m6/nBHFDnOPByzfs1bIDDhwp+mwHnMFervLlbh6r0YNR6e5G
         zODw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565341; x=1793170141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        b=ETEWtetKr3AYjLdEgPhXtkaTHZDie0stihQlRK1pFxII+69mLcQJAYDjJUYI+pKwjk
         0OOiJGiB0xwP63tfoHxzEIu6SAjuzqybILnpkKlb/Q1X8fVCoD08u778F57JeSqEumzW
         k3CBIlBkz5GvFxV4iGqbosArxG62tmSCima8czu+Tduqz6kshvCtb2joyjPGKs3qUZvW
         12FiSP6BAtQ5rFi1rGD6yBdbwaY3pAxglTg/3oQY57ddg4dMfSuJu/MQGC7ws/iMMmM4
         0nUS3Ogevhgo9WQnU3VikaaHTE2uHD6pEcQ8t0+0S8hBBzXe/nTGnnqAbv5uEkhGtkC5
         xQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565341; x=1793170141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        b=DmwamJcl1ZZmjZRKo+CdzqE0sjGbS10Im9lcfw85vSLZPIAdlN0dvtvz/gPxmFhS++
         Id+sNtaCzHfAJmeKE03rk7IGvdoOxRpm8XIiIyqItl390szpwKx2v1DX4BxwuQIq8iFE
         dMCh1rm1HvRnZfZQaeO1XdU9Sqwb6Vsf83noLrkuzG263haNT5yUBtXBOUgIlXtDKdPM
         ZqD7KMELDFd3K7AvY1jsnLbiKjEEPX1NGqCQn9f2HmEQrMMLqVe1Qf5zDFZBVJJCsMHu
         QIvlIrnq3vcK3cLEmbQXjnhfjCEGoxHvamHNYdWZniLh4gDIoMkdgHPEvLIwfsuRoSj8
         vnVw==
X-Gm-Message-State: AFq9FYIkXlUMou8UmTiVl/1oHizX9pEbg0wHirtbdnkIo8x6oIIj7jsq
	+5k1/gP+JDIGJAMV3n1mlHHad1KpHqZgK1nWAoX6qjQeE2DuuAgM5pB4lgc/uJJcuHTLbxj/vwI
	xXYjOQCERqiTalC33x9KDvwRPxzwXpoKv8VFS
X-Gm-Gg: AYBFou2ycLYWaECiMLAb3aNGARbf7CrCeLhuHZ6ZlYEPq8Mzq4PoCBLjvIfHrlcuPHH
	RRqZjZtApRcsseMyvWQPPpzp7YOn5ypImQmCPI7XAFLgN+W7QA2nlWxfvpdovc8MGYm9SbkgBjS
	yFqEvoNdIJd1xYUq1dnweB/eaGN3ckkQS9hYPHmspi7IuXkj+7u5nYVWmDAR+EC+iMjm3zmuSn7
	PPSyF6qf2Ck9kIqtdF8FfUxgs5Iq+P6fmea+F8ItjwS32PJGATlIK7qew+MrLCDuWH5ZIyvpdMi
	T3oL0REE1Nubu5RiUDu813qMQZvm6SrYmwAM+DHZfN0BQRkwnrzjeBIu8Fk9ZOKptPwn8Gu6YxI
	UzRB+a+0TT5+3hmUptL+2vZc5u2zA9adrWrUXqA==
X-Received: by 2002:ad4:5de5:0:b0:91b:de10:e9bf with SMTP id
 6a1803df08f44-91c12f5e5a9mr18172186d6.50.1792565340653; Tue, 20 Oct 2026
 23:49:00 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-8-a0282524688@gmail.com> <sashiko-outbox-169141@kernel.org>
In-Reply-To: <sashiko-outbox-169141@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:48:49 +0800
X-Gm-Features: AclHuK_yxdgb81kYvm61_aMQhj1JDKLAcvGN0abH9YT9LUNTn1rxKPwEVfB_tlU
Message-ID: <CAOoeyxUB-0YVV-9QhwfvixWYKvQY8ijZvQG+Vr1-XKXG1=Tesw@mail.gmail.com>
Subject: Re: [PATCH v9 07/12] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: nct6694 driver name hardcodes implementation details
> --
> [ ... ]
> > @@ -441,20 +445,20 @@ static void nct6694_usb_disconnect(struct usb_int=
erface *iface)
> >       usb_free_urb(usb_data->int_urb);
> >  }
> >
> > -static const struct usb_device_id nct6694_ids[] =3D {
> > +static const struct usb_device_id nct6694_usb_ids[] =3D {
> >       { USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUC=
T_ID, 0xFF, 0x00, 0x00) },
> >       { }
> >  };
> > -MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
> >
> >  static struct usb_driver nct6694_usb_driver =3D {
> > -     .name           =3D "nct6694",
> > -     .id_table       =3D nct6694_ids,
> > +     .name           =3D "nct6694-usb",
>
> [Severity: Low]
> Does this violate the MFD subsystem naming conventions by hard-coding
> the implementation detail ("usb") into the driver name? The subsystem
> guidelines specify that we should avoid including implementation details
> or the driver's own filename in names, as it creates rigid and non-reusab=
le
> drivers.
>

The suffix names the transport, not an implementation detail. It
distinguishes this driver from the new nct6694-hif driver, so no
change is planned.
