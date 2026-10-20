Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792509810;
	b=re/43f0OnVOe9eWJrnQXCs3mORjd5ZLCfTfp7PbPqf21J6bFGC3PGS4KTGGxcGWxe21h
	 coZhS2kr8z9VZKMMlnxF1NjdFtshWiNDb2OXcnhoOWeXz+ElyRSzX6aLXQQnapx39TKa8
	 vGLPD7KmaXu3scdduridIjoxFHdm5EObxDIEHAvbBWXIV6yu1A1x9H4YqW34rn2qkBbQJ
	 tqnPPbiKueM0n4XesOf7gXgxyIE62aebiYKNMervgean+Klbbq4NmapZp5f4FJ/KbQvvy
	 i1L4I7fsHgfn0t+kcyQ1QkBTRzRrpQ9Ny2EUZmm091oQRsI+EI+cyyDT1VV8R0sPF0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2TMQEKRinvD4BgkADzQKnpKRCxg8EJd5D0iYYgMwZ0s=;
	b=TF4KuwpFcZmEBZdGiKN8VvDvRR/uwR/OWBvQEnPp5mLKdFrC5zZKFHmjdYGzkK43vAyb
	 CKWqeCSALJgyY/zD6NPg5MmLh9sYngJn2A+Oeexz4w5lNo66/5xtGvRdiRv/7FYXFBRh/
	 HLBvbbelKs8t5zzMQW9Rd5ycqHX6mtR6yBacJCjGu4pjQkAER+Ci8moQtLRynyKCnlUiU
	 ZnJHVMTsJligHiyShsA/Yg/gc79vK7S4Ph0SMNEelKEkd0LoNl9WrQtRsATXNWYaBREig
	 NnnAmBE6hZ8xADJij6sDHDjhEjt5K1EZpcHzuNnxqbOud83osT+0wJsWumL55qgLecQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZPnWWgxG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB66606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB66606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZPnWWgxG
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53665358476so22290381cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792509809; cv=none;
        d=google.com; s=arc-20260327;
        b=qs59WA65E5Shd7RUisEj6glpcMqdLyjN4xawLO105V6KWGVR/DJOwBHoLQ43G0uOFo
         TFAcXo/kTQ8+W4TTnZskLgz94mfB+ZSJUv7H42AgXHi9lWBcK1gUrSjSR+dloqTLMVuN
         dabM/jHx85Nzu7/r2hb3XHs5NIWsF3+c6G3V+W5zeNQFM8dxCahwSGKgLtmT5l8/q0SY
         QkRyNYfE1lgXOUieT70hNVcolKuKfKVHFKFCAzwl1dZ9SJJjr138u052VcZPy/44AwtI
         kmNfc1/7O3fZTbZ//WLnHkTECwIUGNT92kDPj12/bIKMeIfSPEO6RJTA72/VSldW2E7C
         i9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2TMQEKRinvD4BgkADzQKnpKRCxg8EJd5D0iYYgMwZ0s=;
        fh=K09mVAA5iDE1tu8qBsamFJCsxPTUs6BoV/KXWdgAULA=;
        b=WGJ1Osivi/9vpYiL9tYNmP/NER7z4DNGzItc5Xq8s8ct0yxjW9gE9Z+XFqkbVX+0F+
         zw98RfQN01IpAmDs4m0uoVHvgy/fz8/JmnTrxy1seZcRxHojd5lm4d8uIsXgw3OZEG7v
         nZxChcLb2J/xEO9+Sfo94DeFtPQif95hOFdTtMlbXH0rHsj6zpm4SVguoEeF4fpuhjZ1
         xcyaa1nPMsGQy1jKMFUqSZrSL4oc9ft0Wz8M01Mz7ep5CUhYj07QsCUYtQKYP6wPpGQH
         vLhfsW+jI7o5AqPeiigphmuNyvc8/4pncdD4VPnIx6jtaUO5yALgICe+icpeQfz9ZIHw
         +haA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509809; x=1793114609; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TMQEKRinvD4BgkADzQKnpKRCxg8EJd5D0iYYgMwZ0s=;
        b=ZPnWWgxGYNQ7alyugr3uUW3s4WEMBTibYXtruP/49FV/+hPJZ0a4wB//R9B7Ob6B85
         GRpFfr3zOAK+VjuKGN5neLMUXZoFdFKZUK6rtCJB4QNMlseLwppoAU9hyeWNeZkN9QxO
         CRtmTk0VdOb/iDQxvl3pyWxPbf0irPE2daOG5FoEVGQf5J/QOF0MmFRsLW6pbi5ynOeh
         pakJuGujiXgyedVs+bFXFZOlchE6o6S7HUhQKCuUusv4WhLjWwhaJmpNn1C3GOfMhDIY
         RG7nYqmpYALfRjtfuq6GgvX9k7lnY64jmbqIXNChfPIv/hjgvxpbXYgolAU+1Jp5nO2e
         Lm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509809; x=1793114609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TMQEKRinvD4BgkADzQKnpKRCxg8EJd5D0iYYgMwZ0s=;
        b=bOCvvE6pM8BLpER6LjjOp/+Gbcri3AgRgb9fwu+0/LyO6bjou3INZHLLMpIJt9AMPi
         cP+sUG0/N15ik/LOOItvuzogyxWNhD3CcNKFb9sPXySyZaenJl0JYMmY2iObhUnlBXcq
         EinG5aAlTYx9PyDRDVH3I3OlFultf1+QD3+Cfjkf4eFwAFcGV9jAjMyKisiIVPUneZOx
         zDWTpBAbeuIrggpUaqahO8nJy6zyYMeaBEGo2urMYWtgXpvscu19KAjAVsNn63qA9EFY
         cPpwwdj4IYl1AUpcXdShdJmPOv/P5rIDJKsUZENEv/yUDHUy1cHXSdNcKNYoRk0l7G2X
         FqBQ==
X-Gm-Message-State: AFq9FYK1sp6Usug6YhBn4fJ8zMVDvx5w8CVFbqDMbqb05g4SqLVCxfvb
	128KeLITmoIJAPagDiiOCu30+pEpkJTs1lXiM6KvdHTPg5sJO0QCSli5pZDQPyPWDzOYS4i4Cp8
	jTi+zI2p04vqhQQYfx1o5ILk9+6HyZPdX4h/p
X-Gm-Gg: AYBFou1AurjYNytHRUx3jC9LeMf+XEQXTvWNqVywA2+08fcfXe/q7A3/JSNCRGzRvom
	DMlvoP2IVT9Fci2hfukez/OUasXWA6PmgBSocI+QwUq+/m++2NTtgec71N7oIX6qP6Na6v18vxP
	sgOWJ9mzSEtj4vGYU96nDqZuk6wXezUXPUcbhdbTEpxxdxuIhdamz/in2ylfbOvOit/GzI9Kqrv
	SMA5f9+8wcx4YzF1V9GG0QX7d72wjXTAElCahUlwmxzMSoSjs8C+vSenpKHSgkp5hUp++iN+rbs
	67yB+wJk5jECBUzvPSxmNK1431VhJy8NMKL1/35G1ES/vrz+DswRdiaYSzNbTpFleGs4CiN+Zma
	+X/d7PyXZUyNh1A==
X-Received: by 2002:a05:622a:612:b0:536:8ff4:2c2b with SMTP id
 d75a77b69052e-536934ef26fmr17840221cf.57.1792509808675; Tue, 20 Oct 2026
 08:23:28 -0700 (PDT)
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
 <20261019170139.473808-3-biju.das.jz@bp.renesas.com> <sashiko-outbox-178003@kernel.org>
In-Reply-To: <sashiko-outbox-178003@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 20 Oct 2026 16:23:17 +0100
X-Gm-Features: AclHuK-08MCveBmgHFgwb756o8UH5wjdRHYCUP4_tJ97eovoqUfsB4H9A5wNi-8
Message-ID: <CADT+UeCK0n8cxm-fuJt_fGPnH4mbnZQ1PWmwjMu6_vJcQkPnzA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F4=5D_serial=3A_sh=2Dsci=3A_Don=E2=80=99t_disable_TX_o?=
	=?UTF-8?Q?n_TEI_while_the_xmit_kfifo_still_holds_data?=
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 6:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] serial: sh-sci: race on control reg and xmit_fifo in sci_tx_end_=
interrupt()
> - [Medium] serial: sh-sci: sci_tx_end_interrupt() ignores x_char and uart=
_tx_stopped()
> --
>
> commit c11148ecd71f7b39ea459c7c652a2f9e70cefdac
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> serial: sh-sci: Don=E2=80=99t disable TX on TEI while the xmit kfifo stil=
l holds data
>
> This commit checks whether the transmit kfifo is empty in
> sci_tx_end_interrupt() before clearing TE and TEIE on SCI and RSCI ports.=
 If
> data remains queued, it clears TEIE, sets TIE, and hands over to
> sci_tx_interrupt() so transmission can continue.
>
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 9eb297dbc9010..d577f9de62595 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
>
> [ ... ]
>
> > @@ -2012,6 +2016,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, =
void *ptr)
> >  {
> >       struct uart_port *port =3D ptr;
> >       struct sci_port *s =3D to_sci_port(port);
> > +     struct tty_port *tport =3D &port->state->port;
> >       const struct sci_common_regs *regs =3D s->params->common_regs;
> >       unsigned long flags;
> >       u32 ctrl;
> > @@ -2019,9 +2024,18 @@ static irqreturn_t sci_tx_end_interrupt(int irq,=
 void *ptr)
> >       if (s->type !=3D PORT_SCI && !sci_is_rsci_type(s->type))
> >               return sci_tx_interrupt(irq, ptr);
> >
> > +     ctrl =3D s->ops->read_reg(port, regs->control);
> > +     if (!kfifo_is_empty(&tport->xmit_fifo)) {
>
> [Severity: Medium]
> What happens if transmission is stopped via flow control or if a high-pri=
ority
> XON/XOFF character is pending in port->x_char when sci_tx_end_interrupt()
> runs?
>
> In sci_transmit_chars() and rsci_transmit_chars(), the transmit loop chec=
ks
> both port->x_char and uart_tx_stopped(port):
>
>         if (port->x_char) {
>                 c =3D port->x_char;
>                 port->x_char =3D 0;
>         } else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
>                 break;
>         }
>
> If uart_tx_stopped(port) is true while tport->xmit_fifo is non-empty,
> sci_tx_end_interrupt() will clear TEIE, set TIE (leaving TE set), and cal=
l
> sci_tx_interrupt() -> transmit_chars(). Because stopped is true,
> transmit_chars() breaks out of the loop without writing to the transmit d=
ata
> register and without clearing TE or re-enabling TEIE.
>
> On SCI and RSCI, starting transmission from an idle state requires a 0-to=
-1
> transition on TE alongside TIE. Leaving the transmitter idle with TE and =
TIE
> already set means a later uart_start() -> sci_start_tx() or rsci_start_tx=
()
> sees TE already set and cannot trigger a TXI interrupt, wedging transmiss=
ion.
>
> Conversely, if tport->xmit_fifo is empty but port->x_char is non-zero (qu=
eued
> via uart_send_xchar()), checking only !kfifo_is_empty(&tport->xmit_fifo) =
will
> shut down TE and TEIE without transmitting port->x_char.
>
> Should sci_tx_end_interrupt() check port->x_char ||
> (!kfifo_is_empty(&tport->xmit_fifo) && !uart_tx_stopped(port)) while hold=
ing
> the port lock?
>
> > +             uart_port_lock_irqsave(port, &flags);
> > +             ctrl &=3D ~(s->params->param_bits->teie);
> > +             ctrl |=3D s->params->param_bits->tie;
> > +             s->ops->write_reg(port, regs->control, ctrl);
> > +             uart_port_unlock_irqrestore(port, flags);
> > +             return sci_tx_interrupt(irq, ptr);
> > +     }
> > +
> >       uart_port_lock_irqsave(port, &flags);
> > -     ctrl =3D s->ops->read_reg(port, regs->control) &
> > -             ~(s->params->param_bits->te_clear);
> > +     ctrl &=3D ~(s->params->param_bits->te_clear);
> >       s->ops->write_reg(port, regs->control, ctrl);
> >       uart_port_unlock_irqrestore(port, flags);
>
> [Severity: High]
> Can reading regs->control and checking kfifo_is_empty(&tport->xmit_fifo)
> before acquiring port->lock race with concurrent updates to the control
> register and xmit_fifo?
>
> In the serial core, uart_write() holds port->lock while queuing data into
> tport->xmit_fifo and calling __uart_start() -> sci_start_tx() or
> rsci_start_tx():
>
> drivers/tty/serial/sh-sci.c:sci_start_tx()
>         ctrl =3D sci_serial_in(port, SCSCR);
>         if (s->type =3D=3D PORT_SCI)
>                 ctrl |=3D SCSCR_TE;
>         sci_serial_out(port, SCSCR, ctrl | SCSCR_TIE);
>
> drivers/tty/serial/rsci.c:rsci_start_tx()
>         ctrl =3D rsci_serial_in(port, CCR0);
>         ctrl |=3D CCR0_TIE | CCR0_TE;
>         rsci_serial_out(port, CCR0, ctrl);
>
> If sci_tx_end_interrupt() on CPU 0 reads regs->control (with TE=3D1, TEIE=
=3D1,
> TIE=3D0) and sees kfifo_is_empty(&tport->xmit_fifo) as true before acquir=
ing
> port->lock, CPU 1 can concurrently run uart_write(), enqueue bytes into
> tport->xmit_fifo, and call start_tx() to set TE and TIE in regs->control.=
 When
> CPU 0 then acquires port->lock and writes back its stale ctrl & ~te_clear=
, it
> overwrites the TIE and TE bits set by CPU 1 and disables the transmitter =
while
> newly queued data remains in tport->xmit_fifo.
>
> Similarly, any other concurrent modification to regs->control under port-=
>lock
> (such as sci_stop_tx(), rsci_stop_tx(), sci_start_rx(), sci_stop_rx(),
> rsci_stop_rx(), sci_break_ctl(), or rsci_break_ctl()) between the unlocke=
d
> read_reg() and write_reg() will be clobbered by the stale ctrl value.
>
> In addition, in the !kfifo_is_empty() branch, port->lock is dropped befor=
e
> calling sci_tx_interrupt(), which immediately re-acquires port->lock to c=
all
> s->ops->transmit_chars(port). Should port->lock be held across the entire
> read_reg(), fifo check, write_reg(), and s->ops->transmit_chars(port) seq=
uence?

Ok, will fix the code as

uart_port_lock_irqsave(port, &flags);
ctrl =3D s->ops->read_reg(port, regs->control);
if (port->x_char || (!kfifo_is_empty(&tport->xmit_fifo) &&
!uart_tx_stopped(port))) {
.....
uart_port_unlock_irqrestore(port, flags);
 return IRQ_HANDLED;
 }
....
 uart_port_unlock_irqrestore(port, flags);
return IRQ_HANDLED;
}

Cheers,
Biju
