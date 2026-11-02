Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625735;
	b=fFZNz9WlZXC+jL0ZNexQuMeyYp+jH1rDeMB0GS5q7Z4Lm/1kRhwmyXsWfZxUo7TTwX/N
	 6Eg3MHEpnqOSf6AeKAqOGX1UQIlH8HYjr/ZblPDcBX/kaRq4qUBPbq/Ldu/anHb+eN0KA
	 EpZJ5az+68gq/FPxXcZ51aPsXR3ZMgYmLLeoGz27AjJ3GjgdvjaybXT7AkvK+UHAS5lBF
	 Mo21QQYWYXmKUidfIGOwaRDiemsXhNqt4hiZNrPIta3zamTOouLtw9u1yeETpTjMHSzcK
	 bxV2hvwQXInm45mcfdRrj/hVnTl62Tewycz/A/LiZdTR2VOcQ1i/n6U0BJ5TqRjRl2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
	b=M17m8fdYxFE5DtMmPQcRztBjWKX0NidxesvmbpfiCqcNdjS0OKtwM/FmoBFOKuzeXDRp
	 oqXgmiB9aUZR6yX7tNggmQYyIcZNrP5tHtVB9fqtHpJCIin3LsRB/ob70WHuA770bT7d0
	 Raz+lTmfzt0OiMAznrc7ocXc9nGneDDOwHJ6mkCWQ/exxzgzNJVHQCTVQsO8FQNhq7Raz
	 vITULMRYRThYJBk0Pv2ffjeUR1t64eX/uZBrqHHKUd1uvl3qzdJUItO2yRc4cGQ3+UnIL
	 2ulyjQu/RST61IbFolnD7Hhk6bZ6rjWkl6Q3ZhAPC+F9T8MKdelwZgJRupSFK7ONvBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=RNhKdVGs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308D606A330
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 13:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2308D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=RNhKdVGs
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso493595066b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 05:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625733; cv=none;
        d=google.com; s=arc-20260327;
        b=b5VIXxkYfSj5Y6+e3jSwz72wzU8OH9YrRv+shRGqOg2xUd+QPhwjaGkyzfGMVhyaNY
         NK59+jEP7oE1FtYALP3z1uPUDTMWn5EYmz7qiTo3owD3EhGnKz0bEs8/ezL0M6v+qYA+
         /EDojA5gT8ZoaLbaETjUjEqjIpdknz92L249/43IL7lzka77CJz3PbTjBS5xCgbLuZEr
         Ue4cQN92oWDWeFM5C3QLGt/wVNlBn2FQrMjgZ+MfokH7fZWgnYmAJC93n9Kp/RkrW3j8
         tcyWSWdlETOatS8tXRDqWylbQQOwciUexj9FDiXx1xx+LUsIWMJdIDmfOSYl1pLk8GeX
         YrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=Sim/hqprjnNA/Co91ca0z8EJTrhFbHRuF2l1NUVOVZSCJt/s55v0NFCGMzDLq6Iuq/
         O6FOt3n/JGN6tT3zKFjkBayCb4niZDWits3l0+D5A0LGwSAudLyNUG76oeZz1+LAxyf7
         glc7mcqa07C3w1ZfizryDzfdznbxUm50TdBcZBRpYXrENFTa9FRAP67LfbBYNcYvr8Ig
         eYB0nbbqs9qJp3A+M13Ur5PtzMUJ1pbiIYHqGRHN25t3AQ6bfmyZUuBW67aLEsjmARtZ
         RB5baeBV+cMc3hB3KqNoFGPeFHu1Jme2AmY6kIAVVvefF1lQXdAhBVmvFxVmOZQ7mZSL
         gcHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793625733; x=1794230533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        b=RNhKdVGs5PYMoeq8JdrBdDJG4VM+qxolKdhSOUsA1Fav1UrFyEaB+koW0GTBpYhYtx
         hh3mU1s0MqAq8oqDXbTX3MnHm+yqUg3GHQoo8XoLpQ3Nv5K68j8lwLsFx6YTS+c/Vg6X
         rKdq1xOu77LZtRMMs5PP3x3Mhw72HHVANerT5dRM+CH2GRdVqwIgfVrGCYBtH0lejBCA
         eqBN+2zZcTJ1HqUXtyB1p7KY6n3oxcvnQFYzdPSMRaarrYCZAymSWtAfjr5g98r350bh
         T1eosOqtvFfvblJvfIVX3Iqr2NErAq+GHpK4nVGOW4/2iPNZTjPwI8xJSyM3qpvl9vAc
         MAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625733; x=1794230533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        b=TBVmfyz4Weav0VEGknTunSk2EwJAVzqc5czC+X/dYhEJkflUOsh5fQc2kIwsVnSOzd
         c0wF3aLKxx0izeP7CNdpBqix8A5FfwCx6Uvvk+pY6p05CtuwMBBTeK0tyDPl8Hi3YlsY
         6GtTDGIh903tVV1zXhRdSakDIjDf8K+4o5ElwZX+J8DXMnjMJWnquPNNXJJcBr+D0CSc
         wwq6X/ExJT2aEqLqaN0y2eYefyCe6l8me/KHWiGe+Hc8z5LVBH5WjNkE8oDwl+LeUsoh
         4pRSaRJnAmcu2Mm2Rfr4DlUOcDR9K0WhLKOWuJ3Fote/bxZ4ILCArW9hyofu/oge0JDe
         v1UQ==
X-Gm-Message-State: APuU4Z/U5Knf0Cg4/pMiRt1wuGr9Fpu5puahhynj5LmiswENkJ6tgGh7
	/90l6O0u0Vr5d3xUYXC21Si+0J0Rjp+n4wtwhinGuHlOvBPQQFlNrk5hP9743BrsBDUsQLw6ifO
	pDy8pVIi12h5h82iAt6+gr4ABN6gmuzE0+F+woqLcdDYGycBDNwcLuylyRjGB
X-Gm-Gg: AYBFou1U10kYkQc8sqdfBipq4ZfRMQr5ktxb3us5Bv1cecnJ7qV6QajZGQmHghjc/jb
	nvFmtVYClia1DFMa7XenSLZr/nyKBb4uW1xeIS7yUONUo7FknbT2qZn4ZKghmIcOPIJYh/vT0Ae
	4mYohrAnEvowIbHX2oMcvPdaPcqmo/0RQjNQfbpG0Nu14rxDhTvaSzZooOqVZe9JBX0bEHffwql
	w86bhl3j3t+B/7ot2B9P/BTvfnD0ypPeSJdWFm5GyorSuoBVW/dBr6sUyuR9tEeQ+7ggCfU6LlA
	z4f+Itrm4cCFcyJJdcQNFpZ+87NH07nXPuTfd0cpwuu7UGLHxw8x69xQfCCUhkGY+rtLQEfIj7f
	OmOUVHIYpvfLGAAhHyzNjpF8hP6qrM8pKRuHsassZmE/E0Ueeer/eOVhIFuwveh9sT9hD+A==
X-Received: by 2002:a17:907:1b29:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c4ca7ab18d6mr821555366b.38.1793625733404; Mon, 02 Nov 2026
 05:22:13 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net> <sashiko-outbox-193478@kernel.org>
In-Reply-To: <sashiko-outbox-193478@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 17:21:57 +0400
X-Gm-Features: AclHuK-lcmki2jLa3eVCETCCdd8_r5dRb0CE_o5lxTpfWFSk-b6dl3cOH_O5FPM
Message-ID: <CAKTNdwFvL9+GT1xBG8LNFpHYYn5Un4HSLCfCzx3DKgvBNPfO+w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: typec: fusb302: incomplete RX FIFO drain in fusb302_pd_read=
_message()
> --
>
> commit 2a38943c4db3b547e9d3ad8f9cba90c33a8b3dfa
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
>
> This commit drops Get_Source_Cap_Extended messages read from the FUSB302 =
RX
> FIFO in fusb302_pd_read_message() because the hardware mistakes them for
> GoodCRC messages and queues them in the FIFO without sending a GoodCRC or
> raising an interrupt.
>
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index 3319f6a2b0c9b..96dc48250d6a6 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb30=
2_chip *chip,
> >       fusb302_log(chip, "PD message header: %x", msg->header);
> >       fusb302_log(chip, "PD message len: %d", len);
> >
> > +     /*
> > +      * The chip only decodes the low four bits of the message type, s=
o it
> > +      * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it ne=
ither
> > +      * acknowledges it nor raises GCRCSENT, yet still queues it in th=
e RX
> > +      * FIFO. Without a GoodCRC the partner never considers it deliver=
ed and
> > +      * will retry and then soft reset, so it must not be answered.
> > +      */
> > +     if ((!len) &&
> > +         (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GET_SOURCE_CAP=
_EXT)) {
> > +             fusb302_log(chip, "dropping unacknowledged PD message");
> > +             return ret;
> > +     }
>
> [Severity: High]
> When fusb302_pd_read_message() drops a PD_CTRL_GET_SOURCE_CAP_EXT message=
 and
> returns early here, doesn't that leave any retried copies and the actual
> interrupt-triggering PD message unread in FUSB_REG_FIFOS?
>
> Because the FUSB302 does not raise an interrupt when it queues
> PD_CTRL_GET_SOURCE_CAP_EXT, the partner will retry it (queueing up to 3 c=
opies
> in FUSB_REG_FIFOS in PD 3.0) before sending a follow-up message such as
> Soft_Reset that finally raises FUSB_REG_INTERRUPTB_GCRCSENT (or a GoodCRC=
 for
> a local transmission that raises FUSB_REG_INTERRUPTA_TX_SUCCESS).
>
> In drivers/usb/typec/tcpm/fusb302.c, fusb302_irq_work() clears the interr=
upt
> status registers on read and only calls fusb302_pd_read_message() once fo=
r
> that event:
>
>         if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
>                 fusb302_log(chip, "IRQ: PD tx success");
>                 ret =3D fusb302_pd_read_message(chip, &pd_msg);
>                 ...
>         }
>         ...
>         if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
>                 fusb302_log(chip, "IRQ: PD sent good CRC");
>                 ret =3D fusb302_pd_read_message(chip, &pd_msg);
>                 ...
>         }
>
> If fusb302_pd_read_message() returns after popping only the first
> PD_CTRL_GET_SOURCE_CAP_EXT frame, the remaining retries and the message t=
hat
> actually triggered GCRCSENT or TX_SUCCESS stay behind in the RX FIFO and =
are
> not delivered to TCPM on this interrupt.
>
> Should fusb302_pd_read_message() loop back to read the next message from
> FUSB_REG_FIFOS whenever it drops an unacknowledged PD_CTRL_GET_SOURCE_CAP=
_EXT
> message?

Addressed separately in [1]

[1] https://lore.kernel.org/linux-usb/20261102-fusb302-drain-rxfifo-v1-1-bd=
9b232ab345@flipper.net/
