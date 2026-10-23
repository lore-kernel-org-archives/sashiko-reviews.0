Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792758480;
	b=tbjY0FhpROnNrp3URs8dT3alXEK4XEaF2zwqMu1tLbYL65qJV+T1p+nbAmDa/IWjNsxk
	 Sg8Z9XBOGLTYzEWv43AaFXUDgNEC3ymc6Leegp+PyROQ4RnCgeElI0eMi9ny0Fo4pg9hR
	 8XKqot9gKT26f/91+gpPM1SoJo3iuCOhlvS0ovNHR1uGKoEKyXQcF7qzGcg2kZ47sRU6D
	 WyD9dyfS1pZ9OYpFffpqMFTJV4+Zd9QCU6F0N5J1r3sFt8sH1n1C7OJAZEQfeJeKr0OqP
	 zJWtCyuj3wgfhxCT2JaSwKY/D3eZmpChPcwluKX5B7SkhwmHjpIjtT2HLPIzF4qKO8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
	b=FMIItXIh2wqtoX8mC7wX2+iDEt4gjMzR+LRtaePa661vfsVB6Tb9NQiRggx7gZtLXPjW
	 wckwqKANzzfXwMDOfvaYIZ2VSPnBPgPtpJQBGDDBwaWU1DuvfOZ1bhk3YzwIGK4nGBzMB
	 PvbBjMXgCgT8IWo1EmLqZyyJtC+gPkembDtZU7NjudLQ38A/JRC7rAAODjUu6kLQJxwhl
	 SHC+TsXzdI7mDU2yoGnw8MSZj5sEsrW3M5gCS0sUirgKT7KMb2uZQ3T/KuzwTTkKCdZdI
	 MWFY+DGHzEDFIOMcx4BgULbd/PXskHBSEPFeCmPfA02h310qpass99Dt+O8O7Jo8Ifg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hQQT881z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6EE606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 12:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hQQT881z
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-676804a3a22so850236d50.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758479; cv=none;
        d=google.com; s=arc-20260327;
        b=qW4Yanr+NUrtqFlevsTZMMlB9Fo2HJz7cLWdTA9zVwTunYMT3U4Ks7eCp8XAzUyfTW
         8QnXi/n5HQuB+6kgrTFqf1ESqhR9RSRVYKbaM/lB4msmimpdg1PjL/lhRr6cG2trTMnW
         8ofV6ONixDbmD5Qb1OUeAc35klJA73NUMgPLgc783G0Tw/b3OVtkqDPLPv5m+OsRZIxh
         UFuAWnUPmzeltlqTB5Ai4TcHZ+JEcUVwy8B56jnY+9csTe9EftLlZMTmhMbvdTHK3/IU
         asTUyUa4CeeaIxSFdck6z6WqYMiOtWi36Pcntn/rHTI3wVr+4QDEyrtKo5x+/8TUhynJ
         DdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=a5mXsgYLa/R224k74F7jfjcoR/2B9RkK292EQQWCzzeCooSHs93OESuL2z1vYBi6EB
         Sikdt4GPfGE3+jVb4+EEmX2cyB38Yb+lDmzAjt2yjdZsz+ZuTYtdR+oRKcdOnN5X8riK
         42D8BYMb+1H7v9xmmCTbGabkwoaNLwMgxHXZnPQt8IY47MPt+U//USRBgvT6IviDvZ65
         +pI+RlZZfK80FnZeH98GhuRiKWniaRtKsJa3XGeC1T1Almetd9jXcjDA/ZqvJbBN0GDz
         84DOh2spO4IyA1Qd+/SZnCFF+vSOxTotNzou3YmGYusJ5XnrmqLbnBy77lsR5ftjKxaZ
         JsVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758479; x=1793363279; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        b=hQQT881z76KbNQB2PNHsj/vjmbgJJAoQY1krOr6aidtGt/SxUhFEDVtPCY1YgFHwvb
         NIud3DBaOLt7D6iUu+U6omCE9geCrwtlxBgbEFIHq28ueLEs7toVFFipuUFZEhqo35X0
         IDVnKOmI9l7zjaGr0GEV/Kna2RS5WFwIUSohBzAmbwuZzLm6lQo2aux+jRDfkqnhLmaw
         8GlppxlubHZjXKqrCYOFnpNrsA8Va/FfLA75AqBrWFFA1OVWuqCU98FcjkLMyoUnThBQ
         clKJSpi0OoCKTKENoTSyXGn99kA4DCObKJ4KeUxkw2yB+uarP++YWDp13aTRyVAApTDC
         7EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758479; x=1793363279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        b=w0RlhYm1WrMtLFmEjCSdS3I4xL5TUWpOM8GH+EDXqRcO+9LGaq6+HFqFK4aZ5UDGSp
         ZVcrMfNu4ByyHpIZsr9AYyhTuPklLeVdem7WkXUTlVhyd3YAN/+dxWybSsGABR3lBlUB
         lWpGp0Kh4kQ/HFfJh7OPZJCp0A4fGUMBmmMmlJRON+uSuQwm/ZqyLzWhgHBpbsVhN1s8
         +0IwT4Frj+zuVAei34PDgwVosh4/8mNMwPRNiUj6yM3cNa0ucwmvxdwMY1YRD0N1LMMM
         teTe8JXJML1Y8QCxPCtgrCAqGm7jHFE+oHg2eZoq5IvriimpNXFlUCZhbF1uKicOI7+K
         JgQQ==
X-Gm-Message-State: AFq9FYK5nFfdC1QXPEvbfjFTna/QSetmyR4qu4jD7M9rQrwZbbMxfNgB
	CjnsM5clSw6Hm785zSnXfrd3p4/7qnN4YvetIPZQzcoMjwQpyuWIcnHRCTNYRN3Pkhp5zCGV9Q/
	MykcL03DpHqsUe9ZSmiiIuNsG5GcjQwIFgeynUA==
X-Gm-Gg: AYBFou0lW/F79uvH742KQG3z+lxqIripe7TcFXIlUBhYiTpmCSHyDDhyTOJOJNj7yOx
	qI7gLULTC9rh22zQ9qvrXymNbi069CJEElNJYUEbCVXd14+OfG32s/U/0sajX43rh8jWRenQy/A
	qnZmSh4cftAYCWsba16rzw2en+2Lqx9hBBRMXdHwJwAS3VUmvVMciuRVeCRx34TreYtLT8Y3+LX
	nd4aM5W2hvKriswLKFaGspjP1paXm2W1vPwHMbP3q55X7jUScP93OkIb9AAe/m32MZ+ngv8sQzf
	Iblwx1AmiBEjwsbGIUDXnK91+fc6HhfU0l+L0Deh0DWn0iG1fpkknw61507u//akr7Bv5YNTML8
	UcqGsKCqtqHUf6QT4lwCXT3Cs/atpPHm2u0m1hMwflKQ2H7lctKtcwfSVAmUohmP2pfeGwjQZA0
	JQRgLyRRQ+idhM7kD0/5w/t6fFDLTlgTAJLKVV6Y8=
X-Received: by 2002:a05:690e:12cf:b0:679:a925:edf2 with SMTP id
 956f58d0204a3-67a35bb9bd5mr1507183d50.19.1792758478595; Fri, 23 Oct 2026
 05:27:58 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com> <sashiko-outbox-181835@kernel.org>
In-Reply-To: <sashiko-outbox-181835@kernel.org>
From: Shawn <rainey.shawn@gmail.com>
Date: Fri, 23 Oct 2026 08:27:47 -0400
X-Gm-Features: AclHuK8dKd1CFrAVuglMwdaxGNoaEf4sR5SDw0Am1FeI8s6v4RIsVzplaUqWCpg
Message-ID: <CANcp8vf22LvCxqXC6w2jGBjbhNFbA64_Xe4-0AZXsVq_hKKrJg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch. v2 incoming  with .ep_idx =3D 1 to the capture entry

Best,

Shawn



On Thu, Oct 22, 2026 at 12:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ALSA: usb-audio: missing .ep_idx =3D 1 in UltraNova capture au=
dioformat
> --
>
> commit aa83c7ced6942ef370a66b06613c33f74107f796
> Author: Shawn Rainey <rainey.shawn+kaudio@gmail.com>
>
> ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
>
> This commit adds a composite USB audio quirk for the Novation UltraNova
> (1235:0011) with fixed playback and capture audio formats on interface 0
> and a raw MIDI quirk on interface 1, while leaving the vendor control
> interfaces unbound.
>
> > diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> > index 6343a50fb2732..0b8bea76eca5b 100644
> > --- a/sound/usb/quirks-table.h
> > +++ b/sound/usb/quirks-table.h
> > @@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
> >               }
> >       }
> >  },
> > +{
> > +     /*
> > +      * Novation UltraNova: vendor-specific class descriptors, fixed
> > +      * audio and MIDI layouts.  Only the audio and MIDI interfaces
> > +      * (0 and 1) are grabbed; the vendor control interfaces (2/3)
> > +      * are left unbound for userspace access.
> > +      */
> > +     USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
> > +     QUIRK_DRIVER_INFO {
> > +             .vendor_name =3D "Novation",
> > +             .product_name =3D "UltraNova",
> > +             QUIRK_DATA_COMPOSITE {
> > +                     {
> > +                             QUIRK_DATA_AUDIOFORMAT(0) {
> > +                                     /* playback */
> > +                                     .formats =3D SNDRV_PCM_FMTBIT_S16=
_LE,
> > +                                     .channels =3D 4,
> > +                                     .iface =3D 0,
> > +                                     .altsetting =3D 1,
> > +                                     .altset_idx =3D 1,
> > +                                     .attributes =3D UAC_EP_CS_ATTR_SA=
MPLE_RATE,
> > +                                     .endpoint =3D 0x01,
> > +                                     .ep_attr =3D USB_ENDPOINT_XFER_IS=
OC |
> > +                                                USB_ENDPOINT_SYNC_SYNC=
,
> > +                                     .maxpacksize =3D 392,
> > +                                     .rates =3D SNDRV_PCM_RATE_44100 |
> > +                                              SNDRV_PCM_RATE_48000,
> > +                                     .rate_min =3D 44100,
> > +                                     .rate_max =3D 48000,
> > +                                     .nr_rates =3D 2,
> > +                                     .rate_table =3D (unsigned int[]) =
{
> > +                                             44100, 48000
> > +                                     }
> > +                             }
> > +                     },
> > +                     {
> > +                             QUIRK_DATA_AUDIOFORMAT(0) {
> > +                                     /* capture */
> > +                                     .formats =3D SNDRV_PCM_FMTBIT_S24=
_3LE,
> > +                                     .channels =3D 2,
> > +                                     .iface =3D 0,
> > +                                     .altsetting =3D 1,
> > +                                     .altset_idx =3D 1,
> > +                                     .attributes =3D UAC_EP_CS_ATTR_SA=
MPLE_RATE,
> > +                                     .endpoint =3D 0x82,
> > +                                     .ep_attr =3D USB_ENDPOINT_XFER_IS=
OC |
> > +                                                USB_ENDPOINT_SYNC_SYNC=
,
>
> [Severity: Medium]
> Should the capture QUIRK_DATA_AUDIOFORMAT(0) entry in usb_audio_ids in
> sound/usb/quirks-table.h also set .ep_idx =3D 1?
>
> Since capture endpoint 0x82 shares interface 0 altsetting 1 with playback
> endpoint 0x01, endpoint 0x82 is the second endpoint descriptor on that
> altsetting. Leaving .ep_idx unset defaults fp->ep_idx to 0.
>
> When usb_audio_probe() -> snd_usb_create_quirk() ->
> create_composite_quirk() -> create_fixed_stream_quirk() runs in
> sound/usb/quirks.c:
>
>         alts =3D &iface->altsetting[fp->altset_idx];
>         altsd =3D get_iface_desc(alts);
>         if (altsd->bNumEndpoints <=3D fp->ep_idx) {
>                 err =3D -EINVAL;
>                 goto error;
>         }
>
> having fp->ep_idx =3D=3D 0 only checks altsd->bNumEndpoints <=3D 0 and do=
es not
> verify that a second endpoint descriptor exists on altsetting 1.
>
> Next, in create_fixed_stream_quirk() -> add_audio_stream_from_fixed_fmt()=
 ->
> snd_usb_audioformat_set_sync_ep() in sound/usb/pcm.c:
>
>         if (fmt->ep_idx > 0 || altsd->bNumEndpoints < 2)
>                 return 0;
>
>         is_playback =3D !(get_endpoint(alts, 0)->bEndpointAddress & USB_D=
IR_IN);
>         attr =3D fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
>         if ((is_playback && (attr =3D=3D USB_ENDPOINT_SYNC_SYNC ||
>                              attr =3D=3D USB_ENDPOINT_SYNC_ADAPTIVE)) ||
>             (!is_playback && attr !=3D USB_ENDPOINT_SYNC_ADAPTIVE))
>                 return 0;
>
> because fmt->ep_idx is 0 rather than 1, snd_usb_audioformat_set_sync_ep()
> does not return early at fmt->ep_idx > 0 and instead checks
> get_endpoint(alts, 0) (playback endpoint 0x01), treating the capture
> audioformat as is_playback =3D true. That also appears to be why omitting
> USB_ENDPOINT_SYNC_SYNC caused generic sync-EP detection to pair 0x82 as a
> sync endpoint for the capture direction as described in the commit messag=
e.
>
> Additionally, when opening the capture endpoint via snd_usb_hw_params() -=
>
> snd_usb_endpoint_open() in sound/usb/endpoint.c:
>
>                 } else {
>                         ep->iface =3D fp->iface;
>                         ep->altsetting =3D fp->altsetting;
>                         ep->ep_idx =3D fp->ep_idx;
>                 }
>
> ep->ep_idx for endpoint 0x82 is recorded as 0 instead of 1.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164340.78=
664-1-rainey.shawn+kaudio@gmail.com?part=3D1
