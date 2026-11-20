Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191392;
	b=3VOzAyFkQfeZbPJpbl72eVRh13rgo7Etb4JtEpzYXSPOpYY2krAo3g91N4ZCFX57TjTm
	 Mz71NoNUJfpmot4vIPyIa33Pph5u9vRvr/bRGyKMPXKu4rpAuphefGPLgGVwhGHpWxjRj
	 0aABarhVKzc8SLIJoJaqPEGvtUcQipl1muihWjz4Xa7hFZiRae64CWqNWQEU3pV0pRWOH
	 PThgyyty6TYVcZqpf3AxqxUXlwxx9MQriPV4+4SZ/CJO+qWmhGZFC6a9Jb1vyZ6Qpf1jy
	 Nip9R98hsdCeqfMPPeNpRbHUmf0mOWJsupa5dChjzfKN3H1GP7vbeGTq9pVgVnL3cTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8FjMsEwN0CmeAMZH8q3KD8wmJKc2e9X4mLxXlcfAI7g=;
	b=kTC1VqPy0DjrMCKkv4UrcFzuiLjp6WvthYMfqeES/UZq4LQDU+VqcD2lxLmufKDQreli
	 F8ms+yP+Ej2JXI77TujzYd+/x/GY3UeJ8luuSTrlM9KKXM/uBBKZKVrgV4YnW+S2TZ15W
	 Q3qcBLuDYMEU0/plRM+AHiBa07/BYcTpmwNKTuJAnoGf6MCFNzlnS/gd1EnXsDUJKHoNH
	 7gdoGkH9C1Bpi70qPq74+KNdBTpypRfeBRMnuDwm5D45iKGhJgIiyNBpWj2rkGOTEKvDL
	 lidhvAoNbUWEigb9WvzdtIupkDvZXOUMuVhEFIooX3xqRoP3MzYGGGVYvUo6pGkUqsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOyiJx2+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA9606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAA9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOyiJx2+
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46556b9e02cso782751fac.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 08:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191390; cv=none;
        d=google.com; s=arc-20260327;
        b=h0EO+gR7rlwSmywCDimpmdknxCjuNClG/K+yoFkIBG3kV6wtHZB05rEbBdLa0kFurA
         GpRIAEr95eaAN8c3pncJ2rS8ykOwHeC+tMEWMYECp721su0ovSnPTh/zp1zWhwkIP+tK
         mnsrkXPgxAv6IJIyT0wZ7xbm0BY0O4zcMmj5XrDJVUFCE5/UvVNsXnIbMRQJagU3obkF
         yBlupyAaNz3YYA0H0yyhJ69G+akJntXkfpB7zjztP8xJYvY5ccVG5Y4RNdVe8XLMcSaM
         VgabrDQ0Y+R9yNGI9qZJn0hKNdZW/DBMPty1rt3Om2qEXCGTFpNJEoE8YGVHXyfYxYqU
         fgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8FjMsEwN0CmeAMZH8q3KD8wmJKc2e9X4mLxXlcfAI7g=;
        fh=vK8dvgDFa2lVKbtbeDPGPHEYiMzXvaZcqIiCzxkZjeI=;
        b=Ryv8zTNb6WfmZa/1ob9nGS80kNGuE6LPlDqbQhermKG87A0gHd6lgPTrPujgD8Y+Di
         gl25/8KUqhxMh8uF/U95KlaDWLxgQoaVo3ci+w+SqUy6rI1UN9KHUqirRTvalwaAhsAz
         YPClnyut+ivHNfb1/nWb9Dwq9Yb2EJ7611nXfiUXuexcNixA/p7RRU3i5lgoyTAeuR/v
         v/5xsQwBqTzKk49t/R+hFa2wY5I82yX3S6l8ozgU+nyJnBJQvXfVbG2+CikLekxw2bOz
         dgyQqN9Lb5Cbxq7Wui5oUFrM16u14p3f8Pm47z6P7z0HZK5HmIhQHjE9/r3pf/VSx/ZO
         dJ2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191390; x=1795796190; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8FjMsEwN0CmeAMZH8q3KD8wmJKc2e9X4mLxXlcfAI7g=;
        b=EOyiJx2+Do1Th4ZIEH+n9s6hlwcBUzivVV+94qN79em8+wKsoZb4DhlGHoK3GYh3AX
         c/xPaINAMbWQqMs1Q773ydJGhIatyYtlBx3QDhb9ESHeY580mJqRU3apUh7mCFOsuryN
         ceeVGa0mz4tckXI6SASB0v+PZAr0XFyJaFOUIkArxQOVQj4FXD66jFJ257CJox9HWHLV
         xVtzok5fvm2JTTmaoBvjPwhM3veD8xIvc9EXMm5HuKVTt6eDDDZY91EltoR+qjnjVa0U
         Y/CPR3/VK0NWGG9qWyCi2ASxc74dAQ5tC2hUb41NuRmlsAN6nkKRI7LlT1D4MU3aa5yv
         C9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191390; x=1795796190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FjMsEwN0CmeAMZH8q3KD8wmJKc2e9X4mLxXlcfAI7g=;
        b=2OxfqyG8l1cf7oPvHmUY+hJgPFl1PqAxBMJfmgpRejpS+RmBitkxumYWVIal6WW+tT
         m8DFHHz5RzPLW5FIT82CGH1Qw+o4e5KiOaHIacO+kbxmqtxUJAGIIc5rQXpmt8wZQxz4
         UKdLLzT17VY8Img2q4hqYbOTmohq4dIMg3ANUaSfg4vZAcqjly9ihkArCbxjlzkP+XsN
         Uv21/m9hQeWo/iZhZ4Q0nuzWIj0m5iJihR+h5YNsCoqLyRyHHawKb6keIVdxHC6oVN2N
         k/cy5k0TpBiyvD4o+pHLwtzASm7kKOhMNuwfbDbSwrwqOHuTHZa60wZQ/3z/NfGuizEp
         /m1A==
X-Forwarded-Encrypted: i=1; AL+hErF8invP3tEAx97xX3XHrcQiGZcbz0vp4TV94FMLoSkMmEzAFfMa9SKLgQdPAZhhcvLUWDmLB7R7UjySbJHz2VA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8JufHo/RMkqu+0NCte9I1NZyHGaCsUwqnY4rc3UKaHBW2vpnCN
	Aq47xGu4jxL1x5w8g27ZLNbWHIrGDW8K7obrtTQJc1NMrcLZM2F7PiQGHar6ymvN0Xy/bAlD/9u
	933R8WCIh4dxbbR1xjkB3m5h6t/gj41E=
X-Gm-Gg: AZFdTZekUjF6F15V4i7F9tcAH6N8mqU2aOMU6aZVUANFYGeJotTHvJdstnyQHTkWx31
	cCASTKkTnsBuV7Ed7DgkVspDI84tHIV61npYooYRAx0lOwNLsojxsFedlbgsvhunnge7q1VIiKi
	AzT9tAqE18ndOX6BYVnuQOE7oZenSfHQGoCmIYUTz49dQ1IPDDgfkD6Wk7oDXGgvC+Vg+RoT/Ho
	bl260mHjuzFbrNzI7NCug+9WWO4cvZzuuGyBNEvynMj5OHGmyajEjHRMLfuDENkX8LQ35ccEtrj
	tPc2HUKUr2c9Jy/Qbsh08mA/xP6xkW6nhFl0ayv7QduCdFEnGK/sNVXvJE/rRIqt3Rf3GX7cDbv
	f1BWvLNX7OcNiNhWGwu0+BKRIAWNevzDJaNXleAr2SnAOw0DWNrA0eomU7Wxq0escbfljFzvsT+
	jYKKTZLoM4mWazLx+Hi1vNrE7KmCvorjE=
X-Received: by 2002:a05:6871:411:b0:494:2141:c0e4 with SMTP id
 586e51a60fabf-4bc858fc7f1mr2331500fac.29.1795191390312; Fri, 20 Nov 2026
 08:16:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119142114.152052-1-tzimmermann@suse.de> <20261119142114.152052-5-tzimmermann@suse.de>
 <CABOQOSW8f2Dw7DATTB-c1jhOzyo4BBsKh4cNVnEA0VpRJ=5H8g@mail.gmail.com> <9ba8634d-d714-4967-9a59-1e0ffcf2f8ca@suse.de>
In-Reply-To: <9ba8634d-d714-4967-9a59-1e0ffcf2f8ca@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 21 Nov 2026 00:15:54 +0800
X-Gm-Features: Aa3M54q1fnfnzzPxReZg0T4qLBs-z01sczs9c2I4joAY-GzySu59IZ41HM2kTHk
Message-ID: <CABOQOSUocweGxzpqa0WPYUF8j4=_CXECNx5w2bLJQS_Z8Lv2DQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/udl: Allocate bulk URBs in helper functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, tiwai@suse.com, 
	patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 at 20:49, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 19.11.26 um 17:38 schrieb Jie Feng:
> > On Fri, 20 Nov 2026 at 00:30, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >> Move the code for allocating an URB into a separate helper function. U=
se
> >> the helper for initializing the URB cache.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/gpu/drm/udl/udl_main.c | 74 +++++++++++++++++++++-----------=
--
> >>   1 file changed, 47 insertions(+), 27 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_=
main.c
> >> index 67da676f0f94..a799d7710a7b 100644
> >> --- a/drivers/gpu/drm/udl/udl_main.c
> >> +++ b/drivers/gpu/drm/udl/udl_main.c
> >> @@ -163,6 +163,47 @@ static void udl_urb_completion(struct urb *urb)
> >>          udl_put_urb(urb);
> >>   }
> >>
> >> +static struct urb *udl_alloc_bulk_urb(struct udl_device *udl, size_t =
size)
> >> +{
> >> +       struct usb_device *udev =3D udl_to_usb_device(udl);
> >> +       struct urb_node *unode;
> >> +       struct urb *urb;
> >> +       char *buf;
> >> +       int ret;
> >> +
> >> +       urb =3D usb_alloc_urb(0, GFP_KERNEL);
> >> +       if (!urb)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       unode =3D kzalloc_obj(struct urb_node);
> >> +       if (!unode) {
> >> +               ret =3D -ENOMEM;
> >> +               goto err_usb_free_urb;
> >> +       }
> >> +       unode->dev =3D udl;
> >> +       unode->urb =3D urb;
> >> +
> >> +       buf =3D usb_alloc_coherent(udev, size, GFP_KERNEL, &urb->trans=
fer_dma);
> > usb_alloc_coherent might map uncached memory on platforms such as ARM.
> > This might be slow for moving large amounts of frame data.
> > Would using kmalloc/usb_alloc_noncoherent be better?
>
> It's worth a try, but i cannot say for sure. The advantage of _coherent
> is that is makes DMA easy. And we don't read from these buffers from the
> CPU, so caching them might not help much for performance. In any case,
> it's a separate patch series.
If I'm not wrong, uncached memory also means that the CPU sends each memory
write as a separate transaction, so it does not wait a while to flush
the entire cache line
at once unlike normal/write-combined memory. Therefore it still makes sense=
 to
use cacheable memory for the write path.

I agree that it should be a separate patch series.
Most of the uses of these USB display adapters should be on x86, where
there isn't
a performance impact, but given that ARM laptops has been rising in popular=
ity,
I think looking into this might be a good idea.

> Best regards
> Thomas
>
> >> +       if (!buf) {
> >> +               ret =3D -ENOBUFS;
> >> +               goto err_kfree;
> >> +       }
> >> +       unode->alloc_size =3D size;
> >> +
> >> +       /* urb->transfer_buffer_length set to actual before submit */
> >> +       usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1), buf, un=
ode->alloc_size,
> >> +                         udl_urb_completion, unode);
> >> +       urb->transfer_flags |=3D URB_NO_TRANSFER_DMA_MAP;
> >> +
> >> +       return urb;
> >> +
> >> +err_kfree:
> >> +       kfree(unode);
> >> +err_usb_free_urb:
> >> +       usb_free_urb(urb);
> >> +       return ERR_PTR(ret);
> >> +}
> >> +
> >>   static void udl_free_urb_list(struct udl_device *udl)
> >>   {
> >>          struct urb_node *unode;
> >> @@ -191,11 +232,7 @@ static void udl_free_urb_list(struct udl_device *=
udl)
> >>
> >>   static int udl_alloc_urb_list(struct udl_device *udl, int count, siz=
e_t size)
> >>   {
> >> -       struct urb *urb;
> >> -       struct urb_node *unode;
> >> -       char *buf;
> >>          size_t wanted_size =3D count * size;
> >> -       struct usb_device *udev =3D udl_to_usb_device(udl);
> >>
> >>          spin_lock_init(&udl->urbs.lock);
> >>          INIT_LIST_HEAD(&udl->urbs.list);
> >> @@ -205,36 +242,19 @@ static int udl_alloc_urb_list(struct udl_device =
*udl, int count, size_t size)
> >>
> >>   retry:
> >>          while (udl->urbs.count * size < wanted_size) {
> >> -               unode =3D kzalloc_obj(struct urb_node);
> >> -               if (!unode)
> >> -                       break;
> >> -               unode->dev =3D udl;
> >> +               struct urb *urb;
> >> +               struct urb_node *unode;
> >>
> >> -               urb =3D usb_alloc_urb(0, GFP_KERNEL);
> >> -               if (!urb) {
> >> -                       kfree(unode);
> >> -                       break;
> >> -               }
> >> -               unode->urb =3D urb;
> >> -               unode->alloc_size =3D size;
> >> -
> >> -               buf =3D usb_alloc_coherent(udev, unode->alloc_size, GF=
P_KERNEL,
> >> -                                        &urb->transfer_dma);
> >> -               if (!buf) {
> >> -                       kfree(unode);
> >> -                       usb_free_urb(urb);
> >> -                       if (size > PAGE_SIZE) {
> >> +               urb =3D udl_alloc_bulk_urb(udl, size);
> >> +               if (IS_ERR(urb)) {
> >> +                       if (PTR_ERR(urb) =3D=3D -ENOBUFS && size > PAG=
E_SIZE) {
> >>                                  size /=3D 2;
> >>                                  udl_free_urb_list(udl);
> >>                                  goto retry;
> >>                          }
> >>                          break;
> >>                  }
> >> -
> >> -               /* urb->transfer_buffer_length set to actual before su=
bmit */
> >> -               usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1),
> >> -                                 buf, size, udl_urb_completion, unode=
);
> >> -               urb->transfer_flags |=3D URB_NO_TRANSFER_DMA_MAP;
> >> +               unode =3D urb->context;
> >>
> >>                  list_add_tail(&unode->entry, &udl->urbs.list);
> >>
> >> --
> >> 2.56.0
> >>
> >>
> > Best regards,
> > Jie Feng
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
>
>

Best regards,
Jie Feng
