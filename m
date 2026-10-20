Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792510145;
	b=EDqf1DmIyx5O2oNT4A0P4ho975munCWdKLK1SyktkbV7RYDcYRbVPbDrvPRtP4rI7K+Y
	 HsmNtZRCuzOtpLhsijjzaSDYi5nf6MMknXOG7AlfxgpUoaiujF1NsLe8ZzS0Ed+6XqDfV
	 /P4PnuvFMoGzCACqQmy/EFLQ6zm+4x8JMWrfBMTU/ww9WcdyWotavd6j/dWR1AGUzS0b/
	 /pW/Al6nPdqwhoNQw/P7XMkXUE/qelZfN4+xBHt8BYxwZc0YlC9zOo9IprhQ6IE/cg6f9
	 c/CPRfv9IwytyBb6A07fSGeJy7+6MhMLi3LVpY7Fbgy4XKa8Y3Z5mJa5DhuqYf1oRgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZyskLn72jxh0oFiWRj2z6aqvChztPyoLb2e2jTxBCSE=;
	b=aUsMAOTHAxIe9sWFUXATUSvZ3DPpRehCHaIB3AjZynZAhNYX6GxBwBtbkonKRpLgFmAF
	 jrafC1ySWq+ipVX5RRW+nQvL19EFQoNe2Xhd/tIcKCOSEG/pquDjxenYFsw1SLDzfjyI/
	 sgHqmg3boYDkhzLo0t+0HSTyBetgRWiu89tUXWanQl3p44GryF1sKpiFK1MQTFhlonQNu
	 3LXIuhqmmceMyGPvWW8hHa5868iWvKYa+ljLeShepocx6+AmNTIYZFa8wxTTTj3C2vALs
	 vvue3mB9f5395OHuG7WvQ/woR7viU+//N/vQeYuFVN2HzMIWVVxK7Xe6+919w0RBoJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezhU51B3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574D60A380B
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B574D60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezhU51B3
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e4c00d71aso315002585a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792510143; cv=none;
        d=google.com; s=arc-20260327;
        b=Jt2oeH391GeIOuGKdqAfMBXC1gBUF8FJTiKELfyVpp4raY+HNkztZ4cb7m9dsFPN5G
         tPLvIpppbX4bZgCwr6VnlJq9ufKnVNBVsp4MMGLtImker/KwDCPv4B8GU3rJXniXM4iE
         e2A5KZ7XEIBxqE/qzRvUhxYWlnawecVWHTXDx45r8hco6VXSpHyStSc/f8EgHeYIXMKC
         rpSSvcfTBGq+Zj0axC55KWKdvpy/KH51+6yftEcxQiJY42RxNHCKKHICAaKBXICzndHV
         MHBkVbCiYLx5fLDj8nr0dy1N/XMPccWM+R0wziifP9XAXMRb3vvShDbjaKKh+/RK4hmh
         nZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyskLn72jxh0oFiWRj2z6aqvChztPyoLb2e2jTxBCSE=;
        fh=K09mVAA5iDE1tu8qBsamFJCsxPTUs6BoV/KXWdgAULA=;
        b=jdKK5hamu+H44AfzGoCD88eLA1Sb1EyXOOV5Io811WNqGkwUAqg5hakJceKTRD60UK
         47ZKNz9pU/7kr8zys0BnV436MCVa/3GAV1Q131zhoiXQKqNkNWTIrfuRZdQp0Q97Oa9f
         TZsEyAcrfZJzZUqPevGbpTwriryJu3W/6KY+9dg//Zv/UJMEjLrFZmdDOmq2H2Z5ssPO
         81yGOh8DUsylz4m7Olv3JA0H4lyP8NSZpDy6nzgIQfgeLjM9a0UbK2fDctMfNqLQSjva
         WVyvmvgz9dhYhY1i+yNeVPEvjbkps6M4qJJwo3F+o9V4NVigQToZiMCjM4GznAlILqzQ
         /chQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510143; x=1793114943; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZyskLn72jxh0oFiWRj2z6aqvChztPyoLb2e2jTxBCSE=;
        b=ezhU51B3AbDGRuF+jMc91miilunyrjttQ/wXRY//7GrIaeLvAE9tXBS/X4kDVIpBL8
         R0sICWNbUD0OeF18maId/Tx+2XiU9w+EkoFil8/2Qm27CPwBg9gvTPP7csJTQgoQef7k
         fn79Le7m4OVk8601blH2Cv87SNJH8oWJQbTd+tpIHrhzHV4FbwUizMUF5tSC5aJpWg9C
         T72X+9evP2Sv4O5EYn4UxqmcanrJdQS9yE0JEuCgaCHQPBzysl9ah3BDVMEYeo7suaTU
         oTy+Hkz/2w20gXP1LgDfw/ZQJBnwNO4GACeXxvbEvqIsbw/HqgEqSE1jvRKYtThFh1RC
         bGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510143; x=1793114943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyskLn72jxh0oFiWRj2z6aqvChztPyoLb2e2jTxBCSE=;
        b=Y6eSuIHNySzw6ISmNZFQgBMtIV07uCg3WjtK567zldn3jKftuj2WjuUQxQoS9ln7kV
         S47emHS0dwfGx2MhR32h+YSFVQsVXgQzyX+tbvrA86tQH0VsFT3+qveAs3EDP9GGoJwn
         j0/b31HSBdp/KhZwUsPKOyt6G4C9BC0C1vB4fxDv8XknPctssu+sbIkMQrq44u/TZDWj
         VJJXPgF71r5cmrbS8YS/eK3eVhYvHyhg7hR8dk0fOU2NWuICeDQXEFGDKib6orgbzTIJ
         BlB6WSJfTAKF+dQ7QTw4voEVqPWf0Wbg2TU6fOO5QLPsdol3guNyvwpxOLtCtOBSg0+4
         X9ng==
X-Gm-Message-State: AFq9FYIYiAQKHXMoRPeOprXXWzlC+8SSH/rWo5C/D5dNYcVFca89fKjl
	u5s0us27gY3UQUTwgLNR8M8cZm8ePTUmvT8LlCi2P7S5ze9qsCRqW0k1oTVM7atuBxUmuCzI607
	dDb0biGfRVWSDscfZSvTO5pdZHBwsAVa1QeYR
X-Gm-Gg: AYBFou1soaUeRQ912EawU2yZmfwkyhmQn0YSD59xjMyHmv2M2wYzffgAPg/e3e5+gJH
	PktXD1ASYit98Xr5PXTVJc+WbfIq/+Yv6Byb1dnli29fnI8hHtWmNWv3/Pp7xFJumnDyC5LcLkU
	YzRv3Cg1ieiLFtp3tMvY6qsmZRXOnpNsUbuZgfqng6M7Vy1jBa9qcCOlz0a2a6W6S8Kz9FaToLo
	vqCn6etYI6U3qJWuGgqlCbOQhX5JeGcJA/mVA4zhGIpah+yHIxtkIgkQZVE5amu9DugKqkYIEgi
	sM0wE9KJ55KJSTHMULbktl0wUIG5O2M+TISV3oueJv2a85LWn5G62IiBiDC1ihdt2w25DvP1mVZ
	hEo91XbSryqditxICYuuL42qaRA==
X-Received: by 2002:a05:620a:2a16:b0:93e:920c:c00e with SMTP id
 af79cd13be357-93f29ceecb2mr1897331885a.21.1792510143334; Tue, 20 Oct 2026
 08:29:03 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
 <20261019170139.473808-4-biju.das.jz@bp.renesas.com> <sashiko-outbox-178011@kernel.org>
In-Reply-To: <sashiko-outbox-178011@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 20 Oct 2026 16:28:52 +0100
X-Gm-Features: AclHuK8LDeYH5plS4ObWqQu99C_hUhcvhaaMFjueV1TDvngZn9eDNEhrMl-PxcY
Message-ID: <CADT+UeB520ehCMt4Yv6Q9aWNsE+v-aUKyjbuzCxLNiwKwC+jfA@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial: sh-sci: Skip TDxE status clear for PORT_SCI
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 6:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] serial: sh-sci: broken TX on SuperH PORT_SCI from skipping clear=
_SCxSR()
> - [Medium] serial: sh-sci: unlocked control register RMW in sci_tx_end_in=
terrupt()
> --
>
> commit c9eeab42d1c45b13adb330fd8baab03f6ddbfeb6
> Author: Au Dang <au.dang.jx@renesas.com>
>
> serial: sh-sci: Skip TDxE status clear for PORT_SCI
>
> This commit skips calling clear_SCxSR() to clear the TDxE status bit for
> PORT_SCI in sci_poll_put_char() and sci_transmit_chars(), relying on hard=
ware
> to automatically clear the bit when data is written to TDR.
>
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index d577f9de62595..e4c7a3e146884 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *por=
t, unsigned char c)
> >       } while (!(status & SCxSR_TDxE(port)));
> >
> >       sci_serial_out(port, SCxTDR, c);
> > -     s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(po=
rt));
> > +     if (s->type !=3D PORT_SCI)
> > +             s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR=
_TEND(port));
> >  }
> >  #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
> >         CONFIG_SERIAL_SH_SCI_EARLYCON */
>
> [Severity: High]
> Will skipping clear_SCxSR() for all PORT_SCI ports break transmission on
> classic SuperH SCI hardware?
>
> In drivers/tty/serial/sh-sci.c, PORT_SCI is shared between DT-based Renes=
as
> RZ/G2L SCIg ports (such as renesas,r9a07g044-sci matching renesas,sci) an=
d
> classic non-DT SuperH SCI ports (SH770x, SH7750, and SH7760 registered vi=
a
> plat_sci_port with .type =3D PORT_SCI).
>
> While RZ/G2L SCIg hardware automatically clears SSR.TDRE when transmit da=
ta is
> written to TDR, classic SuperH SCI hardware does not clear SCSSR.TDRE (or
> TEND) on CPU writes to SCTDR. On classic SuperH SCI, software must read S=
CSSR
> with TDRE =3D=3D 1, write the byte to SCTDR, and then explicitly clear TD=
RE to 0
> via clear_SCxSR() before the hardware transfers SCTDR to the transmit shi=
ft
> register (SCTSR) and begins shifting.

I will introduce tdxe_autoclear to handle this for RZ/G2UL based SCI IPs


Cheers,
Biju
