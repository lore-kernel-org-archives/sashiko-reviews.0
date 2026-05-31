Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83481724
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780203679; cv=pass; b=DM9ZMCoWRy9jcyo8rao7Qr2Lmw+UfDogi/qIaReVn0LFTT2/VUmdwHQb9ydXXxpiE6yvzbaLJPPI73aZnaQHxM0rMBwxF568/dFl3gtrPdqtC5FT/k8oIIMEWXPyFsm+TYL85hnm3wPNgwrc2LmVq+14O2DokADiCmfhF7n/BFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780203679; c=relaxed/simple;
	bh=uDqPR19CBC2h8AzQ/4XtSluc0ZTH7/6e2TiZJ2kK5hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKk/wmQWyVyGjhjrc6fXqIMObAVrUhXPf6O/cUJr8/yDGm8Z3+3dc2WbKvzIsHU0/2bhII2IbaAigaRKVQE9q2K/oube/hKYi7IhzgTD7FNr5iaxHsPhOwbYhHnC2NHZ7vOTcXF+/djV6SjcGTnFS0XmKPj1Ty6bTLR3eMK5yDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0CSM8CF; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0CSM8CF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa610cbd9bso1040738e87.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 22:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780203677; cv=none;
        d=google.com; s=arc-20240605;
        b=PHDVyrl/0a1I0qQt793fXsM8j7QRKAuzjqZtgucf++tra2nOsKKEQ2jC7SAuSP+M6E
         iCyNtCTkWzKzrWpG3nM5MlHKhn88+sqms42u3AB3ZEbK6HKuPpSXZ6rBluQpmQpskxYi
         7VYNIQQmpI+FU8Q+4q+9AH+an3IarMAsBqfsqJ+6jCkgI/SOHxfrspIQkZaa7+LmKSHA
         iJfH41zeEZTPXkLBNMDGCQ2GuFEDUBzKEWtpt0Kb748LYBPw9+tM/TdlVaNFDhTaWzmc
         Zxmn4YBvukNAY/GWnta+1SbOG2WHSQqsYtS+8+8S7ux4q/EW0e+1R8+TlR0QYUiiTGIh
         00IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nqgOgNRdeGO3Yt8rRsoJuC9RkIgPZyiihaZvjuvwF3w=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=H8nGtSFHgZzGqA+Wf+IWbP2vM/SbSpAj5KMh2FHPE/F15hrr0DgsDVdRaK5TytGXfw
         WyR0nMB6V+7zls9lVDM6MlfnGesyCJDEhZFD+jrHfrNgu1lo5aHkA6fn4fidorH7uFm1
         UVD/fpQU25LIqgpDzP4oMes92O8xNOl7Q/CXVjvmdv5oVCPgHmAq1zoutOwTJ1ZA/ecm
         Af2CpaLDA2fBXkUkvHb8E0HT+HXcZYFfitWtSp1ITKCOyI96eOfJ4BAFtUWRDJpDYrZw
         iq8UchKSoYoD99wyEZPbqucuDITxGEDTnQnFdK34f6dHzDmFf1Mc8n8ugRMxqTE+kxQg
         njWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780203677; x=1780808477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqgOgNRdeGO3Yt8rRsoJuC9RkIgPZyiihaZvjuvwF3w=;
        b=o0CSM8CFCm071XuM0HbHJaYRsFgJqtKCo8nLgDz6Uqs11GWxQDZPZeC1mv7FyWoDED
         GbuI2Yb95ST6GkfErTe4Kla38IIN73DFyhSjemY/n0FMbNIuFSYn4mq2zTWvo2TWNtdr
         k1uXA/bNqV5kYfrq4ij+IF+Wo1iisMsUz66JALjBpy+JiN5SUQcjnLPZv7aefad+2gFM
         4jt+jfp+qKvAj3z3qpBfSim/fXLMWLGkQf5xyhJxy0b7LJifkBAzIErwOdBdUl1ovld5
         i7goLpqyUxvrMogOyD3AJdS2RyMog0rw6Tr67XOn4Hoy5/eZsnOgYvzDpVPOlRIDlbtW
         XNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780203677; x=1780808477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nqgOgNRdeGO3Yt8rRsoJuC9RkIgPZyiihaZvjuvwF3w=;
        b=P8vpjSxMh9sU4atdKLi6ysgzRrQslrnr15jm6A6Maad9k0/SfKU3uYth9CgnA6LytO
         M9e+BSbqBIw76XXanB1dfu22a4mACL03hXkpYMSserMJPMvvWCFgz7C2cpQj/CiNCMVI
         OVji0FvaKAKRoyQPlvYdkNtuEicL3T5VtKbyNPOnMl6WROMq9MiR8G+eUxTtD+r5grXm
         XH8m036XOpxVX2wtuUeoyKYzsl3h/Ode1B9cdRb/w95UlTqdaPyih8A4dIddrRqXsCe9
         +zhHJS+y70vUqGjnS3U9aB4cGG1jogJCCZAk+qvW13LtOf9KXk1fVKKii1N+B/6NBsL3
         Tyeg==
X-Gm-Message-State: AOJu0YyD66aXl8vXVHbohSN+CS/Z/fvEcWzfiPwqER/lf6i2Ksv2cPZI
	YxRgNX8wIA15NGbURvDUtup1AY2oLU5xkWTYbY1wpw0iM7stCAHFzEt9xUHU69mZlDCmWdwXh/v
	twBiCctg1PJ3zY7uq9le8HUPokZunajQHnwLC4w/2cQ==
X-Gm-Gg: Acq92OHLaImIWDnf0gb4m27sqBNkC420gD1Pq9rAInf4aM2NE7wg8jOZqKDbFHtiG5s
	cAYP3OLGtrJnaDxkp6iAA+qD3CaFfwctWJOtwI4nX4sfBbhmsRl19W4Vlt1Z0RDUtNcnMGCpsL/
	2W1SdGgossDMIvmcYCxzR6ZDdOWoF/IMRfY/WbruIpJ3gPq5J6bzJhwyRx0k4KhvKF3ATe8xprX
	OzXj0aTP1rgqPmCK9I+ED9ml1UYs1i+InSiG5V2+OHywUMOj4t372nTuDWfTix5IGtfAyu3iewA
	W5th3EwO5UyqIftbO/hFXm1MncHSBASB1f8EMEKXgklVYG07hw==
X-Received: by 2002:a05:6512:1413:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5aa62dfd973mr728016e87.2.1780203676357; Sat, 30 May 2026
 22:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530042630.80626-1-kerneljasonxing@gmail.com> <20260531042721.DBD4B1F00893@smtp.kernel.org>
In-Reply-To: <20260531042721.DBD4B1F00893@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 31 May 2026 13:00:38 +0800
X-Gm-Features: AVHnY4LqahcWtg1FhRj5ewX96RmJQ76PvHXyzLtz7MffAph-ztRPjQzAQCAHMGw
Message-ID: <CAL+tcoCgXG5MdPVzXavwMwk=jmPXgcB5aKpLK+TNXMVrsGmS9w@mail.gmail.com>
Subject: Re: [PATCH net v5] xsk: cache csum_start/csum_offset to fix TOCTOU in xsk_skb_metadata()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 12:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The `struct xsk_tx_metadata` UAPI structure has an inconsistent =
memory layout between 32-bit and 64-bit architectures, breaking compat mode=
 due to implicit padding.
> - [High] Silent 16-bit integer overflow when calculating `skb->csum_start=
` leads to a negative checksum offset and out-of-bounds hardware DMA faults=
.
> --
>
> commit 8339ac65115fadb8d99c0e54d06d57fab30b5e84
> Author: Jason Xing <kerneljasonxing@gmail.com>
> Subject: xsk: cache csum_start/csum_offset to fix TOCTOU in xsk_skb_metad=
ata()
>
> This commit addresses a TOCTOU vulnerability where userspace could modify
> csum_start and csum_offset between bounds validation and assignment. It f=
ixes
> this by using READ_ONCE() to cache the values into local variables, ensur=
ing
> that the same validated values are used for SKB assignment.
>
> Closes: https://lore.kernel.org/all/20260503200927.73EA1C2BCB4@smtp.kerne=
l.org/
> Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload suppo=
rt")
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 5e5786cd9af55..f8c8a8c9dfba5 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -811,13 +812,15 @@ static int xsk_skb_metadata(struct sk_buff *skb, =
void *buffer,
> >               return -EINVAL;
> >
> >       if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
> > -             if (unlikely(meta->request.csum_start +
> > -                          meta->request.csum_offset +
> > +             csum_start =3D READ_ONCE(meta->request.csum_start);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can the UAPI layout for
> xsk_tx_metadata cause issues for 32-bit userspace?
>
> include/uapi/linux/if_xdp.h:
> struct xsk_tx_metadata {
>         __u64 flags;
>
>         union {
>                 struct {
>                         /* XDP_TXMD_FLAGS_CHECKSUM */
>
>                         /* Offset from desc->addr where checksumming shou=
ld start. */
>                         __u16 csum_start;
>                         /* Offset from csum_start where checksum should b=
e stored. */
>                         __u16 csum_offset;
>
>                         /* XDP_TXMD_FLAGS_LAUNCH_TIME */
>                         /* Launch time in nanosecond against the PTP HW C=
lock */
>                         __u64 launch_time;
>                 } request;
>
> Because launch_time is an 8-byte type following two 2-byte types, on 64-b=
it
> architectures there will be 4 bytes of implicit padding inserted after
> csum_offset. On 32-bit architectures like x86, __u64 only requires 4-byte
> alignment, so there is no padding.
>
> Does this mean a 32-bit compat userspace will write launch_time to an off=
set
> 4 bytes earlier than where a 64-bit kernel will read it?
>
> > +             csum_offset =3D READ_ONCE(meta->request.csum_offset);
> > +
> > +             if (unlikely(csum_start + csum_offset +
> >                            sizeof(__sum16) > desc->len))
> >                       return -EINVAL;
> >
> > -             skb->csum_start =3D hr + meta->request.csum_start;
> > -             skb->csum_offset =3D meta->request.csum_offset;
> > +             skb->csum_start =3D hr + csum_start;
> > +             skb->csum_offset =3D csum_offset;
>
> [Severity: High]
> This is a pre-existing issue, but is it possible for skb->csum_start to s=
ilently
> overflow here?
>
> If desc->len is large (e.g. in unaligned_chunks mode or on platforms with
> >=3D 64KB PAGE_SIZE) and csum_start is near 65535, could hr + csum_start =
exceed
> the 16-bit skb->csum_start field?
>
> For example, if hr is 256 and csum_start is 65500, hr + csum_start is 657=
56
> which truncates to 220. Later, skb_checksum_start_offset(skb) calculates
> skb->csum_start - skb_headroom(skb) (e.g. 220 - 256 =3D -36).
>
> When hardware checksum offload is used, NIC drivers might use this negati=
ve
> offset to compute header lengths and shift it into the TX descriptor,
> potentially causing hardware DMA faults or PCIe completion timeouts.

They were brought up a few times before... The second one will be
fixed shortly after this patch, I said.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530042630.80=
626-1-kerneljasonxing@gmail.com?part=3D1
